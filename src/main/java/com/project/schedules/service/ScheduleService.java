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

    public Schedules detailSchedule(Long scheduleNo) {

        return scheduleMapper.findOne(scheduleNo);
    }

    public void registerUserIntoSchedule(long scheduleNo, String account, long clubNo) {

        long a = scheduleMapper.userInClub(clubNo, account);

        scheduleMapper.registerUserIntoSchedule(scheduleNo, a);
    }
}
