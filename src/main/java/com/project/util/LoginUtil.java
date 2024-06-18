package com.project.util;

import com.project.entity.Auth;

import javax.servlet.http.HttpSession;

public class LoginUtil {

    public static final String LOGIN = "login";
    public static final String AUTO_LOGIN_COOKIE = "auto";

    // 로그인 여부 확인
    public static boolean isLoggedIn(HttpSession session) {
        return session.getAttribute(LOGIN) != null;
    }


    // 로그인한 회원의 정보 얻기
    public static LoginUserInfoDto getLoggedInUser(HttpSession session) {
        return (LoginUserInfoDto) session.getAttribute(LOGIN);
    }

    // 로그인한 회원의 권한이 USER인지 ADMIN 인지
    public static boolean isAdmin(HttpSession session) {
        LoginUserInfoDto loggedInUser = getLoggedInUser(session);
        Auth auth = null;
        if (isLoggedIn(session)) {
            auth = loggedInUser.getAuth();
        }
        return auth == Auth.ADMIN;
    }



}
