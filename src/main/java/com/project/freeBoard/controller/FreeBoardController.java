package com.project.freeBoard.controller;

import com.project.entity.FreeBoard;
import com.project.freeBoard.dto.FreeBoardListResponseDto;
import com.project.freeBoard.dto.FreeBoardWriteRequestDto;
import com.project.freeBoard.mapper.FreeBoardDto;
import com.project.freeBoard.mapper.FreeBoardMapper;

import com.project.freeBoard.service.FreeBoardService;
import com.project.util.LoginUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/freeBoard")
public class FreeBoardController {

    @Autowired
    private FreeBoardService service;

    // 게시글 목록 조회 요청(/board/list : GET)
    @GetMapping("/list")
    public String list(Model model, HttpSession session){
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

        // 임시 더미 account 설정
        session.setAttribute("account", "dummy123");

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
    public String write(){
        System.out.println("/freeBoard/write GET");

        return "freeBoard/write";
    }

    // 게시글 등록 요청(/board/write : POST)
    @PostMapping("/write")
    public String write(FreeBoardWriteRequestDto dto){
        System.out.println("/freeBoard/write POST");

        //1) 게시글 내용
        System.out.println("dto : "+ dto);

        service.insert(dto);

        return "redirect:/freeBoard/list";
    }

    // 게시글 삭제 (/freeBoard/delete : GET)
    @GetMapping("/delete")
    public String delete(int bno){
        System.out.println("/freeBoard/delete GET");

        service.remove(bno);

        return "redirect:/freeBoard/list";
    }


}
