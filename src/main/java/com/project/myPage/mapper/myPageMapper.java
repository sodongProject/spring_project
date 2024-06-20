package com.project.myPage.mapper;

import com.project.entity.Users;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface myPageMapper {

// 로그인 유저 정보 찾기
    Users findOne(String account);

    // 비밀번호 확인
    String confirmPassword(String account);

    // 핸드폰 번호 수정
    void editUserPhoneNumber(String account, String ph);

    // 주소 수정
    void editUserAdress(String account, String ad);

    // 비번 수정
    void editUserPassword(String account, String pw);

}
