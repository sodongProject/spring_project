//package com.project.mainpage.interceptor;
//
//import com.project.mainpage.entity.MainNoticeBoard;
//import com.project.mainpage.mapper.MainNoticeMapper;
//import com.project.util.LoginUtil;
//import lombok.RequiredArgsConstructor;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.servlet.HandlerInterceptor;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//@Configuration
//@Slf4j
//@RequiredArgsConstructor
//public class NoticeInterceptor implements HandlerInterceptor {
//
//    private final MainNoticeMapper mapper;
//
//    // 로그인 유저 권한(Auth)이 ADMIN(관리자)이면 메인페이지 공지사항 작성, 수정, 삭제가 가능
//    // 로그인 유저 권한(Auth)이 COMMON(일반회원)이면 공지사항 조회만 가능
//    // 일반회원이 작성, 수정, 삭제 접근시 거부하고 알림창 띄우기
//    @Override
//    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//
//        HttpSession session = request.getSession();
//
//        // 요청 URL
//        String redirectUri = request.getRequestURI();
//
//        if (!LoginUtil.isLoggedIn(session)) {
//            log.info("origin: {}", redirectUri);
//            response.sendRedirect("/members/sign-in?message=login-required&redirect=" + redirectUri);
//            return false;
//        }
//
//        // 삭제요청이 들어오면 서버에서 한번더 관리자인지 검증
//
//        // 관리자 인가?
//        if (LoginUtil.isAdmin(session)) {
//            return true;
//        }
//
//        // 공지사항 등록, 수정, 삭제 요청인지
//        if (redirectUri.equals("/notice/write") || redirectUri.equals("/notice/delete") || redirectUri.equals("/notice/detail")) {
//            System.out.println("redirectUri = " + redirectUri);
//            // 내가 쓴 글이 아닌지?
//            // 현재 삭제하려는 글의 글쓴이 계정명과
//            // -> DB 에서 조회해보면 됨 -> 공지사항 글 번호가 필요함
//            int mno = Integer.parseInt(request.getParameter("mno"));
//            MainNoticeBoard board = mapper.findOne(mno);
//            String boardAccount = board.getAccount();
//
//            // 현재 로그인한 회원의 계정명을 구해서
//            String loggedInUserAccount = LoginUtil.getLoggedInUserAccount(session);
//
//
//            // 대조해보는 작업이 필요함
//            if (LoginUtil.isAdmin(session)) {
//                return true;
//            }
//        }
//
//        return true;
//    }
//}
