package com.project.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
public enum ClubAuth {
    ADMIN("관리자", 10),
    MEMBER("일반회원", 5),
    PENDING("대기중인회원", 1);

    private String desc;    // 권한 역할
    private Integer authNumber;  // 권한 번호

}
