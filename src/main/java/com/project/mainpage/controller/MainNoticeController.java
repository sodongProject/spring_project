package com.project.mainpage.controller;

import com.project.mainpage.common.PageMaker;
import com.project.mainpage.common.Search;
import com.project.mainpage.dto.request.NoticeWritePostDto;
import com.project.mainpage.dto.response.ClubListDto;
import com.project.mainpage.dto.response.NoticeListDto;
import com.project.mainpage.service.ClubRankingService;
import com.project.mainpage.service.MainNoticeBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/notice")
@RequiredArgsConstructor
@Slf4j
public class MainNoticeController {

    private final MainNoticeBoardService service;

    // 1. 목록 조회 요청 (/board/list : GET)
    @GetMapping("/list")
    public String list(Search page, Model model) {

        // 메인페이지 - 공지사항 목록 조회
        List<NoticeListDto> list = service.findList(page);
        PageMaker maker = new PageMaker(page, service.getCount(page));

        model.addAttribute("list", list);
        model.addAttribute("maker", maker);
        return "notice/list";
    }


    // 2. 글 쓰기 양식 화면 열기 요청 (/notice/write : GET)
    @GetMapping("/write")
    public String open() {
        return "notice/write";
    }


    // 3. 게시글 등록 요청 (/notice/upload : POST)
    // -> 목록조회 요청 리다이렉션
    @PostMapping("/write")
    public String save(NoticeWritePostDto dto) {

        // 1. 브라우저가 전달한 게시글 내용 읽기
        System.out.println("dto = " + dto);

        service.insert(dto);

        return "redirect:/notice/list";
    }


    // 4. 게시글 삭제 요청 (/notice/delete : GET)
    // -> 목록조회 요청 리다이렉션
    @GetMapping("/delete")
    public String delete(int bno) {

        service.remove(bno);
        return "redirect:/notice/list";
    }


    // 5. 게시글 상세 조회 요청 (/notice/detail : GET)
//    @GetMapping("/detail")
//    public String detail(int bno, Model model
//            , HttpServletRequest request, HttpServletResponse response) {
//
//        // 1. 상세조회하고 싶은 글번호를 읽기
//        System.out.println("bno = " + bno);
//
//        // 2. 데이터베이스로부터 해당 글번호 데이터 조회하기
//        NoticeDetailDto dto = service.detail(bno, request, response);
//
//        // 3. JSP 파일에 조회한 데이터 보내기
//        model.addAttribute("b", dto);
//
//        // 4. 요청 헤더를 파싱하여 이전 페이지의 주소를 얻어냄
//        String ref = request.getHeader("Referer");
//        model.addAttribute("ref", ref);
//
//        return "notice/detail";
//    }

}
