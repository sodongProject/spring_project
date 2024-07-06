package com.project.freeBoard.controller;

import com.project.club.dto.ClubLoginUserInfoDto;
import com.project.entity.Auth;
import com.project.freeBoard.dto.FreeBoardListResponseDto;
import com.project.freeBoard.dto.FreeBoardWriteRequestDto;

import com.project.freeBoard.mapper.FreeBoardDto;
import com.project.freeBoard.service.FreeBoardService;
import com.project.util.FileUtil;
import com.project.util.LoginUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/freeBoard")
@Slf4j
public class FreeBoardController {

    @Autowired
    private FreeBoardService service;

    @Value("${file.upload.root-path}")
    private String rootPath;

    @GetMapping("/list")
    public String list(Model model, HttpSession session) {
        System.out.println("/freeBoard/list GET");

        // 세션 체크 추가
        if (session == null || !LoginUtil.isLoggedIn(session)) {
            return "redirect:/login"; // 로그인 페이지로 리다이렉트
        }

        // 클럽 멤버 여부 확인
        if (!LoginUtil.isClubMember(session)) {
            System.out.println("클럽멤버여야 한다.");
            return "freeBoard/list"; // 클럽 멤버가 아닌 경우 처리
        }

        // 로그인된 사용자 정보 가져오기
        String account = LoginUtil.getLoggedInUserAccount(session);

        // 필요한 데이터만 추출(서비스의 findList에게 조회 넘김)
        List<FreeBoardListResponseDto> bList = service.findList();

        // JSP 파일에 해당 목록 데이터 보냄
        model.addAttribute("bList", bList);

        return "freeBoard/list";
    }

    // 게시글 쓰기 화면 요청(/board/write : GET)
    @GetMapping("/write")
    public String write() {
        System.out.println("/freeBoard/write GET");
        return "freeBoard/write";
    }

    // 게시글 등록 요청(/board/write : POST)
    @PostMapping("/write")
    public String write(FreeBoardWriteRequestDto dto) {
        System.out.println("/freeBoard/write POST");

        // 게시글 내용
        System.out.println("dto : " + dto);
        String account = dto.getAccount();
        log.info("account 있냐? {} ", account);

        // 사진 데이터
        log.debug("이미지: {}", dto.getBoardImg().getOriginalFilename());

        // 서버 업로드
        String snsContentsPath = FileUtil.uploadFile(rootPath, dto.getBoardImg());
        boolean flag = service.insert(dto, snsContentsPath);

        return "redirect:/freeBoard/list";
    }

    // 게시글 삭제 (/freeBoard/delete : GET)
    // 게시글 삭제 (/freeBoard/delete : GET)
    @GetMapping("/delete")
    public String delete(@RequestParam("bno") int bno, HttpSession session) {
        System.out.println("/freeBoard/delete GET");

        // 세션 체크 추가
        if (session == null || !LoginUtil.isLoggedIn(session)) {
            return "redirect:/login"; // 로그인 페이지로 리다이렉트
        }

        // 클럽 멤버 여부 확인
        if (!LoginUtil.isClubMember(session)) {
            return "redirect:/freeBoard/list"; // 클럽 멤버가 아닌 경우 처리
        }

        // 현재 로그인된 사용자 정보 가져오기
        String loggedInUserId = LoginUtil.getLoggedInUserAccount(session);

        // 삭제할 게시글의 작성자 ID 가져오기
        FreeBoardDto post = service.getPostByBno(bno);
        String postWriterId = post.getAccount();

        // 현재 로그인한 사용자가 게시글 작성자인지 확인
        if (!loggedInUserId.equals(postWriterId)) {
            return "redirect:/freeBoard/list"; // 작성자가 아닌 경우 목록 페이지로 리다이렉트
        }

        // 삭제 처리
        boolean success = service.remove(bno);
        if (!success) {
            // 삭제 실패 시 처리할 내용 (예: 에러 페이지로 리다이렉트)
            return "redirect:/error";
        }

        return "redirect:/freeBoard/list";
    }
}