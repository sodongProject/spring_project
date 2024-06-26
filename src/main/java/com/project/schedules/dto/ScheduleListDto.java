package com.project.schedules.dto;

import com.project.schedules.common.PageMaker;
import lombok.*;

import java.util.List;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ScheduleListDto {

    private List<ScheduleFindAllDto> scheduleList;
    private PageMaker pageInfo;
}
