package com.project.mainpage.mapper;

import com.project.mainpage.common.Search;
import com.project.mainpage.dto.response.NoticeFindAllDto;
import com.project.mainpage.entity.MainNoticeBoard;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MainNoticeMapper {

    // 공지사항 등록
    boolean save(MainNoticeBoard noticeBoard);

    // 공지사항 수정
    boolean modify(MainNoticeBoard noticeBoard);

    // 공지사항 삭제
    boolean delete(long noticeNo);

    // 공지사항 목록 조회
    List<NoticeFindAllDto> findAll(Search page);

    // 공지사항 상세 조회
    MainNoticeBoard findOne(int boardNo);
}
