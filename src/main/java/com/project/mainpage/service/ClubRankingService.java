package com.project.mainpage.service;

import com.project.mainpage.dto.response.ClubFindAllDto;
import com.project.mainpage.dto.response.ClubListDto;
import com.project.mainpage.mapper.ClubRankingMapper;
import com.project.mainpage.mapper.CountMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
public class ClubRankingService {

    private final ClubRankingMapper clubRankingMapper;
    private final CountMapper countMapper;

    // 가입자가 가장 많은 동호회
    public List<ClubListDto> member() {
        List<ClubFindAllDto> memberRank = clubRankingMapper.mostMember();

        List<ClubListDto> memberList = memberRank.stream()
                .map(ClubListDto::new)
                .collect(Collectors.toList());
        return memberList;
    }

    // 가장 최근에 만들어진 동호회
    public List<ClubListDto> recent() {
        List<ClubFindAllDto> recentRank = clubRankingMapper.recentClub();

        List<ClubListDto> recentList = recentRank.stream()
                .map(ClubListDto::new)
                .collect(Collectors.toList());
        return recentList;
    }

    // 1년 동안 스케줄이 가장 많은 동호회
    public List<ClubListDto> mostScheduled() {
        List<ClubFindAllDto> scheduleRank = clubRankingMapper.mostScheduled();

        List<ClubListDto> scheduledList = scheduleRank.stream()
                .map(ClubListDto::new)
                .collect(Collectors.toList());
        return scheduledList;
    }

    // 로그인한 유저의 가입한 동호회 목록
    public List<ClubListDto> loginUsersClub(String account) {
        List<ClubFindAllDto> usersClub = clubRankingMapper.loginUsersClub(account);

        List<ClubListDto> clubList = usersClub.stream()
                .map(ClubListDto::new)
                .collect(Collectors.toList());
        return clubList;
    }

    // 총 유저 수
    public String user() {
        Integer userCount = countMapper.countUser();
        return userCount.toString();
    }

    // 총 동호회 수
    public long club() {
        Integer clubCount = countMapper.countClubs();
        return clubCount.longValue();
    }

    // 총 스케줄 수
    public long schedule() {
        Integer scheduleCount = countMapper.countSchedules();
        return scheduleCount.longValue();
    }

}
