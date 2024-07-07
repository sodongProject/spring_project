package com.project.login.controller;

import com.project.login.dto.SignInDto;
import com.project.login.dto.SignUpDto;
import com.project.login.service.LoginResult;
import com.project.login.service.UsersService;
import com.project.util.FileUtil;
import com.project.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/users")
@Slf4j
@RequiredArgsConstructor
public class LoginController {

    @Value("${file.upload.root-path}")
    private String rootPath;

    private final UsersService usersService;

    // 회원가입 양식 열기
    @GetMapping("/sign-up")
    public String signUpPage(HttpSession session) {

        //로그인을 한 사람이 요청을 보내면 돌려보낸다.
        if (LoginUtil.isLoggedIn(session)) {
            return "redirect:/";
        }

        log.info("/users/sign-up GET : forwarding to sign-up.jsp");
        return "/users/sign-up";
    }

    // 회원가입 요청 처리
    @PostMapping("/sign-up")
    public String signUp(@ModelAttribute SignUpDto dto) {
        log.info("/users/sign-up POST");
        log.info("SignUp request: {}", dto);
        log.info("attached profile image name: {}", dto.getProfileImage().getOriginalFilename());

        //프로필 사진 추출
        MultipartFile profileImage = dto.getProfileImage();

//        String profilePath = null;
//        if(!profileImage.isEmpty()){
//            log.debug("attached profile image name: {}", profileImage.getOriginalFilename());
//            //서버에 업로드
//            profilePath = FileUtil.uploadFile(rootPath, profileImage);
//        }
        String profilePath = FileUtil.uploadFile(rootPath, dto.getProfileImage());

        boolean flag = usersService.join(dto, profilePath);  // 회원가입 서비스 호출

        // 회원가입 성공 시 메인 페이지로, 실패 시 회원가입 페이지로 리다이렉트
        return flag ? "redirect:/users/sign-in" : "redirect:/users/sign-up";
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


    // 로그인 양식 열기 ==================================================
    @GetMapping("/sign-in")
    public String signIn(HttpSession session, @RequestParam(required = false) String redirect) {

//        //로그인을 한 사람이 요청을 보내면 돌려보낸다.
//       if(LoginUtil.isLoggedIn(session)){
//            return "redirect:/";
//        }

        session.setAttribute("redirect", redirect);

        log.info("/users/sign-in GET : forwarding to sign-in.jsp");
        return "users/sign-in";
    }

    //로그인 요청 처리✨
    @PostMapping("/sign-in")   //get방식으로 하면 로그인 노출됨
    public String signIn(SignInDto dto, RedirectAttributes ra, HttpServletRequest request, HttpServletResponse response) { //LoginDto.java에서 사용한 이름을 쓴다
        log.info("/users/sign-in POST");
        log.debug("parameter: {}", dto);

        // 세션 얻기
        HttpSession session = request.getSession();

        LoginResult result = usersService.authenticate(dto, session, response);
        log.info("Authentication result: {}", result);

        ra.addFlashAttribute("result", result.name());

        if (result == LoginResult.SUCCESS) {

            //리다이렉트 URL이 있다면
            String redirect = (String) session.getAttribute("redirect");
            System.out.println("redirect = " + redirect);
            
            if (redirect != null) {
                session.removeAttribute("redirect");
                return "redirect:" + redirect;
            }

            return "redirect:/"; // 로그인 성공시
        }

        return "redirect:/users/sign-in"; // 로그인 실패시
    }

    @GetMapping("/sign-out")
    public String signOut(HttpServletRequest request, HttpServletResponse response) {
        // 세션 구하기
        HttpSession session = request.getSession();

        // 자동로그인 상태인지 확인
        if (LoginUtil.isAutoLogin(request)) {
            // 쿠키를 제거하고, DB에도 자동로그인 관련데이터를 원래대로 해놓음
            usersService.autoLoginClear(request, response);
        }

            // 세션에서 로그인 기록 삭제
            session.removeAttribute("login");

            // 세션을 초기화 (reset)
            session.invalidate();

            // 홈으로 보내기
            return "redirect:/";
        }

    }


