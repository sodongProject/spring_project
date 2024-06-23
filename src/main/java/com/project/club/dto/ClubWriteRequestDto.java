package com.project.club.dto;

import com.project.club.entity.Club;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@Setter @Getter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor

public class ClubWriteRequestDto {

    private String writer;
    private String content;
    private String title;
    private Boolean clubCompetition = false; // 기본값 false
    private MultipartFile clubProfile;

    public Club toEntity() {
        Club C = new Club();
        C.setAccount(this.writer);
        C.setClubDescription(this.content);
        C.setClubName(this.title);
        C.setClubCompetition(this.clubCompetition);
        return C;
    }
}
