package com.project.schedules.controller;

import com.project.entity.Schedules;
import com.project.schedules.dto.ScheduleFindAllDto;
import com.project.schedules.dto.ScheduleLoginUserInfoDto;
import com.project.schedules.dto.ScheduleWriteDto;
import com.project.schedules.service.ScheduleService;
import com.project.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
@RequestMapping("/schedules")
@RequiredArgsConstructor
@Slf4j
public class ScheduleController {

    private final ScheduleService scheduleService;

    @GetMapping("/list")
    public String Write(Long clubNo, Model model, HttpSession session) {
//        scheduleService.findLoginUser("qwdk0406", session);
        DateTimeFormatter pattern = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        String now = LocalDateTime.now().format(pattern);

        List<ScheduleFindAllDto> allSchedule = scheduleService.findAllSchedule(clubNo);

        System.out.println("now = " + now);

        model.addAttribute("scheduleList", allSchedule);
        model.addAttribute("now", now);

        return "/schedules/list";
    }


    @GetMapping("/detail")
    public String Detail(Long scheduleNo, Model model, HttpSession session) {

        // ScheduleNo를 통하여 Schedule의 정보를 가져온다.
        Schedules schedules = scheduleService.detailSchedule(scheduleNo);

        Boolean isUserInClub = scheduleService.isUserInClub(schedules.getClubNo(), session);

        ScheduleLoginUserInfoDto scheduleLoginUserInfoDto = scheduleService.findLoginUserInfoInSchedule(schedules, session);

        if(!isUserInClub) return "redirect:/schedules/list";

        System.out.println("scheduleLoginUserInfoDto = " + scheduleLoginUserInfoDto);

        model.addAttribute("schedule", schedules);
        model.addAttribute("scheduleLoginUserInfo", scheduleLoginUserInfoDto);
        System.out.println("schedules = " + schedules);
        return "/schedules/detail";
    }


}
