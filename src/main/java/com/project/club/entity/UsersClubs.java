package com.project.club.entity;


import com.project.entity.ClubAuth;
import com.project.entity.UsersClubAuth;
import lombok.*;

import java.time.LocalDateTime;
import java.util.Date;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UsersClubs {

    private long userClubJoinNo;
    private ClubAuth userClubRole;
    private Date userClubDate;
    private String account;
    private long clubNo;
    private boolean userClubIsWithdrawn;
    private UsersClubAuth userClubStatus; // 추가된 필드
    private LocalDateTime userClubUpdatedAt; // 상태 변경 시간

}
