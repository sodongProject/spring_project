package com.project.schedules.dto;

import lombok.*;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ScheduleLoginUserInfoDto {
    private Long scheduleNo;
    private ScheduleAuth userScheduleRole;
}
