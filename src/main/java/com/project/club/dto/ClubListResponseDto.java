package com.project.club.dto;

import lombok.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class ClubListResponseDto {

    private long clubNo;
    private String shortTitle; // 5글자 이상 줄임 처리된 제목
    private String shortContent; // 30자 이상 줄임 처리된 글 내용
    private String date; // 포맷팅된 날짜문자열
    private int view; // 조회 수
    private String account;
    private String clubProfile;
    private String userAuthStatus; // 사용자 권한 상태 추가

    public ClubListResponseDto (ClubFindAllDto C, String userAuthStatus){
        this.clubNo = C.getClubNo();
        this.shortTitle = makeShortTitle(C.getClubName());
        this.shortContent = makeShortContent(C.getClubDescription());
        this.account = C.getAccount();
        this.clubProfile = C.getClubProfile();

        // 게시물 등록시간
        LocalDateTime regTime = C.getClubCreatedAt();
        this.date = dateFormatting(regTime);
        this.view = (int) C.getClubMemberMax();
        this.userAuthStatus = userAuthStatus; // 사용자 권한 상태 설정
    }

    private String dateFormatting(LocalDateTime regDateTime) {
        DateTimeFormatter pattern
                = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        return pattern.format(regDateTime);
    }

    private String makeShortContent(String content) {
        return (content.length() > 10)
                ? content.substring(0, 10) + "..."
                : content;
    }

    private String makeShortTitle(String title) {
        return (title.length() > 5)
                ? title.substring(0, 5) + "..."
                : title;
    }

}
