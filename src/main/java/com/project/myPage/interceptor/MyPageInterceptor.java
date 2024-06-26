package com.project.myPage.interceptor;

import com.project.myPage.mapper.MyPageMappers;
import com.project.myPage.service.MyPageService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Configuration("myPageInterceptorConfig")
@RequiredArgsConstructor
public class MyPageInterceptor implements HandlerInterceptor {
    private final MyPageMappers myPageMappers;
    private final MyPageService myPageService;


    // 비밀번호 검증 후 리다이렉션할 것!
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();
        myPageService.saveLoginUser("mmm", session);

        System.out.println("request = " + request);
        System.out.println("response = " + response);

//        System.out.println("session.getAttribute(\"isConfirmedPw\") = " + session.getAttribute("isConfirmedPw"));

//        String redirectUri = request.getRequestURI();

//        if(!myPageService.isConfirmPassword(session)){
//            response.sendRedirect("/myPage/confirmPw");
//            return false;
//        }

        return true;

    }
}
