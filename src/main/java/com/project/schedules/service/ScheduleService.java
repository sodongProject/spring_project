package com.project.schedules.service;

import com.project.entity.Schedules;
import com.project.entity.Users;
import com.project.schedules.dto.ScheduleWriteDto;
import com.project.schedules.mapper.ScheduleMapper;
import com.project.util.LoginUserInfoDto;
import com.project.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

import static com.project.util.LoginUtil.LOGIN;

@Service
@RequiredArgsConstructor
public class ScheduleService {

    private final ScheduleMapper scheduleMapper;

    public void addSchedule(ScheduleWriteDto dto, HttpSession session) {

        Schedules s = dto.toEntity();
        String loginUserAccount = LoginUtil.getLoggedInUser(session).getAccount();
        s.setAccount(loginUserAccount);
        s.setClubNo(1);
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

    public void findLoginUser(String account, HttpSession session) {
        Users user = scheduleMapper.findUser(account);
        LoginUserInfoDto loginUserInfoDto = new LoginUserInfoDto(user);

        session.setAttribute(LOGIN, loginUserInfoDto);
    }
}
