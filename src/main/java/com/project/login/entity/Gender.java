package com.project.login.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
public enum Gender {

    MALE("M"),
    FEMALE("F");

    private String gender;

}
