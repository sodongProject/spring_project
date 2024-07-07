package com.project.club.dto.clubNoticeBoard.response;

import com.project.club.entity.ClubNoticeBoard;
import lombok.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class ClubNoticeBoardListResponseDto {

    private long clubNoticeNo;
    private long clubNo;
    private String shortTitle; // 5글자 이상 줄임 처리된 제목
    private String shortContent; // 30자 이상 줄임 처리된 글 내용
    private String date; // 포맷팅된 날짜문자열
    private int view; // 조회 수
    private String account;
    private String clubProfile;
    private String userAuthStatus;
    private String userName;

    public ClubNoticeBoardListResponseDto (ClubNoticeBoard C, String userAuthStatus, String userName) {
        this.clubNoticeNo = C.getClubNoticeNo();
        this.clubNo = C.getClubNo();
        this.shortTitle = makeShortTitle(C.getClubNoticeTitle());
        this.shortContent = makeShortContent(C.getClubNoticeContent());
        this.account = C.getAccount();
        this.view = C.getClubNoticeViewCount();
        this.userAuthStatus = userAuthStatus;
        this.userName = userName;

        LocalDateTime createAt = C.getClubNoticeCreatedAt();
        this.date = dateFormatting(createAt);
    }

    private String dateFormatting(LocalDateTime createAt) {
        DateTimeFormatter pattern
                = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        return pattern.format(createAt);
    }

    private String makeShortContent(String content) {
        return (content.length() > 30)
                ? content.substring(0, 30) + "..."
                : content;
    }

    private String makeShortTitle(String title) {
        return (title.length() > 5)
                ? title.substring(0, 5) + "..."
                : title;
    }

}
