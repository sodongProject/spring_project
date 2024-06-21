package com.project.login.entity;

import com.project.entity.Auth;
import com.project.entity.Gender;
import lombok.*;

import java.time.LocalDateTime;

@Getter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Users {

    private String account;
    @Setter
    private String password;
    private String userName;
    private String email;
    @Setter
    private Gender gender;
    private String phoneNumber;
    private String address;
    private Auth auth;
    private Double temperature;
    @Setter
    private String profileImage;
    private LocalDateTime createdAt;
    private Double remainedPoint;
    private Boolean isWithdrawn;

    public String getProfileImage() {
        return profileImage;
    }

}