package com.project.club.dto;

import com.project.club.entity.Club;
import lombok.*;

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


    public ClubDetailResponseDto(Club c) {
        this.clubNo = c.getClubNo();
        this.title = c.getClubName();
        this.writer = c.getAccount();
        this.content = c.getClubDescription();

        DateTimeFormatter pattern
                = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 a hh시 mm분 ss초");
        this.regDateTime = pattern.format(c.getClubCreatedAt());
    }

}
