package com.project.myPage.controller;

import com.project.entity.Users;
import com.project.myPage.dto.response.LoggedInUserInfoDto;
import com.project.myPage.service.MyPageService;

import lombok.*;
import lombok.extern.slf4j.Slf4j;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/myPage")
@Slf4j
@RequiredArgsConstructor
public class MyPageController {

    private final MyPageService myPageService;



    // @ 마이페이지 로그인상태로 진입 가능


    /**
     * 개인 정보 조회 요청
     * @param session 세션 정보
     * @param model 전송 데이터
     * @return jsp
     */
    @GetMapping("/view")
    String view(HttpSession session, Model model) {


        myPageService.saveLoginUser("mmm", session);
        LoggedInUserInfoDto loggedInUserInfoDto = myPageService.findOneByAccount(session);
        System.out.println("loggedInUserInfoDto = " + loggedInUserInfoDto);

        model.addAttribute("dto", loggedInUserInfoDto);
        return "myPage/myPage-viewInformations";
    }



    /**
     * 비밀번호 검증 요청
     * @param session 세션 정보
     * @param model 전송 데이터 - result: 검증 true/false
     * @return jsp
     */
    @GetMapping("/confirmPw")
    String confirmPw(HttpSession session, Model model) {
        myPageService.saveLoginUser("mmm", session);
        return "myPage/myPage-requiredPassword";
    }

    @PostMapping("/confirmPw")
    String confirmPw(HttpSession session, String inputPw, Model model, HttpServletRequest request) {
        myPageService.saveLoginUser("mmm", session);

        boolean isCorrect = myPageService.confirmPassword(session, inputPw);
        String referer = request.getHeader("Referer");
        if(isCorrect){
//            myPageService.modifyPassword(session, inputPw);
            return "redirect:"+ referer;
        }
        // 비번 일치 여부 전송
        model.addAttribute("result", isCorrect);
//        return "myPage/myPage-modifyInformations";
//        return "redirect:/confirmPw";
        return "redirect:"+ referer;
    }


    /**
     * 휴대폰 번호 수정
     * @param session 세션 정보
     * @param newPhNum 유저에게 받은 새 휴대폰 번호
     * @return jsp
     */
    @PostMapping("/modifyPhNum")
    String modifyPhNum (HttpSession session, String newPhNum){

        myPageService.modifyPhoneNumber(session,newPhNum);

        return "myPage/myPage-modifyInformations";

    }

    /**
     * 주소 수정
     * @param session 세션 정보
     * @param newAdress 유저에게 받은 새 주소
     * @return jsp
     */
    @PostMapping("/modifyAdress")
    String modifyAdress (HttpSession session, String newAdress){

        myPageService.modifyPhoneNumber(session,newAdress);

        return "myPage/myPage-modifyInformations";

    }


    //회원 탈퇴
    @PostMapping("/withdrawal")
    String withdrawal(HttpSession session){
        myPageService.userWithdrawal(session);
        return "redirect:/";
    }



}
