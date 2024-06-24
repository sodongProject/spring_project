package com.project.schedules.mapper;

import com.project.schedules.dto.ScheduleFindAllDto;
import com.project.entity.Schedules;

import java.util.List;

public interface ScheduleMapper {

    // 스케줄 상세 조회
    Schedules findOne(long scheduleNo);

    // 스케줄 전체 조회
    List<ScheduleFindAllDto> findAll(long clubNo);

    // 스케줄 등록
    boolean save(Schedules schedule);

    // 스케줄 삭제
    boolean delete(long scheduleNo);

    // 조회수 상승
    void upViewCount(long scheduleNo);

}
