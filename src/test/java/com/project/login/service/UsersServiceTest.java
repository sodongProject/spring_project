package com.project.login.service;

import com.project.entity.Gender;
import com.project.login.dto.SignInDto;
import com.project.login.dto.SignUpDto;
import com.project.login.entity.Users;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class UsersServiceTest {

    @Autowired
    UsersService usersService;

    @Test
    @DisplayName("회원가입하면 비밀번호가 인코딩된다")
    void joinTest1() {
        SignUpDto dto = SignUpDto.builder()
                .account("abc123")
                .email("abc@aaa.com")
                .password("abc123")
                .userName("에이비씨")
                .gender("F")  // 문자열로 설정
                .phoneNumber("010-1111-0000")
                .address("서울시 대흥동")
                .profileImage(null)
                .build();

        //when
        boolean flag = usersService.join(dto);
        //then
        assertTrue(flag);
    }

    @Test
    @DisplayName("회원가입하면 특수문자가 포함된 비밀번호도 인코딩된다")
    void joinTest2() {
        SignUpDto dto = SignUpDto.builder()
                .account("dogdog123")
                .email("dog@aaa.com")
                .password("abc123!")
                .userName("강아지")
                .gender("F")  // 문자열로 설정
                .phoneNumber("010-1111-0000")
                .address("서울시 강남구")
                .profileImage(null)
                .build();

        //when
        boolean flag = usersService.join(dto);
        //then
        assertTrue(flag);
    }


    @Test
    @DisplayName("id가 존재하지 않는 경우 테스트")
    void noAccountTest(){
            //given
            SignInDto dto = SignInDto.builder()
                    .account("lalalalala")
                    .build();
            //when
             LoginResult result = usersService.authenticate(dto);

            //then
            assertEquals(LoginResult.NO_ACC, result);
        }


    @Test
    @DisplayName("pw가 존재하지 않는 경우 테스트")
    void noPasswordTest(){
        //given
        SignInDto dto = SignInDto.builder()
                .account("abc123")
                .password("alalalala")
                .build();
        //when
        LoginResult result = usersService.authenticate(dto);

        //then
        assertEquals(LoginResult.NO_PW, result);
    }

    @Test
    @DisplayName("로그인 성공 테스트")
    void noSuccessTest(){
        //given
        SignInDto dto = SignInDto.builder()
                .account("abc123")
                .password("abc123")
                .build();
        //when
        LoginResult result = usersService.authenticate(dto);

        //then
        assertEquals(LoginResult.SUCCESS, result);
    }

    @Test
    @DisplayName("비밀번호 숫자 및 특수번호 넣어도 성공하는 테스트")
    void loginSuccessTest() {
        //given
        SignInDto dto = SignInDto.builder()
                .account("user1234")
                .password("password123!") // 패턴에 맞는 비밀번호
                .build();

        //when
        LoginResult result = usersService.authenticate(dto);

        //then
        assertEquals(LoginResult.SUCCESS, result);
    }


    @Test
    @DisplayName("아이디 중복이 아닐 경우 true가 나오는지 테스트")
    void checkIdentifierTest() {
        // 중복이 아닌 아이디
        String type = "account";
        String nonDuplicateAccount = "uniqueUser1234";

        // 중복인 아이디 (사전에 중복된 계정이 있는지 확인)
        String duplicateAccount = "catcat123";

        // 중복이 아닌 경우 true가 나오는지 확인
        boolean isNonDuplicateAccount = usersService.checkIdentifier(type, nonDuplicateAccount);
        assertFalse(isNonDuplicateAccount, "중복되지 않은 아이디가 중복된 것으로 나타났습니다.");

        // 중복인 경우 false가 나오는지 확인
        boolean isDuplicateAccount = usersService.checkIdentifier(type, duplicateAccount);
        assertTrue(isDuplicateAccount, "중복된 아이디가 중복되지 않은 것으로 나타났습니다.");
    }






}
