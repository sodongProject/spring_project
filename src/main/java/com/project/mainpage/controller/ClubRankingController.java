package com.project.mainpage.controller;

import com.project.mainpage.dto.response.ClubListDto;
import com.project.mainpage.entity.ClubRanking;
import com.project.mainpage.mapper.ClubRankingMapper;
import com.project.mainpage.service.ClubRankingService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/club-ranking")
@RequiredArgsConstructor
@Slf4j
public class ClubRankingController {

    private final ClubRankingMapper mapper;
    private final ClubRankingService service;

    // 가장 가입자가 많은 동호회
    @GetMapping("/most-member")
    public String mostMember(Model model) {
        List<ClubListDto> memberList = service.member();
        model.addAttribute("memberList", memberList);
        System.out.println("memberList = " + memberList);
        return "redirect:/notice/list";
    }

     // 가장 최근에 만들어진 동호회
     @GetMapping("/recent")
     public String recentClub(Model model) {
         List<ClubListDto> recentList = service.member();
         model.addAttribute("recentList", recentList);
         return "redirect:/notice/list";
     }

    // 1년 동안 스케줄이 가장 많은 동호회
    @GetMapping("/most-scheduled")
    public String mostScheduled(Model model) {
        List<ClubListDto> scheduledList = service.mostScheduled();
        model.addAttribute("scheduledList", scheduledList);
        return "redirect:/notice/list";
    }

}
