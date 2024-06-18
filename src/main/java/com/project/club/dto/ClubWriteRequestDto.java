package com.project.club.dto;

import com.project.club.entity.Club;
import lombok.*;

@Setter @Getter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor

public class ClubWriteRequestDto {

    private String writer;
    private String content;
    private String title;

    public Club toEntity() {
        Club C = new Club();
        C.setAccount(this.writer);
        C.setClubDescription(this.content);
        C.setClubName(this.title);
        return C;
    }

}
