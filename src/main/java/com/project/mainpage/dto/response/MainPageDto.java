package com.project.mainpage.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MainPageDto {

    private long clubNo; // 클럽 번호
    private String clubName; // 클럽 이름
    private LocalDateTime clubCreatedAt; // 클럽 생성 날짜 및 시간
    private String clubProfile; // 클럽 프로필
    private Boolean clubCompetition; // 클럽 대회 여부
    private long clubMemberMax; // 클럽 가입자 수
    private String account; // 계정
}
