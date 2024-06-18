package com.project.entity;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ClubCommunityBoards {
    private long clubCommunityNo;
    private String clubCommunityTitle;
    private String clubCommunityContent;
    private LocalDateTime clubCommunityCreatedAt;
    private String clubCommunityImage;
    private int clubCommunityViewCount;
    private boolean clubCommunityIsDeleted;
    private String account;
    private long clubNo;

}
