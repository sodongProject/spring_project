package com.project.freeBoard.mapper;

import com.project.entity.FreeBoard;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class FreeBoardMapperTest {

    @Autowired
    FreeBoardMapper freeBoardMapper;

    @Test
    @DisplayName("게시글 등록에 성공해라")
    void saveTest() {
        FreeBoard freeBoard = FreeBoard.builder()
                .boardTitle("Test Title")
                .content("Test Content")
                .account("pompom123")
                .boardImg("testImage.jpg")
                .clubNo(1)
                .build();

        boolean flag = freeBoardMapper.save(freeBoard);

        assertTrue(flag);
    }


    @Test
    @DisplayName("10개 저장")
    void insertTest(){
            for(int i=1; i<=10; i++){
                FreeBoard freeBoard = FreeBoard.builder()
                        .boardTitle("Test Title")
                        .content("Test Content")
                        .account("pompom123")
                        .boardImg("testImage.jpg")
                        .clubNo(1)
                        .build();

                boolean flag = freeBoardMapper.save(freeBoard);

                assertTrue(flag);
            }

        }

}
