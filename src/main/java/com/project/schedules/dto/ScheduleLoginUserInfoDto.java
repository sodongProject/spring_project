package com.project.schedules.dto;

import lombok.*;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ScheduleLoginUserInfoDto {
    private Long userScheduleJoinNo;
    private ScheduleAuth userScheduleRole;
}
