package com.project.club.dto;

import com.project.entity.ClubAuth;
import com.project.entity.UsersClubAuth;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ApplicantDto {
    private String account;
    private String userName;
    private double temperature;
    private String role;
    private String status;
}
