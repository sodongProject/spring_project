package com.project.freeBoard.dto;

import com.project.entity.FreeBoard;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class FreeBoardListResponseDto {

    private int bno; // 원본 게시물 번호
    private String date; // 포맷팅된 날짜문자열
    private int view; // 조회 수
    //private boolean hit; // HIT 게시물인가?
    //private boolean newArticle; // 새 게시물(1시간 이내)인가?
    //private int replyCount; // 댓글 수
    private String account;

    // 엔터티 -> DTO 변환하는 생성자
    public FreeBoardListResponseDto(FreeBoard b){
        this.bno = b.getBoardNo();
        this.date = dateFormatting(b.getRegDateTime());
        this.view = b.getViewCount();
    }

    private String dateFormatting(LocalDateTime regDateTime){
        DateTimeFormatter pattern
                = DateTimeFormatter.ofPattern("yyyy. MM. dd");
        return pattern.format(regDateTime);
    }


}
