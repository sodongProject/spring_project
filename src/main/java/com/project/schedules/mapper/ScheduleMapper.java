package com.project.schedules.mapper;

import com.project.schedules.dto.ScheduleFindAllDto;
import com.project.entity.Schedules;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ScheduleMapper {

    // 스케줄 상세 조회
    Schedules findOne(long scheduleNo);

    // 스케줄 전체 조회
    List<ScheduleFindAllDto> findAll(long clubNo);

    // 스케줄 등록
    void save(Schedules schedule);

    // 스케줄 삭제
    boolean delete(long scheduleNo);

    // 조회수 상승
    void upViewCount(long scheduleNo);

}
