package com.project.schedules.service;

import com.project.entity.Schedules;
import com.project.entity.Users;
import com.project.login.dto.LoginUserInfoDto;
import com.project.schedules.dto.*;
import com.project.schedules.mapper.ScheduleMapper;
import com.project.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

import java.util.List;

import static com.project.util.LoginUtil.LOGIN;

@Service
@RequiredArgsConstructor
public class ScheduleService {

    private static final Logger log = LoggerFactory.getLogger(ScheduleService.class);
    private final ScheduleMapper scheduleMapper;

    public void addSchedule(ScheduleWriteDto dto, HttpSession session) {

        Schedules s = dto.toEntity();
        System.out.println("s = " + s);

        String loginUserAccount = LoginUtil.getLoggedInUserAccount(session);

        Boolean userInClub = isUserInClub(dto.getClubNo(), session);

        if(!userInClub) return;

        s.setAccount(loginUserAccount);
        s.setClubNo(1);
        // 스케줄 테이블에 스케줄 등록
        scheduleMapper.save(s);

        // 스케줄을 개설한 유저 등록
        Schedules newSchedules = scheduleMapper.findLastSaveSchedule();
        long scheduleNo = newSchedules.getScheduleNo();
        long loginUserInClubNo = scheduleMapper.userInClub(dto.getClubNo(), loginUserAccount);
        scheduleMapper.registerUserIntoSchedule(scheduleNo, loginUserInClubNo);

        // 스케줄 생성자 권한 업데이트
        scheduleMapper.setUserRoleInSchedule(scheduleNo, loginUserInClubNo, ScheduleAuth.ADMIN);

        // 스케줄 정원 증가
        scheduleMapper.upScheduleCount(scheduleNo);

    }

    public void deleteSchedule(Long scheduleNo) {

        Schedules targetSchedule = scheduleMapper.findOne(scheduleNo);
        // 삭제가 아니라 false를 true로 바꾸기
        scheduleMapper.delete(scheduleNo);

        System.out.println("targetSchedule = " + targetSchedule);

        Double participationPoint = targetSchedule.getParticipationPoints();

        Double totalPointInSchedule = targetSchedule.getTotalPoint();

        List<String> refundUsers = scheduleMapper.refundUserAccount(scheduleNo);

        if(refundUsers == null) return;

        if(totalPointInSchedule == (participationPoint * refundUsers.size())) {
            scheduleMapper.removeScheduleTotalPoint(scheduleNo, totalPointInSchedule);

            scheduleMapper.refundPointAsDeleteSchedule(scheduleNo, participationPoint);

            for (String refundUser : refundUsers) {
                scheduleMapper.saveUserPointVariance(refundUser, scheduleNo, participationPoint, PointHistoryType.CREDIT);
            }
        }

    }

    public Schedules detailSchedule(Long scheduleNo) {

        return scheduleMapper.findOne(scheduleNo);
    }

    public void registerUserIntoSchedule(Long scheduleNo, LoginUserInfoDto loginUserInfo, Long clubNo) {

        String account = loginUserInfo.getAccount();

        Users loginUser = scheduleMapper.findUser(account);

        Schedules schedule = scheduleMapper.findOne(scheduleNo);

        Long userInClubNo = scheduleMapper.userInClub(clubNo, account);

        // club에 가입되어있지 않다면 등록 못하게 막도록
        if(userInClubNo == null) return;

        // 이미 등록되어있다면 등록 못하게 막도록
        if(scheduleMapper.userInSchedule(userInClubNo, scheduleNo) != null) return;



        // 참가비가 0원인 경우 등록절차 바로 진행
        // 참가비가 0원이 아닐 경우 유저의 잔여포인트의 여부에 따른 등록 절차 시행
        if(schedule.getParticipationPoints() != null && schedule.getParticipationPoints() != 0) {
            if(schedule.getParticipationPoints() > loginUser.getRemainedPoint()) {
                return;
            } else {
                // 스케줄에 참가비만큼 포인트 추가
                scheduleMapper.addScheduleTotalPoint(scheduleNo, schedule.getParticipationPoints());
                // 유저의 남은 포인트를 참가비만큼 감소
                scheduleMapper.userPaymentPoint(scheduleNo, account);
                // 유저의 포인트 입금 내역 저장
                scheduleMapper.saveUserPointVariance(account, scheduleNo, schedule.getParticipationPoints(), PointHistoryType.DEBIT);
            }
        }

        // 모든 검증을 마친 후 등록되도록
        scheduleMapper.registerUserIntoSchedule(scheduleNo, userInClubNo);


        // 추후 일정온도에 미치지 못한다면 신청 못하도록 막기


    }

    public void findLoginUser(String account, HttpSession session) {
        Users user = scheduleMapper.findUser(account);
        LoginUserInfoDto loginUserInfoDto = new LoginUserInfoDto();

        session.setAttribute(LOGIN, loginUserInfoDto);
    }

    public List<ScheduleFindAllDto> findAllSchedule(long clubNo) {

        return scheduleMapper.findAll(clubNo);
    }

    public Schedules findOneSchedule(long scheduleNo) {

        return scheduleMapper.findOne(scheduleNo);
    }

    public Boolean isUserInClub(long clubNo, HttpSession session) {

        String loginUserAccount = LoginUtil.getLoggedInUserAccount(session);
        System.out.println("로그인 유저 아이디: " + loginUserAccount);

        if(loginUserAccount == null) return false;


        Long userInClubNo = scheduleMapper.userInClub(clubNo, loginUserAccount);

        if(userInClubNo == null) {
            return false;
        } else return !scheduleMapper.userInClubNow(clubNo, loginUserAccount);
    }

    public boolean isUserHasAuth(Long scheduleNo, HttpSession session) {

        // 유저가 스케줄 작성자인지
        String scheduleWriter = scheduleMapper.findOne(scheduleNo).getAccount();

        String loginUserAccount = LoginUtil.getLoggedInUserAccount(session);

        // 로그인을 안한 유저라면 삭제 불가
        if(loginUserAccount == null) return false;

        // 작성자와 로그인한 유저의 account가 다르면 삭제 불가
        return loginUserAccount.equals(scheduleWriter);

    }

    public ScheduleLoginUserInfoDto findLoginUserInfoInSchedule(Schedules schedules, HttpSession session) {
        String loginUserAccount = LoginUtil.getLoggedInUserAccount(session);
        Long userClubJoinNo = scheduleMapper.userInClub(schedules.getClubNo(), loginUserAccount);

        ScheduleLoginUserInfoDto scheduleLoginUserInfoDto = scheduleMapper.userInSchedule(userClubJoinNo, schedules.getScheduleNo());

        return scheduleLoginUserInfoDto;
    }

    public List<Users> findAllApplicationUsers(Long scheduleNo) {

       return scheduleMapper.findAllApplicationUser(scheduleNo);
    }

    public void applicationProcessing(ApplicationUserResponseDto dto) {

        Long userInClubNo = scheduleMapper.userInClub(dto.getClubNo(), dto.getAccount());

        if(dto.getAccept()) {
            scheduleMapper.setUserRoleInSchedule(dto.getScheduleNo(), userInClubNo, ScheduleAuth.MEMBER);

            Long scheduleNo = dto.getScheduleNo();
            // 등록 된 후 스케줄 참여 인원 수 조회 후 업데이트
            Integer users = scheduleMapper.scheduleUsers(scheduleNo);

            scheduleMapper.UpdateScheduleUsers(users, scheduleNo);

        } else {
            scheduleMapper.setUserRoleInSchedule(dto.getScheduleNo(), userInClubNo, ScheduleAuth.DENIED);
            // 유저에게 포인트 반환
            scheduleMapper.refundPoint(dto.getScheduleNo(), dto.getAccount());

            Double participationPoint = scheduleMapper.findOne(dto.getScheduleNo()).getParticipationPoints();
            // 스케줄의 잔여포인트를 감소시킴
            scheduleMapper.removeScheduleTotalPoint(dto.getScheduleNo(), participationPoint);

            // 유저에게 반환한 포인트 기록 저장
            scheduleMapper.saveUserPointVariance(dto.getAccount(), dto.getScheduleNo(), participationPoint, PointHistoryType.CREDIT);
        }

    }

    public List<ScheduleLoginUserInfoDto> findAllUserAuthInSchedule(String loginUserAccount) {

        return scheduleMapper.findAllUserInSchedule(loginUserAccount);

    }
}
