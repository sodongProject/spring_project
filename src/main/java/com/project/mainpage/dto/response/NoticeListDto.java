package com.project.mainpage.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;

@Getter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class NoticeListDto {

    private long mainNoticeNo; // 공지글 번호
    private String mainNoticeTitle; // 제목
    private String mainNoticeContent; // 내용
    private LocalDateTime mainNoticeCreatedAt; // 작성시간
    private int mainNoticeViewCount; // 조회 수
    private String date; // 포맷팅된 날짜문자열
    private String account;

    public NoticeListDto (NoticeFindAllDto dto) {
        this.account = dto.getAccount();
        this.mainNoticeTitle = dto.getMainNoticeTitle();
        this.mainNoticeContent = dto.getMainNoticeContent();
        this.mainNoticeCreatedAt = dto.getMainNoticeCreatedAt();
    }

}
