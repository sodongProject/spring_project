package com.project.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
public enum PointType {
    CREDIT("입금"), DEBIT("출금");

    private String pointType;
}
