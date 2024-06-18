package com.project.homepage.mapper;

import com.project.homepage.entity.NoticeBoard;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeMapper {

    // 공지사항 등록
    boolean save(NoticeBoard noticeBoard);

    // 공지사항 수정
    boolean modify(NoticeBoard noticeBoard);

    // 공지사항 삭제
    boolean delete(long noticeNo);
}
