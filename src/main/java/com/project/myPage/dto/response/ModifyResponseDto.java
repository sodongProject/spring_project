package com.project.myPage.dto.response;

import com.project.entity.Gender;
import lombok.*;

@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ModifyResponseDto {

    private String account;
    private String email;
    private String phoneNumber;
    private String address;
    private String password;
    private String profileImage;
    private String name;
    private Gender gender;
    private double temperature;
    private double userPoint;

}
