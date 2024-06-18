package com.project.club.controller;

import com.project.club.service.ClubService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/club")
@RequiredArgsConstructor
@Slf4j
public class ClubController {

    private final ClubService clubService;

}
