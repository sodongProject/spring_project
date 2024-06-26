package com.project.club.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.club.common.PageMaker;
import com.project.club.common.Search;
import com.project.club.dto.*;
import com.project.club.service.ClubService;
import com.project.club.util.FileUtil;
import com.project.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/club")
@RequiredArgsConstructor
@Slf4j
public class ClubController {

    private final ClubService clubService;
    private final ObjectMapper objectMapper;

    @Value("${file.upload.root-path}")
    private String rootPath;

    // 1. 전체조회
    @GetMapping("/list")
    public String clubList(@ModelAttribute("s") Search search, Model model, HttpSession session) {
        String account = LoginUtil.getLoggedInUser(session).getAccount();
        List<ClubListResponseDto> clubList = clubService.findList(search, account);
        PageMaker maker = new PageMaker(search, clubService.getCount(search));

        // 사용자 클럽 정보 추가
        for (ClubListResponseDto club : clubList) {
            if (!clubService.checkIfUserExistsInClub(account, club.getClubNo())) {
                clubService.insertUserClub(club.getClubNo(), account, "PENDING");
            }
        }

        ClubLoginUserInfoDto clubLoginUserInfo = clubService.getClubLoginUserInfo(account, session);

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
    public String detail(@RequestParam("bno") long bno, Model model, HttpSession session) {
        String account = LoginUtil.getLoggedInUser(session).getAccount();
        ClubDetailResponseDto club = clubService.detail(bno, account);
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
    public ResponseEntity<Map<String, Object>> joinClub(@RequestBody Map<String, Object> payload, HttpSession session) {
        long clubNo = Long.valueOf(payload.get("clubNo").toString());
        String currentUserAccount = LoginUtil.getLoggedInUserAccount(session);
        if (currentUserAccount == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("message", "로그인이 필요합니다."));
        }
        String userRole = clubService.getUserRole(clubNo, currentUserAccount);
        if ("MEMBER".equals(userRole)) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(Map.of("message", "이미 가입되었거나 승인된 회원입니다."));
        } else {
            try {
                clubService.requestJoin(clubNo, currentUserAccount);
                return ResponseEntity.ok(Map.of("message", "가입 신청이 완료되었습니다."));
            } catch (Exception e) {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("message", "가입 신청에 실패하였습니다."));
            }
        }
    }

    // 8. 가입 신청자 목록 조회
    @GetMapping("/applicants")
    public String viewApplicants(@RequestParam("clubNo") long clubNo, Model model) {
        List<ApplicantDto> applicants = clubService.getApplicants(clubNo);
        log.info("Loaded {} applicants for clubNo: {}", applicants.size(), clubNo);
        model.addAttribute("applicants", applicants);
        return "club/applicants";
    }

    // 9. 가입 승인 시 권한 변경
    @PostMapping("/approve")
    public ResponseEntity<String> approveApplicant(@RequestParam Long clubNo, @RequestParam String account) {
        try {
            log.info("approveApplicant - clubNo: {}, account: {}", clubNo, account);
            clubService.approveApplicant(clubNo, account);
            return ResponseEntity.ok("User approved successfully");
        } catch (Exception e) {
            log.error("Error approving applicant - clubNo: {}, account: {}", clubNo, account, e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to approve user");
        }
    }

    @PostMapping("/deny")
    public ResponseEntity<String> denyApplicant(@RequestParam Long clubNo, @RequestParam String account) {
        try {
            log.info("denyApplicant - clubNo: {}, account: {}", clubNo, account);
            clubService.denyApplicant(clubNo, account);
            return ResponseEntity.ok("User denied successfully");
        } catch (Exception e) {
            log.error("Error denying applicant - clubNo: {}, account: {}", clubNo, account, e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to deny user");
        }
    }
}
