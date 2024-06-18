package com.project.homepage.entity;

import lombok.*;

import java.time.LocalDateTime;

@Getter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NoticeBoard {

    private long mainNoticeNo; // 공지 번호
    private String mainNoticeTitle; // 제목
    private String mainNoticeContent; // 내용
    private LocalDateTime mainNoticeCreatedAt; // 작성시간
    private String mainNoticeImage; // 이미지
    private int mainNoticeViewCount = 0; // 조회 수
    private boolean mainNoticeIsDeleted = false; // 글 삭제여부 (기본값 false)
    private String account; // 유저 ID
}
