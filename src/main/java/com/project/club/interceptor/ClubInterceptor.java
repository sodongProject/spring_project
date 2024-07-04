package com.project.club.interceptor;

import com.project.club.dto.ClubLoginUserInfoDto;
import com.project.club.entity.Club;
import com.project.club.mapper.ClubMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Objects;

import static com.project.util.LoginUtil.*;

@Configuration
@Slf4j
@RequiredArgsConstructor
public class ClubInterceptor implements HandlerInterceptor {

    private final ClubMapper clubMapper;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();

        String redirectUri = request.getRequestURI();

        // 특정 경로에 대해서는 로그인 검사를 하지 않음
        if (redirectUri.equals("/club/list") || redirectUri.equals("/club/detail")) {
            return true;
        }

        if (!isLoggedIn(session)) {
            log.info("origin: {}", redirectUri);
            response.sendRedirect("/users/sign-in?message=login-required&redirect=" + redirectUri);
            return false;
        }

        // 삭제 요청이 들어오면 관리자인지 확인이 필요함
        if (isClubAdmin(session) || isAdmin(session)){
            return true;
        }

//        // 가입하기 요청이 들어오면 pending 인지 확인해야함
//        if (isClubPending(session)){
//            return true;
//        }
//
//        // 가입 요청인지
//        if (redirectUri.equals("/club/join")) {
//            if (!isLoggedIn(session)) {
//                response.setStatus(401); // Unauthorized
//                response.getWriter().write("로그인이 필요합니다.");
//                return false;
//            }
//
//            long clubNo = Integer.parseInt(request.getParameter("bno"));
//            ClubLoginUserInfoDto clubLoggedInUser = getClubLoggedInUser(session);
//
//            if (clubLoggedInUser == null || !Objects.equals(clubLoggedInUser.getClubNo(), clubNo)) {
//                response.setStatus(403); // Forbidden
//                response.getWriter().write("가입 요청이 허용되지 않습니다.");
//                return false;
//            }
//
//            String userRole = clubMapper.findUserRole(clubNo, clubLoggedInUser.getAccount());
//            if ("PENDING".equals(userRole)) {
//                return true;
//            }
//
//            response.setStatus(403); // Forbidden
//            response.getWriter().write("이미 가입 요청 중입니다.");
//            return false;
//
//        }

        // 삭제요청인지?
        if (redirectUri.equals("/club/delete")) {
            long clubNo = Integer.parseInt(request.getParameter("clubNo"));
            Club club = clubMapper.findOne(clubNo);
            String clubAccount = club.getAccount();
            String clubLoggedInUserAccount = getClubLoggedInUserAccount(session);

            // 내 게시물이 맞는지 확인
            if (!isMine(clubAccount, clubLoggedInUserAccount)) {
                response.setStatus(403);
//                response.sendRedirect("/access-deny?message=authorization");
                return false;
            }

        }
        return true;



    }
}


