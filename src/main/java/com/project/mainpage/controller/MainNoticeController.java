package com.project.mainpage.controller;

import com.project.mainpage.common.PageMaker;
import com.project.mainpage.common.Search;
import com.project.mainpage.dto.request.NoticeWritePostDto;
import com.project.mainpage.dto.response.NoticeListDto;
import com.project.mainpage.dto.response.NoticeDetailDto;
import com.project.mainpage.service.MainNoticeBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/main-notice")
@RequiredArgsConstructor
@Slf4j
public class MainNoticeController {

    private final MainNoticeBoardService service;

    // 1. 목록 조회 요청
    @GetMapping("/list")
    public String list(Search page, Model model) {
        // 메인페이지 - 공지사항 목록 조회
        List<NoticeListDto> list = service.findList(page);
        PageMaker maker = new PageMaker(page, service.getCount(page));

        model.addAttribute("list", list);
        model.addAttribute("maker", maker);
        return "main-notice/list";
    }

    // 2. 글 쓰기 양식 화면 열기 요청
    @GetMapping("/write")
    public String open() {
        return "main-notice/write";
    }

    // 3. 게시글 등록 요청 -> 목록조회 요청 리다이렉션
    @PostMapping("/write")
    public String save(NoticeWritePostDto dto) {
        // 1. 브라우저가 전달한 게시글 내용 읽기
        System.out.println("dto = " + dto);
        service.insert(dto);
        return "redirect:/main-notice/list";
    }

    // 4. 게시글 삭제 요청 -> 목록조회 요청 리다이렉션
    @GetMapping("/delete")
    public String delete(int bno) {
        service.remove(bno);
        return "redirect:/main-notice/list";
    }

    // 5. 게시글 상세 조회 요청
    @GetMapping("/detail")
    public String detail(int mainNoticeNo, Model model,
                         HttpServletRequest request, HttpServletResponse response) {
        // 1. 상세조회하고 싶은 글번호를 읽기
        System.out.println("mainNoticeNo = " + mainNoticeNo);

        // 2. 데이터베이스로부터 해당 글번호 데이터 조회하기
        NoticeDetailDto dto = service.detail(mainNoticeNo);

        // 3. JSP 파일에 조회한 데이터 보내기
        model.addAttribute("b", dto);

        // 4. 요청 헤더를 파싱하여 이전 페이지의 주소를 얻어냄
        String ref = request.getHeader("Referer");
        model.addAttribute("ref", ref);

        return "main-notice/detail";
    }

    @PostMapping("/update-view-count")
    public ResponseEntity<Void> updateViewCount(@RequestBody Map<String, Object> payload) {
        try {
            Integer mainNoticeNo = (Integer) payload.get("mainNoticeNo");
            service.increaseViewCount(mainNoticeNo); // 조회수 증가 메소드 호출
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
