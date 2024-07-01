package com.project.mainpage.controller;

import com.project.mainpage.dto.response.ClubListDto;
import com.project.mainpage.service.ClubRankingService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/club-ranking")
@RequiredArgsConstructor
@Slf4j
public class ClubRankingController {

    private final ClubRankingService service;

    // 가장 가입자가 많은 동호회
    @GetMapping("/most-member")
    public String mostMember(Model model) {
        List<ClubListDto> memberList = service.member();
        System.out.println("memberList = " + memberList);

        model.addAttribute("memberList", memberList);
        return "main-page/page";
    }

    // 가장 최근에 만들어진 동호회
    @GetMapping("/recent")
    public String recentClub(Model model) {
        List<ClubListDto> recentList = service.recent();
        System.out.println("recentList = " + recentList);

        model.addAttribute("recentList", recentList);
        return "main-page/page";
    }

    // 1년 동안 스케줄이 가장 많은 동호회
    @GetMapping("/most-scheduled")
    public String mostScheduled(Model model) {
        List<ClubListDto> scheduledList = service.mostScheduled();
        System.out.println("scheduledList = " + scheduledList);

        model.addAttribute("scheduledList", scheduledList);
        return "main-page/page";
    }

    @GetMapping("/login-users-club")
    public String usersClubList(Model model, HttpSession session) {
        String account = (String) session.getAttribute("account");

        List<ClubListDto> clubList = service.loginUsersClub(account);
        System.out.println("clubList = " + clubList);

        model.addAttribute("clubList", clubList);
        return "main-page/page";
    }

}
