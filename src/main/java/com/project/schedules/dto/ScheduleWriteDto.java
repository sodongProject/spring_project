package com.project.schedules.dto;

import com.project.entity.Schedules;
import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter @Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ScheduleWriteDto {

    private String scheduleTitle;
    private String scheduleContent;
    private String scheduleImage;
    private String account;
    private long clubNo;

    public Schedules toEntity() {
        Schedules s = new Schedules();
        s.setScheduleTitle(this.scheduleTitle);
        s.setScheduleContent(this.scheduleContent);
        s.setScheduleImage(this.scheduleImage);
        s.setAccount(this.account);
        s.setClubNo(this.clubNo);
        s.setScheduleAt(LocalDateTime.now());

        return s;
    }
}
