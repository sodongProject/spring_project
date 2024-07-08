package com.project.schedules.dto;

import lombok.*;

@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ExileUserDto {
    private Long scheduleNo;
    private Long clubNo;
    private String account;
}
