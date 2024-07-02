package com.project.freeBoard.controller;

import com.project.entity.FreeBoard;
import com.project.freeBoard.dto.FreeBoardListResponseDto;
import com.project.freeBoard.dto.FreeBoardWriteRequestDto;
import com.project.freeBoard.mapper.FreeBoardDto;
import com.project.freeBoard.repository.FreeBoardRepository;
import com.project.freeBoard.service.FreeBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/freeBoard")
public class FreeBoardController {

    //@Autowired
    private FreeBoardService freeBoardService;

    private FreeBoardRepository repository;

    // 게시글 목록 조회 요쳥(/board/list : GET)
    @GetMapping("/list")
    public String list(){
        System.out.println("/freeBoard/list GET");

        //서비스에게 조회 요청 위임
        //List<FreeBoardListResponseDto> bList = freeBoardService.findAll();

        //JSP파일에 해당 목록데이터 보냄
        //model.addAttribute("bList", bList);

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

        //2) db저장(엔터티 클래스 변환)
        //FreeBoard b = dto.toEntity();

        //3) db저장
//        repository.save(b);

        return "redirect:/freeBoard/list";
    }

    // 게시글 삭제 (/freeBoard/delete : GET)
    @GetMapping("/delete")
    public String delete(int bno){
        System.out.println("/freeBoard/delete GET");

        repository.delete(bno);

        return "redirect:/freeBoard/list";
    }

}
