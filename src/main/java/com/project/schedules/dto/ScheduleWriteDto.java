package com.project.schedules.dto;

import com.project.entity.Schedules;
import lombok.*;

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
    private Long participationPoints;
    private Long clubNo;

    public Schedules toEntity() {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
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
