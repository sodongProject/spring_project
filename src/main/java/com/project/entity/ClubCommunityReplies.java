package com.project.entity;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ClubCommunityReplies {

    private long replyNo;
    private String replyText;
    private String replyWriter;
    private LocalDateTime replyDate;
    private boolean replyStatus;
    private long clubCommunityNo;
}
