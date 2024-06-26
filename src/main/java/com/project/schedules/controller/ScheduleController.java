package com.project.schedules.controller;

import com.project.entity.Schedules;
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

@Controller
@RequestMapping("/schedules")
@RequiredArgsConstructor
@Slf4j
public class ScheduleController {

    private final ScheduleService scheduleService;

    @GetMapping("/list")
    public String Write(Model model, HttpSession session) {
        scheduleService.findLoginUser("qwdk0406", session);
        DateTimeFormatter pattern = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        String now = LocalDateTime.now().format(pattern);

        System.out.println("now = " + now);

        model.addAttribute("now", now);

        return "/schedules/list";
    }

//    @PostMapping("/write")
//    public String write(ScheduleWriteDto dto, HttpSession session) {
//
//
//        System.out.println("dto = " + dto);
//        System.out.println("dto.getScheduleAt() = " + dto.getScheduleAt());
//        scheduleService.addSchedule(dto, session);
//
//
//        return "/schedules/list";
//
//    }

//    @PostMapping
//    public ResponseEntity<?> posts(
//            @Validated @RequestBody ScheduleWriteDto dto,
//            HttpSession session
//    ) {
//        scheduleService.addSchedule(dto, session);
//    }


    @GetMapping("/delete")
    public String Delete(Long scheduleNo) {

        scheduleService.deleteSchedule(scheduleNo);

        return "/index";
    }

    @GetMapping("/detail")
    public String Detail(long scheduleNo, Model model) {

        // ScheduleNo를 통하여 Schedule의 정보를 가져온다.
        Schedules schedules = scheduleService.detailSchedule(scheduleNo);

        model.addAttribute("schedule", schedules);

        System.out.println("schedules = " + schedules);
        return "/schedules/detail";
    }

    @GetMapping("/register")
    public String Register(long scheduleNo, long clubNo, HttpSession session) {
        String account = LoginUtil.getLoggedInUser(session).getAccount();

        scheduleService.registerUserIntoSchedule(scheduleNo, account, clubNo);

        return "/schedules/list";
    }

}
