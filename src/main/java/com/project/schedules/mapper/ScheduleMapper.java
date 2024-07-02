package com.project.schedules.mapper;

import com.project.entity.Users;
import com.project.schedules.dto.ApplicationUserResponseDto;
import com.project.schedules.dto.ScheduleAuth;
import com.project.schedules.dto.ScheduleFindAllDto;
import com.project.entity.Schedules;
import com.project.schedules.dto.ScheduleLoginUserInfoDto;
import org.apache.catalina.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ScheduleMapper {

    // 스케줄 상세 조회
    Schedules findOne(Long scheduleNo);

    // 스케줄 전체 조회
    List<ScheduleFindAllDto> findAll(Long clubNo);

    // 스케줄 등록
    void save(Schedules schedule);

    // 스케줄 삭제
    void delete(Long scheduleNo);

    // 조회수 상승
    void upViewCount(Long scheduleNo);

    // 스케줄 가입자 증가
    void upScheduleCount(Long scheduleNo);

    // 유저 - 클럽 가입 내역 추출
    Long userInClub(Long clubNo, String account);

    // 유저가 아직 클럽에 가입중인지 확인
    Boolean userInClubNow(Long clubNo, String account);

    // 스케줄 참여 유저 등록
    void registerUserIntoSchedule(Long scheduleNo, Long userClubJoinNo);

    // 스케줄에 참여한 유저의 권한 찾기
    ScheduleLoginUserInfoDto userInSchedule(Long userClubJoinNo, Long scheduleNo);

    // 스케줄에 참여 신청을 한 유저 정보 찾기
    List<Users> findAllApplicationUser(Long scheduleNo);

    Users findUser(String account);

    // 등록된 스케줄 정보 가져오기
    Schedules findLastSaveSchedule();

    // 스케줄 권한 설정하기
    void setUserRoleInSchedule(Long scheduleNo, Long userClubJoinNo, ScheduleAuth auth);

    // 스케줄에 대한 로그인 유저의 권한 찾기
    List<ScheduleLoginUserInfoDto> findAllUserInSchedule(String account);
}
