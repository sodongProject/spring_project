//package com.project.freeBoard.service;
//
//import com.project.entity.FreeBoard;
//import com.project.freeBoard.repository.FreeBoardRepository;
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.transaction.annotation.Transactional;
//
//import java.time.LocalDateTime;
//
//@SpringBootTest
//@Transactional
//public class FreeBoardServiceTest {
//    @Autowired
//    private FreeBoardService freeBoardService;
//
//    @Autowired
//    private FreeBoardRepository freeBoardRepository;
//
//    @Test
//    public void testCreateAndFindFreeBoard() {
//        FreeBoard freeBoard = new FreeBoard();
//        freeBoard.setBoardTitle("Test Title");
//        freeBoard.setContent("Test Content");
//        freeBoard.setRegDateTime(LocalDateTime.now());
//        freeBoard.setBoardImg("Test Image");
//        freeBoard.setViewCount(0);
//        freeBoard.setBoardDelete(false);
//        freeBoard.setAccount();
//        freeBoard.setClubNo(1);
//
//       }
//}