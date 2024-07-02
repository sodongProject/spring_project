package com.project.schedules.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
public enum ScheduleAuth {
    MEMBER, ADMIN, WAITING, DENIED
}
