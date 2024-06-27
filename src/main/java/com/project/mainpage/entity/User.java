package com.project.mainpage.entity;

import com.project.entity.Auth;
import com.project.entity.Gender;

import lombok.*;

import java.time.LocalDateTime;

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
    private Auth auth;
    private double temperature;
    private LocalDateTime createdAt;
    private double remainedPoint;
    public boolean isWithdrawn;
}
