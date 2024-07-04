package com.project.freeBoard.dto;

import com.project.entity.FreeBoard;
import lombok.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FreeBoardListResponseDto {

    private Long boardNo; // 원본 게시물 번호
    private String date; // 포맷팅된 날짜문자열
    private int view;
    private String account;
    private String content;
    private String boardImg;
    //private String boardTitle;
    private int viewCount;
    private int clubNo;

    // 엔터티 -> DTO 변환하는 생성자
    public FreeBoardListResponseDto(FreeBoard b){
        //this.boardNo = b.getBoardNo();
        LocalDateTime regTime = b.getRegDateTime();
        this.date = dateFormatting(b.getRegDateTime());
        this.view = b.getViewCount();
        this.account = b.getAccount();
        this.content = b.getContent();
        this.boardImg = b.getBoardImg();
        //this.boardTitle = b.getBoardTitle();
        this.viewCount = b.getViewCount();
        this.clubNo = b.getClubNo();
    }

    private String dateFormatting(LocalDateTime regDateTime){
        if (regDateTime == null) {
            return "N/A"; // 기본값 설정 또는 적절한 값을 반환
        }
        DateTimeFormatter pattern
                = DateTimeFormatter.ofPattern("yyyy. MM. dd");
        return pattern.format(regDateTime);
    }


}
