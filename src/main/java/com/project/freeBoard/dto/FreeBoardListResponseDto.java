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
@EqualsAndHashCode
@Builder
public class FreeBoardListResponseDto {

    private Long boardNo; // 원본 게시물 번호
    private String date; // 포맷팅된 날짜문자열
    private String account;
    private String content;
    private String boardImg;
    private long clubNo;

    // 엔터티 -> DTO 변환하는 생성자
    public FreeBoardListResponseDto(FreeBoardFindAllDto b){
        this.boardNo = b.getClubCommunityNo();
        LocalDateTime regTime = b.getClubCommunityCreatedAt();
        this.date = dateFormatting(regTime);
        this.account = b.getAccount();
        this.content = b.getClubCommunityContent();
        this.boardImg = b.getClubCommunityImage();
        this.clubNo = b.getClubNo();
    }

    private String dateFormatting(LocalDateTime regDateTime) {
        DateTimeFormatter pattern = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        return pattern.format(regDateTime);
    }


}
