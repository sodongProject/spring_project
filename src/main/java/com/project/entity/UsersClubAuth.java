package com.project.entity;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
public enum UsersClubAuth {
    APPROVED("가입승인", 10),
    DENIED("가입거절", 7),
    CANCELLED("회원탈퇴", 3),
    WAITING("가입대기중",1);


    private String desc;    // 권한 역할
    private Integer authNumber;  // 권한 번호
}
