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
@RequestMapping("/club")
@RequiredArgsConstructor
@Slf4j
public class ClubRankingController {

    private final ClubRankingMapper mapper;
    private final ClubRankingService service;

    // 가장 가입자가 많은 동호회
    @GetMapping("/club-ranking")
    public String mostMember(ClubRanking club, Model model) {

        // 서비스에게 조회 요청 위임
        List<ClubListDto> memberList = service.member(club);

        // JSP 파일에 해당 목록데이터를 보냄
        model.addAttribute("memberList", memberList);

        return "notice/list";
    }

     // 가장 최근에 만들어진 동호회
     @GetMapping("/club-ranking")
     public String recentClub(ClubRanking club, Model model) {

         // 서비스에게 조회 요청 위임
         List<ClubListDto> recentList = service.member(club);

         // JSP 파일에 해당 목록데이터를 보냄
         model.addAttribute("recentList", recentList);

         return "notice/list";
     }

    // 1년 동안 스케줄이 가장 많은 동호회

}
