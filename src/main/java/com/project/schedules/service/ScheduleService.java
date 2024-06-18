package com.project.schedules.service;

import com.project.entity.Schedules;
import com.project.schedules.dto.ScheduleWriteDto;
import com.project.schedules.mapper.ScheduleMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ScheduleService {

    private final ScheduleMapper scheduleMapper;

    public void addSchedule(ScheduleWriteDto dto) {

        Schedules s = dto.toEntity();
        System.out.println("s = " + s);
        scheduleMapper.save(s);
    }

    public void deleteSchedule(Long scheduleNo) {

        scheduleMapper.delete(scheduleNo);
    }
}
