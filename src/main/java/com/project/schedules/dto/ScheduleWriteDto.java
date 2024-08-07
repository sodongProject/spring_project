package com.project.schedules.dto;

import com.project.entity.Schedules;
import lombok.*;
import org.checkerframework.checker.formatter.qual.Format;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Getter @Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ScheduleWriteDto {

    private String scheduleTitle;
    private String scheduleContent;
    private String scheduleAt;
    private Double participationPoints;
    private Long clubNo;

    public Schedules toEntity() {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        LocalDateTime dateTime = LocalDateTime.parse(scheduleAt, formatter);

        Schedules s = new Schedules();
        s.setScheduleTitle(this.scheduleTitle);
        s.setScheduleContent(this.scheduleContent);
        s.setParticipationPoints(this.participationPoints);
        s.setScheduleAt(dateTime);
        s.setClubNo(this.clubNo);
        return s;
    }
}
