package com.project.club.dto.clubNoticeBoard;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class ClubNoticeBoardFindAllDto {

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
