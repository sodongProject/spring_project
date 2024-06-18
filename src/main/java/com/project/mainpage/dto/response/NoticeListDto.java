package com.project.mainpage.dto.response;

import lombok.Getter;

@Getter
public class NoticeListDto {

    private long mainNoticeNo; // 공지글 번호
    private String mainNoticeTitle; // 제목
    private String mainNoticeContent; // 내용
    private int mainNoticeViewCount; // 조회 수
    private String date; // 포맷팅된 날짜문자열
    private String account;


}
