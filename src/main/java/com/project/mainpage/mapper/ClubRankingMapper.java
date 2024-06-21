package com.project.mainpage.mapper;

import com.project.mainpage.entity.ClubRanking;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ClubRankingMapper {

    // 가장 가입자가 많은 동호회
    List<ClubRanking> mostMember(ClubRanking club);

    // 가장 최근에 만들어진 동호회
    List<ClubRanking> recentClub(ClubRanking club);

    // 1년 동안 스케줄이 가장 많은 동호회
}
