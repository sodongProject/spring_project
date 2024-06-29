package com.project.login.dto;

import lombok.*;

@Setter
@Getter @ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Builder
public class SignInDto {

    private String account;
    private String password;
    private boolean autoLogin;
}
