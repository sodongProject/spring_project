package com.project.schedules.dto;

import lombok.*;

@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ExitUserDto {
    private Long scheduleNo;
    private Long clubNo;
}
