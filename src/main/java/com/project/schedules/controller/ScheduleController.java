package com.project.schedules.controller;

import com.project.entity.Schedules;
import com.project.schedules.dto.ScheduleWriteDto;
import com.project.schedules.service.ScheduleService;
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

@Controller
@RequestMapping("/schedules")
@RequiredArgsConstructor
@Slf4j
public class ScheduleController {

    private final ScheduleService scheduleService;

    @GetMapping("/list")
    public String Write(Model model, HttpSession session) {
//        scheduleService.findLoginUser("qwdk0406", session);
        DateTimeFormatter pattern = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        String now = LocalDateTime.now().format(pattern);

        System.out.println("now = " + now);

        model.addAttribute("now", now);

        return "/schedules/list";
    }


    @GetMapping("/detail")
    public String Detail(long scheduleNo, Model model, HttpSession session) {

        // ScheduleNo를 통하여 Schedule의 정보를 가져온다.
        Schedules schedules = scheduleService.detailSchedule(scheduleNo);

        System.out.println("schedules = " + schedules);

        Boolean isUserInClub = scheduleService.isUserInClub(schedules.getClubNo(), session);

        System.out.println("isUserInClub = " + isUserInClub);

        if(!isUserInClub) return "redirect:/schedules/list";

        model.addAttribute("schedule", schedules);

        System.out.println("schedules = " + schedules);
        return "/schedules/detail";
    }


}
