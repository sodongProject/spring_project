package com.project.schedules.service;

import com.project.entity.Schedules;
import com.project.entity.Users;
import com.project.login.dto.LoginUserInfoDto;
import com.project.schedules.dto.ScheduleFindAllDto;
import com.project.schedules.dto.ScheduleWriteDto;
import com.project.schedules.mapper.ScheduleMapper;
import com.project.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

import java.util.List;

import static com.project.util.LoginUtil.LOGIN;

@Service
@RequiredArgsConstructor
public class ScheduleService {

    private final ScheduleMapper scheduleMapper;

    public void addSchedule(ScheduleWriteDto dto, HttpSession session) {

        Schedules s = dto.toEntity();
        System.out.println("s = " + s);
        String loginUserAccount = LoginUtil.getLoggedInUser(session).getAccount();
        s.setAccount(loginUserAccount);
        s.setClubNo(1);
        System.out.println("s = " + s);
        // 스케줄 테이블에 스케줄 등록
        scheduleMapper.save(s);

        // 스케줄을 개설한 유저 등록
        Schedules newSchedules = scheduleMapper.findLastSaveSchedule();
        long scheduleNo = newSchedules.getScheduleNo();
        long loginUserInClubNo = scheduleMapper.userInClub(1, loginUserAccount);
        scheduleMapper.registerUserIntoSchedule(scheduleNo, loginUserInClubNo);

        // 스케줄 생성자 권한 업데이트
        scheduleMapper.setUserRoleInSchedule(scheduleNo, loginUserInClubNo);

        // 스케줄 정원 증가
        scheduleMapper.upScheduleCount(scheduleNo);

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
}
