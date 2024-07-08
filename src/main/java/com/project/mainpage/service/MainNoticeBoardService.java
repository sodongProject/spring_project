package com.project.mainpage.service;

import com.project.mainpage.common.Search;
import com.project.mainpage.dto.request.NoticeWritePostDto;
import com.project.mainpage.dto.response.NoticeDetailDto;
import com.project.mainpage.dto.response.NoticeFindAllDto;
import com.project.mainpage.dto.response.NoticeListDto;
import com.project.mainpage.entity.MainNoticeBoard;
import com.project.mainpage.mapper.MainNoticeMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
@Slf4j
public class MainNoticeBoardService {

    private final MainNoticeMapper mapper;

    // 목록 조회 요청 중간처리
    public List<NoticeListDto> findList(Search page) {

        List<NoticeFindAllDto> list = mapper.findAll(page);
        System.out.println("list = " + list);

        List<NoticeListDto> dtoList = list.stream()
                .map(b -> new NoticeListDto(b))
                .collect(Collectors.toList());

        return dtoList;
    }

    // 등록 요청 중간처리
    public boolean insert(NoticeWritePostDto dto) {
        MainNoticeBoard board = dto.toEntity();
        log.info("잘 가져오고 있찌? {}", board.getMainNoticeTitle());
        return mapper.save(board);

    }

    // 삭제 요청 중간처리
    public boolean remove(long mainNoticeNo) {
        return mapper.delete(mainNoticeNo);
    }

    // 상세 조회 요청 중간처리
    public NoticeDetailDto detail(long mainNoticeNo) {
        MainNoticeBoard detail = mapper.findOne(mainNoticeNo);
        return new NoticeDetailDto(detail);
    }

    public void increaseViewCount(int mainNoticeNo) {
        mapper.viewCount(mainNoticeNo);
    }

    private boolean shouldIncreaseViewCount(int bno,
                                            HttpServletRequest request,
                                            HttpServletResponse response) {
        // 쿠키 검사
        String cookieName = "view_" + bno;
        Cookie viewCookie = WebUtils.getCookie(request, cookieName);

        // 이 게시물에 대한 쿠키가 존재 -> 아까 조회한 게시물
        if (viewCookie != null) {
            return false;
        }

        // 쿠키 생성
        makeViewCookie(cookieName, response);
        return true;
    }

    // 조회수 쿠키를 생성하고 클라이언트에 전송하는 메서드
    private void makeViewCookie(String cookieName, HttpServletResponse response) {
        Cookie newCookie = new Cookie(cookieName, LocalDateTime.now().toString());
        newCookie.setPath("/"); // 쿠키 사용 범위 결정
        newCookie.setMaxAge(60 * 60);

        response.addCookie(newCookie);
    }

    public int getCount(Search search) {
        return mapper.count(search);
    }

}
