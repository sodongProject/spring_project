package com.project.util;

import com.project.entity.Auth;
import com.project.entity.ClubAuth;
import com.project.entity.UsersClubAuth;
import com.project.login.dto.LoginUserInfoDto;
import com.project.club.dto.ClubLoginUserInfoDto;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginUtil {

    public static final String LOGIN = "login";
    public static final String AUTO_LOGIN_COOKIE = "auto";
    public static final String CLUB_LOGIN = "clubLogin";

    // 로그인 여부 확인
    public static boolean isLoggedIn(HttpSession session) {
        return session.getAttribute(LOGIN) != null;
    }

    // 로그인 회원의 계정명 얻기
    public static String getLoggedInUserAccount(HttpSession session) {
        LoginUserInfoDto loggedInUser = getLoggedInUser(session);
        return loggedInUser != null ? loggedInUser.getAccount() : null;
    }

    // 로그인한 회원의 정보 얻기
    public static LoginUserInfoDto getLoggedInUser(HttpSession session) {
        return (LoginUserInfoDto) session.getAttribute(LOGIN);
    }

    // 로그인한 회원의 권한이 USER인지 ADMIN인지 확인
    public static boolean isAdmin(HttpSession session) {
        LoginUserInfoDto loggedInUser = getLoggedInUser(session);
        Auth auth = null;
        if (isLoggedIn(session)) {
            auth = loggedInUser.getAuth();
        }
        return auth == Auth.ADMIN;
    }

    // 자동 로그인 여부 확인
    public static boolean isAutoLogin(HttpServletRequest request) {
        Cookie autoLoginCookie = WebUtils.getCookie(request, AUTO_LOGIN_COOKIE);
        return autoLoginCookie != null;
    }




//${clubLogin.clubAuth == 'MEMBER' || clubLogin.clubAuth 'ADMIN'}


    // 클럽 로그인 회원의 권한이 ADMIN 인지 확인
    public static boolean isClubAdmin(HttpSession session) {
        ClubLoginUserInfoDto clubLoggedInUser = getClubLoggedInUser(session);
        ClubAuth clubAuth = null;
        if (isLoggedIn(session)) {
            clubAuth = clubLoggedInUser.getClubAuth();
        }
        return clubAuth == ClubAuth.ADMIN;
    }

    // 클럽 로그인 회원의 권한이 MEMBER 인지 확인
    public static boolean isClubMember(HttpSession session) {
        ClubLoginUserInfoDto clubLoggedInUser = getClubLoggedInUser(session);
        ClubAuth clubAuth = null;
        if (isLoggedIn(session)) {
            clubAuth = clubLoggedInUser.getClubAuth();
        }
        return clubAuth == ClubAuth.MEMBER;
    }

    // 클럽 로그인 회원의 권한이 PENDING 인지 확인
    public static boolean isClubPending(HttpSession session) {
        ClubLoginUserInfoDto clubLoggedInUser = getClubLoggedInUser(session);
        ClubAuth clubAuth = null;
        if (isLoggedIn(session)) {
            clubAuth = clubLoggedInUser.getClubAuth();
        }
        return clubAuth == ClubAuth.PENDING;
    }

    // 클럽 로그인 여부 확인
    public static boolean isClubLoggedIn(HttpSession session) {
        return session.getAttribute(CLUB_LOGIN) != null;
    }

    // 클럽 로그인한 회원의 정보 얻기
    public static ClubLoginUserInfoDto getClubLoggedInUser(HttpSession session) {
        return (ClubLoginUserInfoDto) session.getAttribute(CLUB_LOGIN);
    }

    // 클럽 로그인한 회원의 계정명 얻기
    public static String getClubLoggedInUserAccount(HttpSession session) {
        ClubLoginUserInfoDto clubLoggedInUser = getClubLoggedInUser(session);
        return clubLoggedInUser != null ? clubLoggedInUser.getAccount() : null;
    }

    // 클럽 로그인한 회원의 권한 얻기
    public static ClubAuth getClubLoggedInUserAuth(HttpSession session) {
        ClubLoginUserInfoDto clubLoggedInUser = getClubLoggedInUser(session);
        return clubLoggedInUser != null ? clubLoggedInUser.getClubAuth() : null;
    }

    // 클럽 로그인한 회원의 역할 얻기
    public static UsersClubAuth getClubLoggedInUserRole(HttpSession session) {
        ClubLoginUserInfoDto clubLoggedInUser = getClubLoggedInUser(session);
        return clubLoggedInUser != null ? clubLoggedInUser.getRole() : null;
    }

    // 자기가 작성한 클럽 게시물이 맞는지 확인
    public static boolean isMine(String clubAccount, String clubLoggedInUserAccount) {
        return clubAccount.equals(clubLoggedInUserAccount);
    }


}
