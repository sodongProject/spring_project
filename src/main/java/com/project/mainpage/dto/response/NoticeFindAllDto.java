package com.project.mainpage.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Getter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class NoticeFindAllDto {

    private long mainNoticeNo; // 공지글 번호
    private String mainNoticeTitle; // 제목
    private String mainNoticeContent; // 내용
    private LocalDateTime mainNoticeCreatedAt; // 작성시간
    private String mainNoticeImage; // 이미지
    private int mainNoticeViewCount; // 조회 수
    private boolean mainNoticeIsDeleted = false; // 글 삭제여부 (기본값 false)
    private String account; // 유저 ID

}
