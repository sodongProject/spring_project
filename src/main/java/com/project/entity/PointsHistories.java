package com.project.entity;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PointsHistories {
    private long pointHistoryNo;
    private long pointHistoryAmount;
    private PointType pointHistoryType;
    private LocalDateTime pointHistoryDateTime;
    private String account;
    private long scheduleNo;
}
