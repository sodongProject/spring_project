package com.project.mainpage.mapper;

import com.project.mainpage.dto.response.ClubFindAllDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ClubRankingMapper {

    // 가장 가입자가 많은 동호회
    List<ClubFindAllDto> mostMember();

    // 가장 최근에 만들어진 동호회
    List<ClubFindAllDto> recentClub();

    // 1년 동안 스케줄이 가장 많은 동호회
    List<ClubFindAllDto> mostScheduled();

    // 로그인한 유저의 가입한 동호회 목록
    List<ClubFindAllDto> loginUsersClub(String account);
}
