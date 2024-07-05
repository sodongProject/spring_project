package com.project.club.dto;

import com.project.club.entity.Club;
import lombok.*;

import java.time.format.DateTimeFormatter;

@Setter
@Getter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class ClubDescriptionResponseDto {

    private long clubNo;
    private String writer;
    private String title;
    private String content;
    private String regDateTime;
    private String userAuthStatus; // 사용자 권한 상태 추가
    private String userName;
    private String multipartFile;



    public ClubDescriptionResponseDto(Club c, String userName) {
        this.clubNo = c.getClubNo();
        this.title = c.getClubName();
        this.writer = c.getAccount();
        this.content = c.getClubDescription();
        this.userName = userName;
        this.multipartFile = c.getClubProfile();


        DateTimeFormatter pattern
                = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 a hh시 mm분 ss초");
        this.regDateTime = pattern.format(c.getClubCreatedAt());
    }

}
