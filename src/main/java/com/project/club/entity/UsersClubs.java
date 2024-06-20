package com.project.club.entity;


import lombok.*;

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
    private String account;
    private long clubNo;
    private boolean userClubIsWithdrawn;


    private String userClubStatus; // 추가된 필드
    private java.sql.Timestamp userClubDate;
    private java.sql.Timestamp userClubUpdatedAt; // 상태 변경 시간

}
