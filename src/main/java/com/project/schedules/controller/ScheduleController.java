package com.project.schedules.controller;

import com.project.entity.Schedules;
import com.project.schedules.dto.ScheduleWriteDto;
import com.project.schedules.service.ScheduleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
@RequestMapping("/schedules")
@RequiredArgsConstructor
@Slf4j
public class ScheduleController {

    private final ScheduleService scheduleService;

    @GetMapping("/write")
    public String Write(Model model) {
        DateTimeFormatter pattern = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        String now = LocalDateTime.now().format(pattern);

        System.out.println("now = " + now);

        model.addAttribute("now", now);

        return "/schedules/write";
    }

    @PostMapping("/write")
    public String write(ScheduleWriteDto dto) {

        System.out.println("dto = " + dto);
        scheduleService.addSchedule(dto);

        return "/schedules/write";

    }

    @GetMapping("/delete")
    public String Delete(Long scheduleNo) {

        scheduleService.deleteSchedule(scheduleNo);

        return "/index";
    }

    @GetMapping("/detail")
    public String Detail(Long scheduleNo, Model model) {

        // ScheduleNo를 통하여 Schedule의 정보를 가져온다.
        Schedules schedules = scheduleService.detailSchedule(scheduleNo);

        model.addAttribute("schedule", schedules);

        System.out.println("schedules = " + schedules);
        return "/schedules/detail";
    }

    @GetMapping("/register")
    public String Register(long scheduleNo, String account, long clubNo) {

        scheduleService.registerUserIntoSchedule(scheduleNo, account, clubNo);
        return "/schedules/detail";
    }

}
