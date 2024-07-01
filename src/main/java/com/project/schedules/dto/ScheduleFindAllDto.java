package com.project.schedules.dto;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ScheduleFindAllDto {
    private Long scheduleNo;
    private String scheduleTitle;
    private int scheduleViewCount;
    private int scheduleCount;
    private LocalDateTime scheduleAt;
    private String scheduleContent;
    private Long participationPoints;
}
