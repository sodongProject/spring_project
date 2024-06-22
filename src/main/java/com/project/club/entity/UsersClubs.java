package com.project.club.entity;


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
    private String userClubRole;
    private Date userClubDate;
    private String account;
    private long clubNo;
    private boolean userClubIsWithdrawn;
    private String userClubStatus; // 추가된 필드
    private LocalDateTime userClubUpdatedAt; // 상태 변경 시간

}
