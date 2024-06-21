package com.project.login.controller;

import com.project.login.dto.SignUpDto;
import com.project.login.service.UsersService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/users")
@Slf4j
@RequiredArgsConstructor
public class LoginController {

    private final UsersService usersService;

    // 로그인 페이지 열기
    @GetMapping("/sign-in")
    public String signInPage() {
        log.info("/users/sign-in GET : forwarding to sign-in.jsp");
        return "users/sign-in";
    }

    // 회원가입 양식 열기
    @GetMapping("/sign-up")
    public String signUpPage() {
        log.info("/users/sign-up GET : forwarding to sign-up.jsp");
        return "/users/sign-up";
    }

    // 회원가입 요청 처리
    @PostMapping("/sign-up")
    public String signUp( @ModelAttribute SignUpDto signUpDto) {
        log.info("/users/sign-up POST");
        log.info("SignUp request: {}", signUpDto);

        boolean flag = usersService.join(signUpDto);  // 회원가입 서비스 호출

        // ⭐수정해야함⭐ 회원가입 성공 시 메인 페이지로, 실패 시 회원가입 페이지로 리다이렉트
        return flag ? "redirect:/main/list" : "redirect:/users/sign-up";
    }

    // 아이디, 이메일 중복검사 비동기 요청 처리
    @GetMapping("/check")
    @ResponseBody
    public ResponseEntity<?> check(String type, String keyword) {
        boolean flag = usersService.checkIdentifier(type, keyword);
        log.info("{} 중복체크 결과? {}", type, flag);
        return ResponseEntity
                .ok()
                .body(flag);
    }

}
