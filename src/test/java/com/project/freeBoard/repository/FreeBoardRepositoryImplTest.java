//package com.project.freeBoard.repository;
//
//import com.project.entity.FreeBoard;
//import org.junit.jupiter.api.BeforeEach;
//import org.junit.jupiter.api.DisplayName;
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.annotation.Rollback;
//import org.springframework.transaction.annotation.Transactional;
//
//import java.util.List;
//
//import static org.junit.jupiter.api.Assertions.*;
//
//@SpringBootTest
//@Transactional
//@Rollback
//class FreeBoardRepositoryImplTest {
//
//
//    @BeforeEach
//    void bulkInsert() {
//        for (int i = 1; i <= 5; i++) {
//            FreeBoard b = new FreeBoard();
//            b.setBoardTitle("테스트제목"+i);
//            b.setAccount("글쓴이"+i);
//            b.setContent("내용"+i);
//
//            repository.save(b);
//        }
//    }
//
//    @Test
//    @DisplayName("전체조회 테스트를 수행하면 게시물의 개수가 5개이다.")
//    void findAll() {
//        //given
//
//        //when
//        List<FreeBoard> freeBoardList = repository.findAll();
//        //then
//        freeBoardList.forEach(System.out::println);
//
//        assertEquals(5, freeBoardList.size());
//    }
//
//}