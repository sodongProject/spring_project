package com.project.login.dto;

import com.project.entity.Auth;
import com.project.login.entity.Users;
import lombok.*;

@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LoginUserInfoDto {

    //클라이언트에게 보낼 정보들
    private String account;
    private String userName;
    private String email;
    private String phoneNumber;
    private String address;
    private Auth auth;
    private double temperature;

    public LoginUserInfoDto(Users user) {
        this.account = user.getAccount();
        this.userName = user.getUserName();
        this.email = user.getEmail();
        this.phoneNumber = user.getPhoneNumber();
        this.address = user.getAddress();
        this.auth = user.getAuth();
//        this.temperature = user.getTemperature();
    }
}
