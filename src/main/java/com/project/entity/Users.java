package com.project.entity;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Users {
    private String account;
    private String password;
    private String userName;
    private String email;
    private Gender gender;
    private String phoneNumber;
    private String address;
    private Auth auth;
    private double temperature;
    private String profile_image;
    private LocalDateTime joinedAt;
    private double remainedPoint;
    private boolean isWithdrawn;

}
