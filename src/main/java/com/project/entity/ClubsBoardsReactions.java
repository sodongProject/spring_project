package com.project.entity;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ClubsBoardsReactions {
    private long reactionNo;
    private boolean reaction;
    private LocalDateTime reactionDate;
    private long clubCommunityNo;
    private String account;
}
