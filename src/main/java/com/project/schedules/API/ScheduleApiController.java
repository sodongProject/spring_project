package com.project.schedules.API;


import com.project.entity.Users;
import com.project.schedules.common.Page;
import com.project.schedules.common.PageMaker;
import com.project.schedules.dto.*;
import com.project.schedules.service.ScheduleService;
import com.project.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;


@RestController
@RequestMapping("/schedules")
@RequiredArgsConstructor
@Slf4j
public class ScheduleApiController {

    private final ScheduleService scheduleService;

    @PostMapping("/list")
    public ResponseEntity<?> addSchedules(
            @Validated @RequestBody ScheduleWriteDto dto
            , BindingResult result // 입력값 검증 결과 데이터를 갖고 있는 객체
            , HttpSession session
    ) {
        System.out.println("dto = " + dto);
        scheduleService.addSchedule(dto, session);

        return ResponseEntity
                .ok()
                .body(scheduleService.findAllSchedule(dto.getClubNo()));
    }

    @GetMapping("/list/{clubNo}/page/{pageNo}")
    public ResponseEntity<?> ScheduleList(@PathVariable long clubNo, @PathVariable int pageNo, HttpSession session) {
        String loginUserAccount = LoginUtil.getLoggedInUserAccount(session);
        List<ScheduleFindAllDto> scheduleList = scheduleService.findAllSchedule(clubNo);
        List<ScheduleLoginUserInfoDto> scheduleLoginUserInfoDtoList = scheduleService.findAllUserAuthInSchedule(loginUserAccount);
        PageMaker pageMaker = new PageMaker(new Page(pageNo, 3), scheduleList.size());


        ScheduleListDto scheduleListAndPage = new ScheduleListDto(scheduleList, pageMaker, scheduleLoginUserInfoDtoList);
        System.out.println("scheduleList = " + scheduleList);

        System.out.println("scheduleListAndPage = " + scheduleListAndPage);

        return ResponseEntity
                .ok()
                .body(scheduleListAndPage);
    }

    @PostMapping("/delete")
    public ResponseEntity<?> deleteSchedules(@Validated @RequestBody scheduleDeleteDto dto, HttpSession session) {
        // 권한 = 동호회의 권한이 admin 인지 or 스케줄 작성자인지
        boolean isUserHasAuthToDeleteSchedule = scheduleService.isUserHasAuth(dto.getScheduleNo(), session);

        if(!isUserHasAuthToDeleteSchedule) {
            return ResponseEntity
                    .ok()
                    .body(dto);
        }

        scheduleService.deleteSchedule(dto.getScheduleNo());

        return ResponseEntity
                .ok()
                .body(dto);
    }

    @PostMapping("/register")
    public ResponseEntity<?> registerUserInSchedule(@Validated @RequestBody ScheduleRegisterDto dto, HttpSession session) {
        String loginUserAccount = LoginUtil.getLoggedInUserAccount(session);

        if(loginUserAccount == null)
            return ResponseEntity
                .ok()
                .body(dto);

        scheduleService.registerUserIntoSchedule(dto.getScheduleNo(), loginUserAccount, dto.getClubNo());

        System.out.println("등록성공!!!!!!!!!!!!!!!!!!!!!!");

        return ResponseEntity
                .ok()
                .body(dto);
    }

    @GetMapping("/detail/{scheduleNo}")
    public ResponseEntity<?> ApplicationUsers(@PathVariable Long scheduleNo, HttpSession session) {



        List<Users> allApplicationUsers = scheduleService.findAllApplicationUsers(scheduleNo);


        return ResponseEntity
                .ok()
                .body(allApplicationUsers);
    }

    @PostMapping("/detail")
    public ResponseEntity<?> applicationProcessing(@Validated @RequestBody ApplicationUserResponseDto dto) {

        System.out.println("dto = " + dto);

        scheduleService.applicationProcessing(dto);

        return ResponseEntity
                .ok()
                .body(dto);
    }

}
