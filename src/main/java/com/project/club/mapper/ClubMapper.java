package com.project.club.mapper;

import com.project.club.common.Search;
import com.project.club.dto.ApplicantDto;
import com.project.club.dto.ClubFindAllDto;
import com.project.club.entity.Club;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ClubMapper {

    // 동호회 목록 조회
    List<ClubFindAllDto> findAll(Search search);

    // 동호회 등록
    boolean save(Club club);

    // 동호회 삭제
    boolean delete(long clubNo);

    // 동호회 입장
    Club findOne(long clubNo);

    // 동호회 가입유저 수
    long count(Search search);

    // 동호회 페이지 만들었을때 정보 다가져와
    Club findLastSaveClubs();

    // 동호회 정보를 유저스클럽스에 저장시켜야함
    void saveUsers(@Param("clubNo") long clubNo,
                   @Param("account") String account);

    // 위에 유저스클럽스에 저장시킬때 club_member_max 가 증가되어야함
    void userCountUp(@Param("clubNo") long clubNo);


    // 가입신청했을때 유저스클럽스에 넣어!
    void insertUserClub(@Param("clubNo") long clubNo,
                        @Param("account") String account);


    List<ApplicantDto> findApplicants(@Param("clubNo") long clubNo);

    // 가입 승인 시 member 로 권한 상승
    void approveApplicant(@Param("clubNo") Long clubNo,
                          @Param("account") String account);

}

