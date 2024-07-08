package com.project.mainpage.controller;

import com.project.mainpage.common.PageMaker;
import com.project.mainpage.common.Search;
import com.project.mainpage.dto.response.ClubListDto;
import com.project.mainpage.dto.response.NoticeFindAllDto;
import com.project.mainpage.dto.response.NoticeListDto;
import com.project.mainpage.entity.ClubRanking;
import com.project.mainpage.service.ClubRankingService;
import com.project.mainpage.service.MainNoticeBoardService;
import com.project.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/main-page")
@RequiredArgsConstructor
@Slf4j
public class MainPageController {

    private final MainNoticeBoardService noticeService;
    private final ClubRankingService rankingService;

    // 1. 메인페이지 조회 요청 (/board/list : GET)
    @GetMapping("/page")
    public String page(Search page, Model model, HttpSession session) {
        if(LoginUtil.isLoggedIn(session)){
            String account = LoginUtil.getLoggedInUser(session).getAccount();

            // 메인페이지 - 로그인한 유저의 가입한 동호회 목록 조회
            List<ClubListDto> clubList = rankingService.loginUsersClub(account);
            model.addAttribute("clubList", clubList);
        }

        // 메인페이지 - 가장 가입자가 많은 동호회 조회
        List<ClubListDto> memberList = rankingService.member();
        if (memberList.size() > 5) {
            memberList = memberList.subList(0, 5); // 상위 5개 항목만 선택
        }
        model.addAttribute("memberList", memberList);

        // 메인페이지 - 가장 최근에 만들어진 동호회 조회
        List<ClubListDto> recentList = rankingService.recent();
        if (recentList.size() > 5) {
            recentList = recentList.subList(0, 5); // 상위 5개 항목만 선택
        }
        model.addAttribute("recentList", recentList);

        // 메인페이지 - 1년 동안 스케줄이 가장 많은 동호회 조회
        List<ClubListDto> scheduledList = rankingService.mostScheduled();
        if (scheduledList.size() > 5) {
            scheduledList = scheduledList.subList(0, 5); // 상위 5개 항목만 선택
        }
        model.addAttribute("scheduledList", scheduledList);

        return "main-page/page";
    }
}
