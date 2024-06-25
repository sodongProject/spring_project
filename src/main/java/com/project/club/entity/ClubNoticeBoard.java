package com.project.club.entity;

import lombok.*;

import java.time.LocalDateTime;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ClubNoticeBoard {

    private long clubNoticeNo;
    private String clubNoticeTitle;
    private String clubNoticeContent;
    private LocalDateTime clubNoticeCreatedAt;
    private String clubNoticeImage;
    private int clubNoticeViewCount;
    private boolean clubNoticeIsDeleted;
    private String account;
    private long clubNo;

}
