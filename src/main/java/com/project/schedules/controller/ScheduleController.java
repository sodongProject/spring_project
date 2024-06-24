package com.project.schedules.controller;

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

    @GetMapping("/write")
    public String write() {

        return "/schedules/write";
    }

}
