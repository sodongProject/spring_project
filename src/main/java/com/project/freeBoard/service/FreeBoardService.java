package com.project.freeBoard.service;

import com.project.entity.FreeBoard;
import com.project.freeBoard.dto.FreeBoardFindAllDto;
import com.project.freeBoard.dto.FreeBoardListResponseDto;
import com.project.freeBoard.dto.FreeBoardWriteRequestDto;
import com.project.freeBoard.dto.FreeBoardDto;
import com.project.freeBoard.mapper.FreeBoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
@Slf4j
public class FreeBoardService {

    private final FreeBoardMapper freeBoardMapper;


    // 목록 조회 요청 중간 처리
    public List<FreeBoardListResponseDto> findList(long clubNo) {
        log.info("서비스에서 받은 클럽 번호: {}", clubNo);
        List<FreeBoardFindAllDto> boardList = freeBoardMapper.findAll(clubNo);
        log.info("쿼리 결과 크기: {}", boardList.size());


        for (FreeBoardFindAllDto freeBoardFindAllDto : boardList) {
            log.info("조회된 데이터: {}", freeBoardFindAllDto);
        }

        List<FreeBoardListResponseDto> dtoList =
                boardList
                        .stream()
                        .map(FreeBoardListResponseDto::new)
                        .collect(Collectors.toList());

//        System.out.println("\n\n\n\n");
//        dtoList.forEach(System.out::println);
//        System.out.println("\n\n\n\n");
        //dtoList.forEach(dto -> log.info("DTO: {}", dto));

        return dtoList;
    }

    // 등록 중간 처리
    public void insert(FreeBoardWriteRequestDto dto, String snsContentsPath) {
        FreeBoard b = dto.toEntity();
        b.setBoardImg(snsContentsPath); //프로필 사진경로 엔터티 설정

        System.out.println("\n\n");
        System.out.println(b);

        freeBoardMapper.save(b);
    }

    public FreeBoardDto getPostByBno(int bno) {
        FreeBoard freeBoard = freeBoardMapper.findOne(bno);
        if (freeBoard == null) {
            throw new IllegalArgumentException("Invalid post ID: " + bno);
        }
        return new FreeBoardDto(freeBoard);
    }

    // 삭제 중간 처리
    public boolean remove(long boardNo) {
        return freeBoardMapper.delete(boardNo);
    }
}
