package com.project.schedules.API;


import com.project.schedules.dto.ScheduleFindAllDto;
import com.project.schedules.dto.ScheduleWriteDto;
import com.project.schedules.service.ScheduleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;


@RestController
@RequestMapping("/schedules")
@RequiredArgsConstructor
@Slf4j
public class ScheduleApiController {

    private final ScheduleService scheduleService;

    @PostMapping
    public ResponseEntity<?> addSchedules(
            @Validated @RequestBody ScheduleWriteDto dto
            , BindingResult result // 입력값 검증 결과 데이터를 갖고 있는 객체
            , HttpSession session
    ) {
        scheduleService.addSchedule(dto, session);
    }

    @GetMapping("/list/{clubNo}")
    public ResponseEntity<?> ScheduleList(@PathVariable long clubNo, HttpSession session) {


    }


}

/*

@RestController
@RequestMapping("/api/v1/replies")
@RequiredArgsConstructor
@Slf4j
public class ReplyApiController {

    private final ReplyService replyService;

    // 댓글 목록 조회 요청
    // URL : /api/v1/replies/원본글번호/page/페이지번호   -  GET -> 목록조회
    // @PathVariable : URL에 붙어있는 변수값을 읽는 아노테이션
    @GetMapping("/{bno}/page/{pageNo}")
    public ResponseEntity<?> list(
            @PathVariable long bno
            , @PathVariable int pageNo
            , HttpSession session
    ) {

        if (bno == 0) {
            String message = "글 번호는 0번이 될 수 없습니다.";
            log.warn(message);
            return ResponseEntity
                    .badRequest()
                    .body(message);
        }

        log.info("/api/v1/replies/{} : GET", bno);

        ReplyListDto replies = replyService.getReplies(bno, new Page(pageNo, 10));
        replies.setLoginUser(LoginUtil.getLoggedInUser(session));

        return ResponseEntity
                .ok()
                .body(replies);
    }

    // 댓글 생성 요청
    // @RequestBody : 클라이언트가 전송한 데이터를 JSON으로 받아서 파싱
    @PostMapping
    public ResponseEntity<?> posts(
            @Validated @RequestBody ReplyPostDto dto
            , BindingResult result // 입력값 검증 결과 데이터를 갖고 있는 객체
            , HttpSession session
    ) {
        log.info("/api/v1/replies : POST");
        log.debug("parameter: {}", dto);

        if (result.hasErrors()) {
            Map<String, String> errors = makeValidationMessageMap(result);

            return ResponseEntity
                    .badRequest()
                    .body(errors);
        }

        boolean flag = replyService.register(dto, session);

        if (!flag) return ResponseEntity
                .internalServerError()
                .body("댓글 등록 실패!");

        return ResponseEntity
                .ok()
                .body(replyService.getReplies(dto.getBno(), new Page(1, 10)));
    }

    private Map<String, String> makeValidationMessageMap(BindingResult result) {

        Map<String, String> errors = new HashMap<>();

        // 에러정보가 모여있는 리스트
        List<FieldError> fieldErrors = result.getFieldErrors();

        for (FieldError error : fieldErrors) {
            errors.put(error.getField(), error.getDefaultMessage());
        }

        return errors;
    }

    // 삭제 처리 요청
    @DeleteMapping("/{rno}")
    public ResponseEntity<?> delete(@PathVariable long rno) {

        ReplyListDto dtoList = replyService.remove(rno);

        return ResponseEntity
                .ok()
                .body(dtoList);
    }

    // 댓글 수정 요청
//    @PutMapping   // 전체수정
//    @PatchMapping // 일부수정

    /*
        let obj = {
            age : 3
        }

        PUT  -   obj = { age: 10 };
        PATCH -  obj.age = 10;
     */
/*
@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH})
public ResponseEntity<?> modify(
        @Validated @RequestBody ReplyModifyDto dto
        , BindingResult result
) {

    log.info("/api/v1/replies : PUT, PATCH");
    log.debug("parameter: {}", dto);

    if (result.hasErrors()) {
        Map<String, String> errors = makeValidationMessageMap(result);

        return ResponseEntity
                .badRequest()
                .body(errors);
    }

    ReplyListDto replyListDto = replyService.modify(dto);

    return ResponseEntity.ok().body(replyListDto);

}

}


        */