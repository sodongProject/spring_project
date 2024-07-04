package com.project.schedules.dto;

import com.project.entity.Schedules;
import lombok.*;

@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@Builder
public class ScheduleDetailDto {

    private Schedules schedule;
    private ScheduleLoginUserInfoDto loginUserInfoDto;

    public ScheduleDetailDto(Schedules schedule, ScheduleLoginUserInfoDto loginUserInfoDto) {
        this.schedule = schedule;
        this.loginUserInfoDto = loginUserInfoDto;
    }
}
