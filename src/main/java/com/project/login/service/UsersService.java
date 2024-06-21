package com.project.login.service;

import com.project.login.dto.SignInDto;
import com.project.login.dto.SignUpDto;
import com.project.login.entity.Users;
import com.project.login.mapper.UsersMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import static com.project.login.service.LoginResult.*;

@Service
@RequiredArgsConstructor
@Slf4j
public class UsersService {

    private final UsersMapper usersMapper;
    private final PasswordEncoder encoder;

    // 회원가입 중간처리(암호화)
    public boolean join(SignUpDto dto) {
        // dto를 엔터티로 변환하기
        Users users = dto.toEntity();

        // 비밀번호를 인코딩_암호화
        String encodedPassword = encoder.encode(dto.getPassword());
        System.out.println("encodedPassword = " + encodedPassword);
        users.setPassword(encodedPassword);

        return usersMapper.save(users);
    }

    // 로그인 검증 처리
    public LoginResult authenticate(SignInDto dto) {

        // 회원가입 했는가
        String account = dto.getAccount();
        Users foundUser = usersMapper.findOne(account);

        // 회원가입 안했다면
        if (foundUser == null) {
            log.info("{} - 회원가입이 필요합니다", account);
            return NO_ACC;
        }

        // 비밀번호 일치한가 검사
        String inputPassword = dto.getPassword(); // -> 가입한 비번
        String originPassword = foundUser.getPassword(); // -> DB에 저장된 암호화된 비번

        // 암호화된 비밀번호와 매칭
        if (!encoder.matches(inputPassword, originPassword)) {
            log.info("비밀번호 불일치");
            return NO_PW;
        }
        log.info("{}님 로그인 성공", foundUser.getUserName());
        return SUCCESS;
    }

    // 아이디, 이메일 중복검사
    public boolean checkIdentifier(String type, String keyword){
        return usersMapper.existsById(type, keyword);
    }
}
