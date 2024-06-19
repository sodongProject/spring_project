package com.project.schedules.mapper;

import com.project.entity.Users;
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

    // 유저 - 클럽 가입 내역 추출
    long userInClub(long clubNo, String account);

    // 스케줄 참여 유저 등록
    void registerUserIntoSchedule(long scheduleNo, long userClubJoinNo);

    Users findUser(String account);
}
