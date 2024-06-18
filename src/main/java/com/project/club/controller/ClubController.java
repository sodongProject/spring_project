package com.project.club.controller;

import com.project.club.common.PageMaker;
import com.project.club.common.Search;
import com.project.club.dto.ClubListResponseDto;
import com.project.club.dto.ClubWriteRequestDto;
import com.project.club.entity.Club;
import com.project.club.service.ClubService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/club")
@RequiredArgsConstructor
@Slf4j
public class ClubController {

    private final ClubService clubService;

    // 1. 전체조회
    @GetMapping("/list")
    public String clubList(@ModelAttribute("s") Search search, Model model) {

        List<ClubListResponseDto> clubList = clubService.findList(search);
        PageMaker maker = new PageMaker(search, clubService.getCount(search));


        model.addAttribute("clubList", clubList);
        model.addAttribute("s", search);

        return "club/list";

    }

    // 2. 게시글 쓰기 양식 화면 열기 요청
    @GetMapping("/write")
    public String write() {
        return "club/write";
    }

    // 3. 게시글 등록 요청 (/board/write : POST)
    @PostMapping("/write")
    public String write(ClubWriteRequestDto C) {
        clubService.insert(C);
        return "redirect:/club/list";
    }
}
