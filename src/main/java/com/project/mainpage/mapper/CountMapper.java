package com.project.mainpage.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CountMapper {

    // 총 회원 수
    Integer countUser();

    // 총 동호회 수
    Integer countClubs();

    // 총 스케줄 수
    Integer countSchedules();
}
