package com.project.schedules.mapper;

import com.project.entity.Users;
import com.project.schedules.dto.*;
import com.project.entity.Schedules;
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

    List<Users> findAllScheduleUser(Long scheduleNo);

    Users findUser(String account);

    // 등록된 스케줄 정보 가져오기
    Schedules findLastSaveSchedule();

    // 스케줄 권한 설정하기
    void setUserRoleInSchedule(Long scheduleNo, Long userClubJoinNo, ScheduleAuth auth);

    // 스케줄에 대한 로그인 유저의 권한 찾기
    List<ScheduleLoginUserInfoDto> findAllUserInSchedule(String account);

    // 유저 참여시 스케줄에 포인트를 참가비만큼 증가
    void addScheduleTotalPoint(Long scheduleNo, Double point);

    // 유저 탈퇴 or 참여 거절시 스케줄에 포인트를 감소시키는 함수
    void removeScheduleTotalPoint(Long scheduleNo, Double point);

    // 유저가 스케줄에 참가시 스케줄 참가비만큼 유저 잔여포인트 감소
    void userPaymentPoint(Long scheduleNo, String account);

    // 유저의 포인트 입금/출금 기록 저장
    void saveUserPointVariance(String account, Long scheduleNo, Double point, PointHistoryType type);

    // 유저에게 포인트 반환
    void refundPoint(Long scheduleNo, String account);

    // 스케줄 삭제시 유저에게 포인트 반환
    void refundPointAsDeleteSchedule(Long scheduleNo, Double point);

    // 스케줄 삭제시 포인트를 반환해야하는 유저목록
    List<String> refundUserAccount(Long scheduleNo);

    // 해당 스케줄에 가입한 유저 수
    Integer scheduleUsers(Long scheduleNo);

    // 스케줄 유저 수 업데이트
    void UpdateScheduleUsers(int numberOfUsers, Long scheduleNo);
}
