package com.project.club.dto;

import com.project.club.entity.UsersClubs;
import com.project.entity.ClubAuth;
import com.project.entity.Users;
import com.project.entity.UsersClubAuth;
import lombok.*;

@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ClubLoginUserInfoDto {

    private String account;
    private ClubAuth clubAuth;
    private UsersClubAuth role;

    public ClubLoginUserInfoDto(Users user, UsersClubs UC) {
        this.account = user.getAccount();
        this.clubAuth = UC.getUserClubRole();
        this.role = UC.getUserClubStatus();
    }


}
