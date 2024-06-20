package com.project.club.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UsersClubsMapper {

    // 동호회 권한을 바꾸자
    void updateMemberRole(@Param("joinNo") long joinNo,
                          @Param("role") String role);


    // 동호회 가입신청서 넣었냐?
    void joinClub(@Param("clubNo") long clubNo,
                  @Param("account") String account);


    // 신청서 취소했나? 아니냐?
    void updateApplicationStatus(@Param("joinNo") long joinNo,
                                 @Param("status") String status);
}
