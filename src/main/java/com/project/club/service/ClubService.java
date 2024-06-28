package com.project.club.service;

import com.project.club.common.Search;
import com.project.club.dto.*;
import com.project.club.entity.Club;
import com.project.club.mapper.ClubMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class ClubService {

    private final ClubMapper clubMapper;

    public List<ClubListResponseDto> findList(Search search) {
        List<ClubFindAllDto> clubList = clubMapper.findAll(search);
        return clubList
                .stream()
                .map(ClubListResponseDto::new)
                .collect(Collectors.toList());
    }

    public int getCount(Search search) {
        return (int) clubMapper.count(search);
    }

    // 등록 요청 처리
    public void insert(ClubWriteRequestDto dto, String profilePath) {
        Club club = dto.toEntity();
        club.setClubProfile(profilePath);
        clubMapper.save(club);

        // 동호회 가입정보 가져오기
        Club lastSaveClubs = clubMapper.findLastSaveClubs();

        // 가져온 정보를 넣어주기
        clubMapper.saveUsers(lastSaveClubs.getClubNo(), lastSaveClubs.getAccount());

        // 사용자 수 증가시키기
        clubMapper.userCountUp(lastSaveClubs.getClubNo());
    }

    public boolean remove(long clubNo) {
        log.info("삭제시킬 번호 가져와: {}", clubNo);
        boolean isDeleted = clubMapper.delete(clubNo);
        log.info("펄스를 트루로 변환시켜!: {}", isDeleted);
        return isDeleted;
    }

    public ClubDetailResponseDto detail(long bno) {
        Club club = clubMapper.findOne(bno);
        return new ClubDetailResponseDto(club);
    }

    // 사용자 수 증가시키기 메서드
    public void increaseUserCount(long clubNo) {
        clubMapper.userCountUp(clubNo);
    }

    public void joinClub(long clubNo, String account) {
        // 사용자 클럽 가입 정보 추가
        clubMapper.insertUserClub(clubNo, account, "MEMBER");

        // 클럽의 사용자 수 증가
        clubMapper.userCountUp(clubNo);
    }

    // 가입신청 누른 사람 조회
    public List<ApplicantDto> getApplicants(long clubNo) {
        return clubMapper.findApplicants(clubNo);
    }

    // 가입 승인 시 권한 중간처리
    public String getUserRole(long clubNo, String account) {
        return clubMapper.findUserRole(clubNo, account);
    }

    public void requestJoin(long clubNo, String account) {
        clubMapper.insertUserClub(clubNo, account, "PENDING");
    }

    public void approveApplicant(Long clubNo, String account) {
        clubMapper.updateUserRole(clubNo, account, "MEMBER");
    }
}
