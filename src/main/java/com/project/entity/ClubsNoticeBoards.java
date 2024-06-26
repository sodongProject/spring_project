package com.project.entity;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ClubsNoticeBoards {

    private long clubNoticeNo;
    private String clubNoticeTitle;
    private String clubNoticeContent;
    private LocalDateTime clubNoticeCreatedAt;
    private String clubNoticeImage;
    private boolean clubNoticeIsDeleted;
    private String account;
    private long clubNo;
}
