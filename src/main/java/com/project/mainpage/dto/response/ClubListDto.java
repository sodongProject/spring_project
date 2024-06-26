package com.project.mainpage.dto.response;

import lombok.*;

import java.time.LocalDateTime;

@Getter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class ClubListDto  {

    private long clubNo; // 클럽 번호
    private String clubName; // 클럽 이름
    private LocalDateTime clubCreatedAt; // 클럽 생성 날짜 및 시간
    private String clubProfile; // 클럽 프로필
    private Boolean clubCompetition; // 클럽 대회 여부
    private long clubMemberMax; // 클럽 가입자 수
    private String account; // 계정
    private long scheduleCount; // 스케줄 번호

    public ClubListDto(ClubFindAllDto dto) {
        this.clubNo = dto.getClubNo();
        this.clubName = dto.getClubName();
        this.clubCreatedAt = dto.getClubCreatedAt();
        this.clubProfile = dto.getClubProfile();
        this.clubCompetition = dto.getClubCompetition();
        this.clubMemberMax = dto.getClubMemberMax();
        this.account = dto.getAccount();
        this.scheduleCount = dto.getScheduleCount();
    }

}