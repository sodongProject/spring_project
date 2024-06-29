package com.project.login.entity;

import com.project.entity.Auth;
import com.project.entity.Gender;
import lombok.*;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
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

    @Setter
    @Enumerated(EnumType.STRING)
    private Auth auth; // 기본값 설정

    @Setter
    private Double temperature; // 기본값 설정

    @Setter
    private String profileImage;

    private LocalDateTime createdAt;

    private Double remainedPoint;

    private Boolean isWithdrawn;

    private String sessionId;

    private LocalDateTime limitTime;

    private String profileImg;

    public Users(String account, String password, String userName) {
        this.account = account;
        this.password = password;
    }


}