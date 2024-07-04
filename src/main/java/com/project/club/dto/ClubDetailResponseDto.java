package com.project.club.dto;

import com.project.club.entity.Club;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.time.format.DateTimeFormatter;

@Setter
@Getter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class ClubDetailResponseDto {

    private long clubNo;
    private String writer;
    private String title;
    private String content;
    private String regDateTime;
    private String userAuthStatus; // 사용자 권한 상태 추가
    private String multipartFile;
    private String userName;


    public ClubDetailResponseDto(Club c, String userAuthStatus, String userName) {
        this.clubNo = c.getClubNo();
        this.title = c.getClubName();
        this.writer = c.getAccount();
        this.content = c.getClubDescription();
        this.userAuthStatus = userAuthStatus; // 사용자 권한 상태 설정
        this.multipartFile = c.getClubProfile();
        this.userName = userName;

        DateTimeFormatter pattern
                = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 a hh시 mm분 ss초");
        this.regDateTime = pattern.format(c.getClubCreatedAt());
    }

}
