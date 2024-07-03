package com.project.club.dto;

import com.project.club.entity.UsersClubs;
import com.project.entity.ClubAuth;
import com.project.entity.Users;
import com.project.entity.UsersClubAuth;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

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
    private long clubNo;
    private String userName;
    private MultipartFile clubProfile;


    public ClubLoginUserInfoDto(Users user, UsersClubs UC) {
        this.account = user.getAccount();
        this.clubAuth = UC.getUserClubRole();
        this.role = UC.getUserClubStatus();
        this.clubNo = UC.getClubNo();
        this.userName = user.getUserName();
    }


}
