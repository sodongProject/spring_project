package com.project.schedules.entity;

import lombok.*;

import java.time.LocalDate;

@Getter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class User {
    private String account;
    private String password;
    private String userName;
    private String email;
    private Gender gender;
    private String phoneNumber;
    private String address;
    private UserAuth auth;
    private double temperature;
    private LocalDate createdAt;
    private double remainedPoint;
    public boolean isWithdrawn;
}
