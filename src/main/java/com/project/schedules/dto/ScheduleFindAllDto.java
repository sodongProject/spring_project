package com.project.schedules.dto;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

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
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime scheduleAt;
    private String scheduleContent;
    @Setter
    private Double participationPoints;
    private String account;
}
