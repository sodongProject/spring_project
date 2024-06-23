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
    public List<ClubListDto> member() {
        List<ClubRanking> list = mapper.mostMember();
        List<ClubListDto> memberList = list.stream()
                .map(ClubListDto::new)
                .collect(Collectors.toList());
        return memberList;
    }

    // 가장 최근에 만들어진 동호회
    public List<ClubListDto> recent() {
        List<ClubRanking> list = mapper.recentClub();
        List<ClubListDto> recentList = list.stream()
                .map(ClubListDto::new)
                .collect(Collectors.toList());
        return recentList;
    }

    // 1년 동안 스케줄이 가장 많은 동호회
    public List<ClubListDto> mostScheduled() {
        List<ClubRanking> list = mapper.mostScheduled();
        List<ClubListDto> scheduledList = list.stream()
                .map(ClubListDto::new)
                .collect(Collectors.toList());
        return scheduledList;
    }

}
