package com.project.login.service;

import com.project.login.dto.AutoLoginDto;
import com.project.login.dto.LoginUserInfoDto;
import com.project.login.dto.SignInDto;
import com.project.login.dto.SignUpDto;
import com.project.login.entity.Users;
import com.project.login.mapper.UsersMapper;
import com.project.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.time.LocalDateTime;

import static com.project.login.service.LoginResult.*;
import static com.project.util.LoginUtil.AUTO_LOGIN_COOKIE;
import static com.project.util.LoginUtil.LOGIN;

@Service
@RequiredArgsConstructor
@Slf4j
public class UsersService {

    private final UsersMapper usersMapper;
    private final PasswordEncoder encoder;

    // 회원가입 중간처리(암호화)
    public boolean join(SignUpDto dto, String profilePath) {
        //dto 엔터티 변환
        Users users = dto.toEntity();
        users.setProfileImage(profilePath);

        //비밀번호 암호화
        String encodedPassword = encoder.encode(dto.getPassword());
        users.setPassword(encodedPassword);
        return usersMapper.save(users);
    }

    // 로그인 검증 처리
    public LoginResult authenticate(SignInDto dto, HttpSession session, HttpServletResponse response) {
        String account = dto.getAccount();
        log.info("Authenticating account: {}", account);

        Users foundUser = usersMapper.findOne(account);
        log.info("Found user: {}", foundUser);

        if (foundUser == null) {
            log.info("{} - 회원가입이 필요합니다", account);
            return NO_ACC;
        }

        //일치한가
        String inputPassword = dto.getPassword(); //입력한 비번
        String originPassword = foundUser.getPassword(); //db저장된 비번

        log.info("Input password: {}", inputPassword);
        log.info("Stored password: {}", originPassword);

        // 비교
        if (!encoder.matches(inputPassword, originPassword)) {
            log.info("비밀번호 불일치");
            return NO_PW;
        }

        // 자동로그인 추가 처리
        if(dto.isAutoLogin()){
            //1. 자동 로그인 쿠키 생성(중복x)
            String sessionId = session.getId();
            Cookie autoLoginCookie = new Cookie(AUTO_LOGIN_COOKIE, sessionId);
            // - 쿠키 설정
            autoLoginCookie.setPath("/"); //쿠키 사용 경로
            autoLoginCookie.setMaxAge(60 * 60 * 24 * 90); // 자동로그인 유지(90일)
            //2. 쿠키 클라이언트 전송
            response.addCookie(autoLoginCookie);
            //3. 쿠키값 DB저장
            usersMapper.updateAutoLogin(
                    AutoLoginDto.builder()
                            .sessionId(sessionId)
                            .limitTime(LocalDateTime.now().plusDays(90))
                            .account(account)
                            .build()
            );

        }

        maintainLoginState(session, foundUser);
        //session.setAttribute("login", new LoginUserInfoDto(foundUser));
        return SUCCESS;
    }

    public static void maintainLoginState(HttpSession session, Users foundUser) {
        log.info("{}님 로그인 성공했습니다.", foundUser.getUserName());

        // 세션의 수명
        int maxInactiveInterval = session.getMaxInactiveInterval();
        session.setMaxInactiveInterval(60 * 60 * 24); // 세션 수명 24시간
        log.debug("session time: {}", maxInactiveInterval);

        session.setAttribute(LOGIN, new LoginUserInfoDto(foundUser));
    }

    // 아이디, 이메일 중복검사
    public boolean checkIdentifier(String type, String keyword) {
        return usersMapper.existsById(type, keyword);
    }

    //자동로그인 제거
    public void autoLoginClear(HttpServletRequest request, HttpServletResponse response) {
        //1. 쿠키 제거
        Cookie c = WebUtils.getCookie(request, AUTO_LOGIN_COOKIE);
        if( c != null){
            c.setPath("/");
            c.setMaxAge(0); // 쿠키 0
            response.addCookie(c);
        }
        //2. DB 자동로그인 컬럼 원상태로 복구
        usersMapper.updateAutoLogin(
                AutoLoginDto.builder()
                        .sessionId("none")
                        .limitTime(LocalDateTime.now())
                        .account(LoginUtil.getLoggedInUserAccount(request.getSession()))
                        .build()
        );
    }
}
