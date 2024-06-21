package com.project.mainpage.service;

import com.project.mainpage.common.Search;
import com.project.mainpage.dto.response.ClubListDto;
import com.project.mainpage.dto.response.NoticeFindAllDto;
import com.project.mainpage.dto.response.NoticeListDto;
import com.project.mainpage.entity.ClubRanking;
import com.project.mainpage.mapper.ClubRankingMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
public class ClubRankingService {

    private final ClubRankingMapper mapper;

    // 가입자가 가장 많은 동호회
    public List<ClubListDto> member(ClubRanking club) {

        List<ClubRanking> list = mapper.mostMember(club);
//        System.out.println("list = " + list);

        List<ClubListDto> memberList = list.stream()
                .map(b -> new ClubListDto(b))
                .collect(Collectors.toList());

        return memberList;
    }

    // 가장 최근에 만들어진 동호회
    public List<ClubListDto> recent(ClubRanking club) {

        List<ClubRanking> list = mapper.recentClub(club);
//        System.out.println("list = " + list);

        List<ClubListDto> recentList = list.stream()
                .map(b -> new ClubListDto(b))
                .collect(Collectors.toList());

        return recentList;
    }

    // 1년 동안 스케줄이 가장 많은 동호회
}
