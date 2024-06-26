package com.project.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
public enum Auth {
    USER("일반회원", 1),
    ADMIN("관리자회원", 10)

    private String desc; //권한 역할
    private int authNumber; //권한 번호

}
