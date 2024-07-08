package com.project.club.dto.clubNoticeBoard.response;

import com.project.club.entity.ClubNoticeBoard;
import lombok.*;

import java.time.format.DateTimeFormatter;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class ClubNoticeBoardDetailResponseDto {

    private long clubNoticeNo;
    private String writer;
    private String title;
    private String content;
    private String regDateTime;
    private String userAuthStatus;


    public ClubNoticeBoardDetailResponseDto (ClubNoticeBoard C, String userAuthStatus) {
        this.clubNoticeNo = C.getClubNoticeNo();
        this.writer = C.getAccount();
        this.title = C.getClubNoticeTitle();
        this.content = C.getClubNoticeContent();
        this.userAuthStatus = userAuthStatus;

        DateTimeFormatter pattern
                = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 ");
        this.regDateTime = pattern.format(C.getClubNoticeCreatedAt());
    }

}
