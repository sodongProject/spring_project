package com.project.mainpage.service;

import com.project.mainpage.dto.response.ClubFindAllDto;
import com.project.mainpage.dto.response.ClubListDto;
import com.project.mainpage.mapper.ClubRankingMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.stream.Collectors;

import static com.project.util.LoginUtil.LOGIN;

@RequiredArgsConstructor
@Service
public class ClubRankingService {

    private final ClubRankingMapper mapper;

    // 가입자가 가장 많은 동호회
    public List<ClubListDto> member() {
        List<ClubFindAllDto> memberRank = mapper.mostMember();
//        System.out.println("memberRank = " + memberRank);

        List<ClubListDto> memberList = memberRank.stream()
                .map(ClubListDto::new)
                .collect(Collectors.toList());
        return memberList;
    }

    // 가장 최근에 만들어진 동호회
    public List<ClubListDto> recent() {
        List<ClubFindAllDto> recentRank = mapper.recentClub();
//        System.out.println("recentRank = " + recentRank);

        List<ClubListDto> recentList = recentRank.stream()
                .map(ClubListDto::new)
                .collect(Collectors.toList());
        return recentList;
    }

    // 1년 동안 스케줄이 가장 많은 동호회
    public List<ClubListDto> mostScheduled() {
        List<ClubFindAllDto> scheduleRank = mapper.mostScheduled();
//        System.out.println("scheduleRank = " + scheduleRank);

        List<ClubListDto> scheduledList = scheduleRank.stream()
                .map(ClubListDto::new)
                .collect(Collectors.toList());
        return scheduledList;
    }

    // 로그인한 유저의 가입한 동호회 목록
    public List<ClubListDto> loginUsersClub(String account) {
        List<ClubFindAllDto> usersClub = mapper.loginUsersClub(account);
//        System.out.println("usersClub = " + usersClub);

        List<ClubListDto> clubList = usersClub.stream()
                .map(ClubListDto::new)
                .collect(Collectors.toList());
        return clubList;
    }

}
