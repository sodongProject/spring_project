package com.project.club.mapper;

import com.project.club.entity.ClubNoticeBoard;
import com.project.login.entity.Users;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ClubNoticeBoardMapper {

    // 공지사항 전체 조회
    List<ClubNoticeBoard> findAll(long clubNo);


    List<ClubNoticeBoard> findAllLimit(long clubNo);

    // 공지사항 세부 조회
    ClubNoticeBoard findOne(long clubNoticeNo);

    // 공지사항 등록
    boolean save(ClubNoticeBoard ClubNoticeBoard);

    // 공지사항 조회수
    void upViewCount(long clubNoticeNo);

    // 공지사항 삭제
    boolean delete(long noticeBoardId);

    String findUserRole(@Param("clubNo")long clubNo,
                        @Param("account")String account);

    // 클럽에 가입한 사용자의 모둔걸 가져와
    Users findUsersAll(@Param("account")String account);


}
