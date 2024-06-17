package com.project.schedules.dto;

import com.project.schedules.entity.User;
import com.project.schedules.entity.UserAuth;
import lombok.*;

@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LoginUserInfoDto {

    private String account;
    private String userName;
    private String email;
    private String phoneNumber;
    private String address;
    private UserAuth auth;
    private double temperature;

    LoginUserInfoDto(User user) {
        this.account = user.getAccount();
        this.userName = user.getUserName();
        this.email = user.getEmail();
        this.phoneNumber = user.getPhoneNumber();
        this.address = user.getAddress();
        this.auth = user.getAuth();
        this.temperature = user.getTemperature();
    }
}
