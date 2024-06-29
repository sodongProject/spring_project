package com.project.mainpage.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class NoticeDetailDto {

    private long mainNoticeNo; // 공지글 번호
    private String mainNoticeTitle; // 제목
    private String mainNoticeContent; // 내용
    private LocalDateTime mainNoticeCreatedAt; // 작성시간
}
