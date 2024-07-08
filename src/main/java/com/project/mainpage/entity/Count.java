package com.project.mainpage.entity;

import lombok.*;

@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Count {

    private long clubNo; // 동호회 PK값
    private String account; // 유저 PK값
    private long schedule_no; // 스케줄 PK값
}
