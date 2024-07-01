package com.project.myPage.controller;

import com.project.myPage.dto.request.*;
import com.project.myPage.dto.response.LoggedInUserInfoDto;
import com.project.myPage.service.MyPageService;

import lombok.*;
import lombok.extern.slf4j.Slf4j;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/myPage")
@Slf4j
@RequiredArgsConstructor
public class MyPageController {

    private final MyPageService myPageService;


    // @ 마이페이지 로그인상태로 진입 가능


    /**
     * LoggedInUserInfoDto 모델 저장 - getMapping
     * @param session
     * @param model
     */
    private void setLoggedInUserModel(HttpSession session,Model model){
        LoggedInUserInfoDto loggedInUserInfoDto = myPageService.findOneByAccount(session);
        model.addAttribute("dto", loggedInUserInfoDto);
    }

    /**
     * LoggedInUserInfoDto 모델 저장 - postMapping
     * @param session
     * @param redirectAttributes
     */
    private void setLoggedInUserRedirectionAttr(HttpSession session,RedirectAttributes redirectAttributes){
        LoggedInUserInfoDto loggedInUserInfoDto = myPageService.findOneByAccount(session);
        redirectAttributes.addFlashAttribute("dto", loggedInUserInfoDto);
    }

    /**
     * 개인 정보 조회 요청
     * @param session 세션 정보
     * @param model   전송 데이터
     * @return jsp
     */
    @GetMapping("/view")
    public String view(HttpSession session, Model model) {

        myPageService.saveLoginUser("mmm", session);
        setLoggedInUserModel(session,model);
        return "myPage/myPage-viewInformations";
    }


    /**
     * 패스워드 검증 여부
     * @param isConfirmed 검증 파라미터
     * @param ref 검증 true시 요청 주소
     * @return false시 검증 요청 페이지로이동
     */
    private String isPwConfirmedBefore(boolean isConfirmed, String ref, Model model){
        model.addAttribute("ref", ref);
        if (isConfirmed){
            return "myPage/myPage-" + ref;
        }
        return "myPage/myPage-requiredPassword";
    }

    /**
     * 개인 정보 수정 전 비밀번호 검증 요청
     * @param session
     * @return - 비밀번호 검증 페이지
     */
    @GetMapping("/modifyInformations")
    public String modifyInformationsPwConfirm(HttpSession session, boolean isConfirmed, Model model){
//        myPageService.saveLoginUser("mmm", session);
        String ref = "modifyInformations";
        return isPwConfirmedBefore(isConfirmed, ref,model);
    }

    /**
     * 검증 후 개인정보 페이지 요청
     * @param session
     * @param inputValue
     * @param redirectAttributes 검증 result false
     * @return 개인 정보 요청
     */
    @PostMapping("/modifyInformations")
    public String modifyInformations(HttpSession session,String inputValue,  RedirectAttributes redirectAttributes){
        myPageService.saveLoginUser("mmm", session);
        boolean isCorrect = myPageService.confirmPassword(session, inputValue);
        System.out.println("isCorrect = " + isCorrect);
//        session.setAttribute("ref", "modifyInformations");
//        redirectAttributes.addFlashAttribute("ref","modifyInformations" );

        if (!isCorrect) {
            redirectAttributes.addFlashAttribute("result",false);
            return "redirect:/myPage/modifyInformations?isConfirmed=false";
        }

        setLoggedInUserRedirectionAttr(session,redirectAttributes);
        redirectAttributes.addFlashAttribute("result",true);
        return "redirect:/myPage/modifyInformations?isConfirmed=true";
    }

    /**
     * 비밀번호 수정
     * @param session  세션 정보
     * @param modifyPasswordDto 유저에게 받은 새 비밀번호
     * @return jsp
     */
    @PostMapping("/modifyPassword")
    public String modifyPassword(HttpSession session, ModifyPasswordDto modifyPasswordDto,RedirectAttributes redirectAttributes) {

        myPageService.modifyPassword(session,modifyPasswordDto.getNewPassword());
        setLoggedInUserRedirectionAttr(session,redirectAttributes);

        return "redirect:/myPage/modifyInformations?isConfirmed=true";
    }
    /**
     * 휴대폰번호 수정
     * @param session  세션 정보
     * @param modifyPhoneNumberDto 유저에게 받은 새 휴대폰번호
     * @return jsp
     */
    @PostMapping("/modifyPhNum")
    public String modifyPassword(HttpSession session, ModifyPhoneNumberDto modifyPhoneNumberDto, RedirectAttributes redirectAttributes) {

        String newPhoneNumber = modifyPhoneNumberDto.getPhoneNumFront() + modifyPhoneNumberDto.getPhoneNumMid() + modifyPhoneNumberDto.getPhoneNumLast();

        myPageService.modifyPhoneNumber(session, newPhoneNumber);
        setLoggedInUserRedirectionAttr(session,redirectAttributes);

        return "redirect:/myPage/modifyInformations?isConfirmed=true";
    }

    /**
     * 주소 수정
     * @param session   세션 정보
     * @param modifyAdressDto 유저에게 받은 새 주소
     * @return jsp
     */
    @PostMapping("/modifyAddress")
    public String modifyAdress(HttpSession session, ModifyAdressDto modifyAdressDto,RedirectAttributes redirectAttributes) {

        myPageService.modifyAdress(session, modifyAdressDto.getNewAddress());
        setLoggedInUserRedirectionAttr(session,redirectAttributes);

        return "redirect:/myPage/modifyInformations?isConfirmed=true";

    }


    /**
     * 포인트 조회 전 검증 페이지 요청
     * @param session 세션
     * @param model jsp에 전달
     * @return jsp
     */
    @GetMapping("/viewPoint")
    public String viewPoint(HttpSession session, Model model, boolean isConfirmed){
//        myPageService.saveLoginUser("mmm", session);
        String ref = "viewPoint";

       return isPwConfirmedBefore(isConfirmed,ref,model);

    }

    /**
     * 비밀번호 검증 후 포인트 조회 페이지 요청
     * @param inputValue 사용자가 입력한 검증 비밀번호
     * @param session 세션
     * @param redirectAttributes jsp에 전달
     * @return
     */
    @PostMapping("/viewPoint")
    public String viewPointPost(String inputValue, HttpSession session, RedirectAttributes redirectAttributes){
        redirectAttributes.addFlashAttribute("points", myPageService.viewPoints(session));
        boolean isCorrect = myPageService.confirmPassword(session,inputValue);

        if(!isCorrect){
            redirectAttributes.addFlashAttribute("result",false);
            return "redirect:/myPage/viewPoint?isConfirmed=false";
        }
        redirectAttributes.addFlashAttribute("result",true);
        return "redirect:/myPage/viewPoint?isConfirmed=true";

    }

    /**
     * 포인트 충전 요청
     * @param session 세션
     * @param rechargingPointDto 충전 요청 금액
     * @param redirectAttributes 충전 요청 후 잔액 전송
     * @return 포인트 조회 페이지 리다이렉트
     */
    @PostMapping("/rechargePoint")
    public String rechargePointPost(HttpSession session, RechargingPointDto rechargingPointDto, RedirectAttributes redirectAttributes){

        redirectAttributes.addFlashAttribute("points", myPageService.pointsRecharge(session, rechargingPointDto.getRePointsAmount()));
        return "redirect:/myPage/viewPoint?isConfirmed=true";
    }

    /**
     * 포인트 환전 요청
     * @param session 세션
     * @param exchangingPointDto 환전 요청 금액
     * @param redirectAttributes 환전 요청 후 잔액 전송
     * @return 포인트 조회 페이지 리다이렉트
     */
    @PostMapping("/exchangePoint")
    public String exchangePointPost(HttpSession session, ExchangingPointDto exchangingPointDto,RedirectAttributes redirectAttributes){
        double amount = exchangingPointDto.getExPointsAmount();
        boolean isPossible = myPageService.isPossibleExchange(session,amount);
        if(!isPossible){
            redirectAttributes.addFlashAttribute("isPossible", false);
            return "redirect:/myPage/viewPoint";
        }
        redirectAttributes.addFlashAttribute("isPossible", true);
        redirectAttributes.addFlashAttribute("points", myPageService.pointsExchange(session, amount));

        return "redirect:/myPage/viewPoint?isConfirmed=true";

    }



    //회원 탈퇴 -- ??
//    @PostMapping("/withdrawal")
//    public String withdrawal(HttpSession session,boolean isConfirmed) {
//        myPageService.userWithdrawal(session);
//
//        return "myPage/myPage-requiredPassword";
//
//    }


}
