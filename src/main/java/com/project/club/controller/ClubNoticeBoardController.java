package com.project.club.controller;


import com.project.club.dto.ClubDetailResponseDto;
import com.project.club.dto.ClubListResponseDto;
import com.project.club.dto.ClubLoginUserInfoDto;
import com.project.club.dto.clubNoticeBoard.response.ClubNoticeBoardDetailResponseDto;
import com.project.club.dto.clubNoticeBoard.response.ClubNoticeBoardListResponseDto;
import com.project.club.dto.clubNoticeBoard.response.ClubNoticeBoardWriteResponseDto;
import com.project.club.entity.ClubNoticeBoard;
import com.project.club.service.ClubNoticeBoardService;
import com.project.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/clubNoticeBoard")
@RequiredArgsConstructor
@Slf4j
public class ClubNoticeBoardController {

    private final ClubNoticeBoardService clubNoticeBoardService;

    // 전체 목록
    @GetMapping("list")
    public String list(@RequestParam("clubNo") long clubNo, Model model) {
        List<ClubNoticeBoardListResponseDto> CNBList = clubNoticeBoardService.findList(clubNo);
        model.addAttribute("clubNo", clubNo);
        model.addAttribute("CNBList", CNBList);
        return "clubNoticeBoard/list";
    }

    // 글쓰기 페이지 요청
    @GetMapping("write")
    public String write(@RequestParam("clubNo") long clubNo, Model model){
        log.debug(model.toString());
        model.addAttribute("clubNo", clubNo);
        log.info(String.valueOf(clubNo));
        return "clubNoticeBoard/write";
    }

    // 글 쓰기 요청
    @PostMapping("write")
    public String write(ClubNoticeBoardWriteResponseDto dto){
        clubNoticeBoardService.insert(dto);
        log.debug("이게 도대채 뭐냐? {}", String.valueOf(dto.getClubNo()));
        return "redirect:/clubNoticeBoard/list";
    }

    // 5. 상세조회 요청
    @GetMapping("/detail")
    public String detail(long clubNoticeNo, Model model) {
        ClubNoticeBoardDetailResponseDto CNB = clubNoticeBoardService.detail(clubNoticeNo);
        model.addAttribute("club", CNB);
        return "clubNoticeBoard/detail";
    }

}
