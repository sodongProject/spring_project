package com.project.freeBoard.repository;

import com.project.entity.FreeBoard;

import java.util.List;

// 게시판 CRUD
public interface FreeBoardRepository {

    // 게시글 목록 조회
    List<FreeBoard> findAll();

    // 게시글 상세 조회
    FreeBoard findOne(int boardNo);

    // 게시글 등록
    boolean save(FreeBoard freeBoard);

    // 게시글 삭제
    boolean delete(int boardNo);

    // 조회수
    void upViewCount(int boardNo);
}