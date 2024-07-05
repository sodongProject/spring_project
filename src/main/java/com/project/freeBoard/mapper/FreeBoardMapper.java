package com.project.freeBoard.mapper;

import com.project.entity.FreeBoard;
import com.project.freeBoard.dto.FreeBoardFindAllDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FreeBoardMapper {

    // 목록 조회
    List<FreeBoardFindAllDto> findAll();

    // 상세 조회
    FreeBoard findOne(long boardNo);

    // 등록
    boolean save(FreeBoard freeBoard);

    // 삭제
    boolean delete(long boardNo);

    // 조회수
    void updateViewCount(long boardNo);


}
