package com.project.login.mapper;

import com.project.entity.Gender;
import com.project.login.entity.Users;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class UsersMapperTest {

    @Autowired
    UsersMapper usersMapper;

    @Autowired
    PasswordEncoder encoder;

    @Test
    @DisplayName("회원가입에 성공해라")
    void saveTest() {
        Users users = Users.builder()
                .account("aaabbb11")
                .email("aaa@bbb.com")
                .password("aaabbb")
                .userName("에이")
                .gender(Gender.F)
                .phoneNumber("010-0000-0000")
                .address("경기도 어딘가")
                .profileImage("imageasssss")
                .build();

        boolean flag = usersMapper.save(users);

        assertTrue(flag);
    }

    @Test
    @DisplayName("회원가입에 성공해라")
    void saveTest2() {
        Users users = Users.builder()
                .account("bbbaaa11")
                .email("bbb@aaa.com")
                .password("bbbaaa")
                .userName("비이")
                .gender(Gender.M)
                .phoneNumber("010-0000-0000")
                .address("경기도 어딘가")
                .profileImage("imageasssssoooo")
                .build();

        boolean flag = usersMapper.save(users);

        assertTrue(flag);
    }

    @Test
    @DisplayName("account가 bbbaaa11인 사람의 userName은 비이이다.")
    void findOne() {
        // given
        String account = "bbbaaa11";
        // when
        Users foundAccount = usersMapper.findOne(account);
        // then
        assertEquals("비이", foundAccount.getUserName());
    }

    @Test
    @DisplayName("계정명이 dogdog123인 회원의 중복확인 결과 true이다")
    void existsTest(){
            //given
            String acc = "dogdog123";
            //when
            boolean flag = usersMapper.existsById("account", acc);
            //then
            assertTrue(flag);
        }

    @Test
    @DisplayName("계정명이 jhsij42인 회원은 중복확인 결과가 false이다.")
    void existsTest2() {
        //given
        String acc = "jhsij42";
        //when
        boolean flag = usersMapper.existsById("account", acc);
        //then
        assertFalse(flag);
    }

    @Test
    @DisplayName("암호를 인코딩한다")
    void encodingTest(){
            //given
            String rawPassword = "abc123";
            //when
            String encodedPassword = encoder.encode(rawPassword);
            //then
            System.out.println("encodedPassword = " + encodedPassword);
        }

    @Test
    @DisplayName("회원가입에 성공해라")
    void savePWTest() {
        Users users = Users.builder()
                .profileImage(null) // 선택 사항으로 null 가능
                .userName("홍길동")
                .account("user1234")
                .email("user@example.com")
                .password("password123!") // 패턴에 맞는 비밀번호
                .phoneNumber("010-1234-5678")
                .gender(Gender.M) // Gender enum에 맞는 값 사용
                .address("서울시 강남구")
                .build();

        boolean flag = usersMapper.save(users);

        assertTrue(flag);
    }




}
