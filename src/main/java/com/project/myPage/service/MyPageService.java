package com.project.myPage.service;


import com.project.entity.Users;
import com.project.myPage.dto.response.LoggedInUserInfoDto;
import com.project.myPage.mapper.myPageMapper;
import com.project.util.LoginUserInfoDto;
import com.project.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
@RequiredArgsConstructor
@Slf4j
public class MyPageService {


    private myPageMapper myPageMapper;

    /**
     * 세션 정보로 해당 유저 찾기 요청
     * @param session 세션 정보
     * @return 세션에 저장된 유저 엔터티
     */
    private Users findUserBySession (HttpSession session){
        LoginUserInfoDto loginUserDto = LoginUtil.getLoggedInUser(session);
        String account = loginUserDto.getAccount();
        return myPageMapper.findOne(account);
    }

    /**
     * 세션 어카운트 찾기 요청
     * @param session 세션 정보
     * @return 세션에 저장된 유저 account
     */
    private String getSessionAccount(HttpSession session){
        return findUserBySession(session).getAccount();
    }

    // 로그인 유저 정보 찾기

    /**
     * 로그인 유저 전체 정보
     * @param session 세션 정보
     * @return 로그인 유저 개인정보 LoggedInUserInfoDto로 반환
     */
    public LoggedInUserInfoDto findOneByAccount(HttpSession session){

        Users findedUser = findUserBySession(session);

        return LoggedInUserInfoDto.builder()
                .name(findedUser.getUserName())
                .email(findedUser.getEmail())
                .adress(findedUser.getAddress())
                .imgAdress(findedUser.getProfile_image())
                .gender(findedUser.getGender())
                .password(findedUser.getPassword())
                .phoneNumber(findedUser.getPhoneNumber())
                .temperature(findedUser.getTemperature())
                .userPoint(findedUser.getRemainedPoint())
                .build();
    }



    /**
     * 비밀번호 검증
     * @param session 세션 정보
     * @param inputPw 유저가 입력한 비밀번호
     * @return 기존 비밀번호와 일치 여부 true/false
     */
    public boolean confirmPassword(HttpSession session, String inputPw){
        Users findedUser = findUserBySession(session);
        String correctPw = findedUser.getPassword();

        if (!inputPw.equals(correctPw)){
            return false;
        }
        return true;

    }


    /**
     * 비밀번호 수정
     * @param session 세션 정보
     * @param newPw 유저에게 입력받은 새 비밀번호
     */
    public void modifyPassword(HttpSession session, String newPw){
        myPageMapper.editUserPassword(getSessionAccount(session),newPw);
    }


    /**
     * 휴대폰 번호 수정
     * @param session 세션 정보
     * @param newPhoneNum 유저에게 입력받은 새 휴대폰 번호
     */
    public void modifyPhoneNumber(HttpSession session, String newPhoneNum){
        myPageMapper.editUserPhoneNumber(getSessionAccount(session),newPhoneNum);
    }

    /**
     * 주소 수정
     * @param session 세션 정보
     * @param newAdress 유저에게 입력받은 새 주소
     */
    public void modifyAdress(HttpSession session, String newAdress){
        myPageMapper.editUserAdress(getSessionAccount(session),newAdress);
    }



    public void userWithdrawal(HttpSession session){
        myPageMapper.withdrawal(getSessionAccount(session));
    }



}
