package com.project.entity;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ClubsNoticeReplies {

    private long replyNo;
    private String replyTet;
    private String replyWriter;
    private LocalDateTime replyDate;
    private boolean replyIsDeleted;
    private long clubNoticeNo;
}
