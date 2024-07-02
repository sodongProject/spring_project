package com.project.club.mapper;

import com.project.club.entity.ClubNoticeBoard;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ClubNoticeBoardMapper {

    // 공지사항 전체 조회
    List<ClubNoticeBoard> findAll(long clubNo);

    // 공지사항 세부 조회
    ClubNoticeBoard findOne(long clubNoticeNo);

    // 공지사항 등록
    boolean save(ClubNoticeBoard ClubNoticeBoard);

    // 공지사항 조회수
    void upViewCount(long clubNoticeNo);

    // 공지사항 삭제
    boolean delete(long noticeBoardId);



}
