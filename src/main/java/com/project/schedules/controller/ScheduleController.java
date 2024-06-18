package com.project.schedules.controller;

import com.project.schedules.dto.ScheduleWriteDto;
import com.project.schedules.service.ScheduleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/schedules")
@RequiredArgsConstructor
@Slf4j
public class ScheduleController {

    private final ScheduleService scheduleService;

    @GetMapping("/write")
    public String Write() {

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

}
