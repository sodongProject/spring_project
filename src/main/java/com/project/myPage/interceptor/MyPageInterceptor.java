package com.project.myPage.interceptor;

import com.project.myPage.mapper.MyPageMappers;
import com.project.myPage.service.MyPageService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static com.project.util.LoginUtil.isLoggedIn;

@Configuration("myPageInterceptorConfig")
@RequiredArgsConstructor
@Slf4j
public class MyPageInterceptor implements HandlerInterceptor {
    private final MyPageMappers myPageMappers;
    private final MyPageService myPageService;


    // 로그인 전에
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();

        // 요청 URL
        String redirectUri = request.getRequestURI();

        if (!isLoggedIn(session)) {
            log.info("origin: {}", redirectUri);
            response.sendRedirect("/users/sign-in?redirect="+redirectUri);
            return false;
        }

//        response.sendRedirect(redirectUri);

        return true;
    }

}
