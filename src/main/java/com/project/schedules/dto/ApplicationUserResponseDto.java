package com.project.schedules.dto;

import lombok.*;

@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ApplicationUserResponseDto {

    private String account;
    private double temperature;
}
