package com.project.club.entity;

import lombok.*;

import java.time.LocalDateTime;

@Getter @ToString
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
@Builder
public class Club {

    private int clubNo;
    private String clubName;
    private String clubDescription;
    private LocalDateTime clubCreatedAt;
    private String clubProfile;
    private String clubCompetition;
    private long clubMemberMax;
    private boolean clubIsDelete;
    private String account;


}
