package com.project.club.service;

import com.project.club.common.Search;
import com.project.club.dto.*;
import com.project.club.entity.Club;
import com.project.club.mapper.ClubMapper;
import com.project.login.dto.LoginUserInfoDto;
import com.project.login.entity.Users;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.stream.Collectors;

import static com.project.util.LoginUtil.CLUB_LOGIN;
import static com.project.util.LoginUtil.LOGIN;

@Service
@RequiredArgsConstructor
@Slf4j
public class ClubService {

    private final ClubMapper clubMapper;

    //  회원 전체조회 및 권한가져오는 중간처리
    public List<ClubListResponseDto> findList(Search search, String account) {
        List<ClubFindAllDto> clubList = clubMapper.findAll(search);
        clubList.forEach(System.out::println);
        return clubList.stream()
                .map(c -> new ClubListResponseDto(c, clubMapper.findUserStatus(c.getClubNo(), account)))
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

    // 1-1  디테일 정보와 권한 가져오는 중간처리
    public ClubDetailResponseDto detail(long bno, String account) {
        Club club = clubMapper.findOne(bno);
        String userAuthStatus = clubMapper.findUserRole(club.getClubNo(), account); // 사용자 권한 상태 조회
        String userName = clubMapper.findUserName(club.getClubNo()); // 사용자 이름 조회
        return new ClubDetailResponseDto(club, userAuthStatus, userName);
    }

    // 1-2 디테일 정보와 권한 가져오는 중간처리
    public ClubDescriptionResponseDto description(long clubNo) {
        Club club = clubMapper.findOne(clubNo);
        String userName = clubMapper.findUserName(club.getClubNo()); // 사용자 이름 조회
        return new ClubDescriptionResponseDto(club, userName);

    }

    // 사용자 수 증가시키기 메서드
    public void increaseUserCount(long clubNo) {
        clubMapper.userCountUp(clubNo);
    }

//    public void joinClub(long clubNo, String account) {
//        // 사용자 클럽 가입 정보 추가
//        clubMapper.insertUserClub(clubNo, account, "MEMBER");
//
//        // 클럽의 사용자 수 증가
//        clubMapper.userCountUp(clubNo);
//    }

    // 가입신청 누른 사람 조회
    public List<ApplicantDto> getApplicants(long clubNo) {
        return clubMapper.findApplicants(clubNo);
    }



    // 가입 승인 시 권한 중간처리
    public String getUserRole(long clubNo, String account) {
        return clubMapper.findUserRole(clubNo, account);
    }

//    public void requestJoin(long clubNo, String account) {
//        clubMapper.insertUserClub(clubNo, account);
//    }


    // 클럽 로그인 사용자 정보 조회
    public ClubLoginUserInfoDto getClubLoginUserInfo(String account, HttpSession session) {
        ClubLoginUserInfoDto clubLoginUserInfo = clubMapper.findClubLoginUserInfo(account);
        maintainClubLoginState(session, clubLoginUserInfo);
        return clubLoginUserInfo;
    }

    private void maintainClubLoginState(HttpSession session, ClubLoginUserInfoDto clubLoginUserInfo) {
        session.setAttribute(CLUB_LOGIN, clubLoginUserInfo);
    }



    // 사용자 클럽 정보 확인
    public boolean checkIfUserExistsInClub(String account, long clubNo) {
        return clubMapper.checkIfUserExistsInClub(account, clubNo) > 0;
    }

    // 사용자 클럽 정보 추가
    public void insertUserClub(long clubNo, String account, String role) {
        // 체크하여 가입된 사람이 있는지 clubNo와 account 로 확인
        if (!checkIfUserExistsInClub(account, clubNo)) {
            // 사용자가 해당 클럽에 없으면 새로 추가
            clubMapper.insertUserClubAdd(clubNo, account, role);
        }
        // 이미 사용자가 클럽에 속해 있으면 추가하지 않고 넘어감
    }




    public void approveApplicant(Long clubNo, String account) {
        try {
            log.info("approveApplicant - clubNo: {}, account: {}", clubNo, account);
            clubMapper.updateUserRole(clubNo, account, "MEMBER");
            log.info("User approved successfully - clubNo: {}, account: {}", clubNo, account);
        } catch (Exception e) {
            log.error("Error in approveApplicant - clubNo: {}, account: {}", clubNo, account, e);
            throw e; // Rethrow the exception to be handled by the controller
        }
    }

    public void denyApplicant(Long clubNo, String account) {
        try {
            log.info("denyApplicant - clubNo: {}, account: {}", clubNo, account);
            String currentRole = clubMapper.findUserRole(clubNo, account);
            log.info("Current role for account {}: {}", account, currentRole);

            if ("PENDING".equals(currentRole)) {
                clubMapper.denyApplicant(clubNo, account, "PENDING");
                log.info("User denied successfully - clubNo: {}, account: {}", clubNo, account);
            } else {
                log.warn("Cannot deny user - current role is not PENDING: {}", currentRole);
            }
        } catch (Exception e) {
            log.error("Error in denyApplicant - clubNo: {}, account: {}", clubNo, account, e);
            throw e; // Rethrow the exception to be handled by the controller
        }
    }

    // 멤버수 조회
    public int getApprovedMemberCount(long clubNo, String account) {
        return clubMapper.usersClubsUserCount(clubNo, account);
    }

    // 멤버 맥스에 추가하는 쿼리
    public void updateClubMemberMax(long clubNo, String account) {
        int approvedMemberCount = clubMapper.usersClubsUserCount(clubNo, account);  // 이전에 정의된 승인된 멤버 수 조회
        clubMapper.updateMemberMax(clubNo, approvedMemberCount);
    }

    // 가입신청을 눌렀을때 권한변경하는 충간처리
    public void joinUpdateUser(Long clubNo, String account) {
        clubMapper.updateUserStatus(clubNo, account, "PENDING", "WAITING");
    }

    // 클럽 탈퇴하는 중간처리
    public void withdrawMember(Long clubNo, String account) {
        clubMapper.updateUserStatus(clubNo, account, "PENDING", "CANCELLED");
    }


}
