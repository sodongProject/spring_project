package com.project.schedules.service;

import com.project.entity.Schedules;
import com.project.entity.Users;
import com.project.login.dto.LoginUserInfoDto;
import com.project.schedules.dto.ScheduleFindAllDto;
import com.project.schedules.dto.ScheduleLoginUserInfoDto;
import com.project.schedules.dto.ScheduleWriteDto;
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
        System.out.println("s = " + s);
        // 스케줄 테이블에 스케줄 등록
        scheduleMapper.save(s);

        // 스케줄을 개설한 유저 등록
        Schedules newSchedules = scheduleMapper.findLastSaveSchedule();
        long scheduleNo = newSchedules.getScheduleNo();
        long loginUserInClubNo = scheduleMapper.userInClub(dto.getClubNo(), loginUserAccount);
        scheduleMapper.registerUserIntoSchedule(scheduleNo, loginUserInClubNo);

        // 스케줄 생성자 권한 업데이트
        scheduleMapper.setUserRoleInSchedule(scheduleNo, loginUserInClubNo);

        // 스케줄 정원 증가
        scheduleMapper.upScheduleCount(scheduleNo);

    }

    public void deleteSchedule(Long scheduleNo) {
        // 삭제가 아니라 false를 true로 바꾸기
        scheduleMapper.delete(scheduleNo);
    }

    public Schedules detailSchedule(Long scheduleNo) {

        return scheduleMapper.findOne(scheduleNo);
    }

    public void registerUserIntoSchedule(Long scheduleNo, String account, Long clubNo) {

        Long userInClubNo = scheduleMapper.userInClub(clubNo, account);

        // club에 가입되어있지 않다면 등록 못하게 막도록
        if(userInClubNo == null) return;

        // 이미 등록되어있다면 등록 못하게 막도록
        if(scheduleMapper.userInSchedule(userInClubNo, scheduleNo).getUserScheduleJoinNo() != null) return;

        // 추후 일정온도에 미치지 못한다면 신청 못하도록 막기

        scheduleMapper.registerUserIntoSchedule(scheduleNo, userInClubNo);
    }

    public void findLoginUser(String account, HttpSession session) {
        Users user = scheduleMapper.findUser(account);
        LoginUserInfoDto loginUserInfoDto = new LoginUserInfoDto();

        session.setAttribute(LOGIN, loginUserInfoDto);
    }

    public List<ScheduleFindAllDto> findAllSchedule(long clubNo) {

        return scheduleMapper.findAll(clubNo);
    }

    public void findOneSchedule(long scheduleNo) {

        scheduleMapper.findOne(scheduleNo);
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
}
