package com.project.login.service;

import com.project.login.dto.LoginUserInfoDto;
import com.project.login.dto.SignInDto;
import com.project.login.dto.SignUpDto;
import com.project.login.entity.Users;
import com.project.login.mapper.UsersMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

import static com.project.login.service.LoginResult.*;

@Service
@RequiredArgsConstructor
@Slf4j
public class UsersService {

    private final UsersMapper usersMapper;
    private final PasswordEncoder encoder;

    // 회원가입 중간처리(암호화)
    public boolean join(SignUpDto dto) {
        Users users = dto.toEntity();
        String encodedPassword = encoder.encode(dto.getPassword());
        users.setPassword(encodedPassword);
        return usersMapper.save(users);
    }

    // 로그인 검증 처리
    public LoginResult authenticate(SignInDto dto, HttpSession session) {
        String account = dto.getAccount();
        log.info("Authenticating account: {}", account);

        Users foundUser = usersMapper.findOne(account);
        log.info("Found user: {}", foundUser);

        if (foundUser == null) {
            log.info("{} - 회원가입이 필요합니다", account);
            return NO_ACC;
        }

        String inputPassword = dto.getPassword();
        String originPassword = foundUser.getPassword();

        log.info("Input password: {}", inputPassword);
        log.info("Stored password: {}", originPassword);

        if (!encoder.matches(inputPassword, originPassword)) {
            log.info("비밀번호 불일치");
            return NO_PW;
        }
        log.info("{}님 로그인 성공했습니다.", foundUser.getUserName());

        // 세션의 수명
        int maxInactiveInterval = session.getMaxInactiveInterval();
        session.setMaxInactiveInterval(60 * 60 * 24 * 30); // 30일
        log.debug("session time: {}", maxInactiveInterval);

        session.setAttribute("login", foundUser);
        //session.setAttribute("login", new LoginUserInfoDto(foundUser));
        return SUCCESS;
    }

    // 아이디, 이메일 중복검사
    public boolean checkIdentifier(String type, String keyword) {
        return usersMapper.existsById(type, keyword);
    }
}
