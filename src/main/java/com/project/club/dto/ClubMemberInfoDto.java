package com.project.club.dto;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class ClubMemberInfoDto {

    private String account;
    private String userName;
    private String role;
    private String status;
    private double temperature;
    private String joinDate;

}
