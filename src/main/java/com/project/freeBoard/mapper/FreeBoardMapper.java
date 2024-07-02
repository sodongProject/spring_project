package com.project.freeBoard.mapper;

import com.project.entity.FreeBoard;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;

import java.util.List;

@Mapper
public interface FreeBoardMapper {

    // 등록
    boolean save(FreeBoard freeBoard);

    // 삭제
    boolean delete(long freeBoardNo);

    // 목록 조회
    List<FreeBoard> findAll();

    // 상세 조회
    FreeBoard findOne(long freeBoardNo);

}
