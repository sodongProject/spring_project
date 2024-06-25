package com.project.interceptor;

import com.project.login.entity.Users;
import com.project.login.mapper.UsersMapper;
import com.project.login.service.UsersService;
import com.project.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import org.apache.catalina.User;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;

@Configuration
@RequiredArgsConstructor
public class AutoLoginInterceptor implements HandlerInterceptor {

    private final UsersMapper usersMapper;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        // 1. 사이트에 들어오면 자동로그인 쿠키를 가지고 있는지 확인
        Cookie autoLoginCookie
                = WebUtils.getCookie(request, LoginUtil.AUTO_LOGIN_COOKIE);

        // 2. 자동로그인 쿠키가 있고, 로그인이 안되어있다면 사이트 로그인 처리를 수행
        if (autoLoginCookie != null
                && !LoginUtil.isLoggedIn(request.getSession())) {
            // 3. 쿠키에 들어있는 랜덤값을 읽기
            String sessionId = autoLoginCookie.getValue();

            // 4. 세션아이디로 회원정보 조회
            Users foundUser = usersMapper.findUserBySessionId(sessionId);

            //5. 회원 정상 조회 후 자동로그인 만료시간 이전이라면 사이트 로그인 처리 수행
            if(foundUser != null && LocalDateTime.now().isBefore(foundUser.getLimitTime())){
                UsersService.maintainLoginState(request.getSession(), foundUser);
            }

        }
            return false;
    }
}
