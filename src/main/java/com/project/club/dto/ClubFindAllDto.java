package com.project.club.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class ClubFindAllDto {

    private long clubNo;
    private String clubName;
    private String clubDescription;
    private LocalDateTime clubCreatedAt;
    private String clubProfile;
    private Boolean clubCompetition;
    private long clubMemberMax;
    private Boolean clubIsDeleted;
    private String account;
}
