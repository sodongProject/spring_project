package com.project.entity;


import lombok.*;

import java.time.LocalDateTime;

@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Schedules {
    // 스케쥴 번호
    private long scheduleNo;
    // 스케쥴 제목
    @Setter
    private String scheduleTitle;
    // 스케줄 내용
    @Setter
    private String scheduleContent;
    // 스케줄 생성 시간
    private LocalDateTime scheduleCreatedAt = LocalDateTime.now();
    // 스케줄 이미지
    @Setter
    private String scheduleImage;
    // 스케줄 조회수
    private int scheduleViewCount;
    // 스케줄 삭제 여부
    private boolean scheduleIsDeleted;
    // 스케줄 주최자
    @Setter
    private String account;
    // 스케줄을 만든 동호회
    @Setter
    private long clubNo;
    // 스케줄 참여 인원
    private int scheduleCount;
    // 스케줄 일자
    @Setter
    private LocalDateTime scheduleAt;
}
