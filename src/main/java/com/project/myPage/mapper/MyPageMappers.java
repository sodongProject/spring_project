package com.project.myPage.mapper;

import com.project.login.entity.Users;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MyPageMappers {


    // 로그인 유저 정보 찾기
    Users findOne(String account);

    // 비밀번호 확인
    String confirmPassword(String account);

    // 이메일 수정
    void editUserEmail(String account, String newEmail);

    // 프로필 이미지 수정
    void editUserProfile (String account, String url);

    // 핸드폰 번호 수정
    void editUserPhoneNumber(String account, String ph);

    // 주소 수정
    void editUserAdress(String account, String ad);

    // 비번 수정
    void editUserPassword(String account, String pw);

    // 회원 탈퇴
    void withdrawal(String account);



    // 포인트 조회
    double viewPoints(String account);

    // 포인트 충전
    void rechargePoints(@Param("account") String account, @Param("amount") double amount);

    // 포인트 환전
    void exchangePoints(@Param("account") String account, @Param("amount") double amount);

}
