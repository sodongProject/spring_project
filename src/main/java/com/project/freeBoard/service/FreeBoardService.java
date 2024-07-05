package com.project.freeBoard.service;

import com.project.entity.FreeBoard;
import com.project.freeBoard.dto.FreeBoardFindAllDto;
import com.project.freeBoard.dto.FreeBoardListResponseDto;
import com.project.freeBoard.dto.FreeBoardWriteRequestDto;
import com.project.freeBoard.mapper.FreeBoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
@Slf4j
public class FreeBoardService {

    private final FreeBoardMapper freeBoardMapper;


    // 목록 조회 요청 중간 처리
    public List<FreeBoardListResponseDto> findList() {
        List<FreeBoardFindAllDto> boardList = freeBoardMapper.findAll();

        List<FreeBoardListResponseDto> dtoList =
                boardList
                        .stream()
                        .map(FreeBoardListResponseDto::new)
                        .collect(Collectors.toList());

        System.out.println("\n\n\n\n");
        dtoList.forEach(System.out::println);
        System.out.println("\n\n\n\n");

        return dtoList;
    }

    // 등록 중간 처리
    public boolean insert(FreeBoardWriteRequestDto dto) {
        FreeBoard b = dto.toEntity();

        System.out.println("\n\n");
        System.out.println(b);

        return freeBoardMapper.save(b);
    }

    // 삭제 중간 처리
    public boolean remove(long boardNo) {
        return freeBoardMapper.delete(boardNo);
    }
}
