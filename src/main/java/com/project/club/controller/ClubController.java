package com.project.club.controller;

import com.project.club.common.PageMaker;
import com.project.club.common.Search;
import com.project.club.dto.ApplicantDto;
import com.project.club.dto.ClubDetailResponseDto;
import com.project.club.dto.ClubListResponseDto;
import com.project.club.dto.ClubWriteRequestDto;
import com.project.club.service.ClubService;
import com.project.club.util.FileUtil;
import com.project.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/club")
@RequiredArgsConstructor
@Slf4j
public class ClubController {

    private final ClubService clubService;

    @Value("${file.upload.root-path}")
    private String rootPath;

    // 1. 전체조회
    @GetMapping("/list")
    public String clubList(@ModelAttribute("s") Search search, Model model, HttpSession session) {
        List<ClubListResponseDto> clubList = clubService.findList(search);
        PageMaker maker = new PageMaker(search, clubService.getCount(search));

        model.addAttribute("clubList", clubList);
        model.addAttribute("maker", maker);


        return "club/list";
    }

    // 2. 게시글 쓰기 양식 화면 열기 요청
    @GetMapping("/write")
    public String write() {
        return "club/write";
    }

    // 3. 게시글 등록 요청 (/club/write : POST)
    @PostMapping("/write")
    public String write(ClubWriteRequestDto C) {

        String profilePath = FileUtil.uploadFile(rootPath, C.getClubProfile());
        clubService.insert(C, profilePath);
        return "redirect:/club/list";
    }

    // 4. 삭제요청
    @GetMapping("/delete")
    public String delete(@RequestParam("clubNo") long clubNo) {
        clubService.remove(clubNo);
        return "redirect:/club/list";
    }

    // 5. 상세조회 요청
    @GetMapping("/detail")
    public String detail(@RequestParam("bno") long bno, Model model) {
        ClubDetailResponseDto club = clubService.detail(bno);
        log.info("컨트롤러야 뭐 가져오는거야?: {}", bno);
        model.addAttribute("club", club);
        return "club/detail";
    }

    // 6. 사용자 수 증가 요청
    @PostMapping("/increaseUserCount")
    public String increaseUserCount(@RequestParam("clubNo") long clubNo) {
        clubService.increaseUserCount(clubNo);
        return "redirect:/club/detail?bno=" + clubNo;
    }

    // 7. 클럽 가입 요청
    @PostMapping("/join")
    public String joinClub(@RequestParam("clubNo") long clubNo, HttpSession session, Model model) {
        String currentUserAccount = LoginUtil.getLoggedInUserAccount(session);
        if (currentUserAccount == null) {
            return "redirect:/users/sign-in";
        }

        String userRole = clubService.getUserRole(clubNo, currentUserAccount);
        if ("PENDING".equals(userRole)) {
            return "redirect:/club/applicants?clubNo=" + clubNo; // 대기 중인 사용자를 신청자 페이지로 리다이렉션
        } else if ("MEMBER".equals(userRole)) {
            model.addAttribute("message", "이미 가입되었거나 승인된 회원입니다.");
            return "redirect:/club/detail?bno=" + clubNo;
        } else {
            clubService.requestJoin(clubNo, currentUserAccount);
            model.addAttribute("PENDING", true); // 대기 중 상태를 나타내는 속성
            return "redirect:/club/detail?bno=" + clubNo;
        }
    }

    // 8. 가입 신청자 목록 조회
    @GetMapping("/applicants")
    public String viewApplicants(@RequestParam("clubNo") long clubNo, Model model) {
        List<ApplicantDto> applicants = clubService.getApplicants(clubNo);
        model.addAttribute("applicants", applicants);
        return "club/applicants";
    }

    // 9. 가입 승인 시 권한 변경
    @PostMapping("/approve")
    public String approveApplicant(@RequestParam Long clubNo, @RequestParam String account) {
        log.info("Approve request received for account: {}, clubNo: {}", account, clubNo);
        clubService.approveApplicant(clubNo, account);
        return "redirect:/club/applicants?clubNo=" + clubNo;
    }


}
