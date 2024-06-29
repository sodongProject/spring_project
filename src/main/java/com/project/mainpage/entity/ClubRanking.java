package com.project.mainpage.entity;

import lombok.*;

import java.time.LocalDateTime;
@Getter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ClubRanking {

    private long clubNo; // 클럽 번호
    private String clubName; // 클럽 이름
    private String clubDescription; // 클럽 설명
    private LocalDateTime clubCreatedAt; // 클럽 생성 날짜 및 시간
    private String clubProfile; // 클럽 프로필
    private Boolean clubCompetition; // 클럽 대회 여부
    private long clubMemberMax; // 클럽 가입자 수
    private Boolean clubIsDeleted; // 클럽 삭제 여부
    private String account; // 계정
}
