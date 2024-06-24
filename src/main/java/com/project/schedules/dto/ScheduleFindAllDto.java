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
    private long scheduleNo;
    private String scheduleTitle;
    private String scheduleImage;
    private int scheduleViewCount;
    private int scheduleCount;
    private LocalDateTime scheduleAt;
}
