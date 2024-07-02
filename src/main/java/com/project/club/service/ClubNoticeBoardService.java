package com.project.club.service;

import com.project.club.dto.ClubListResponseDto;
import com.project.club.dto.clubNoticeBoard.response.ClubNoticeBoardDetailResponseDto;
import com.project.club.dto.clubNoticeBoard.response.ClubNoticeBoardListResponseDto;
import com.project.club.dto.clubNoticeBoard.response.ClubNoticeBoardWriteResponseDto;
import com.project.club.entity.ClubNoticeBoard;
import com.project.club.mapper.ClubNoticeBoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class ClubNoticeBoardService {

    private final ClubNoticeBoardMapper clubNoticeBoardMapper;

    // 전체 목록
    public List<ClubNoticeBoardListResponseDto> findList(long clubNo) {
        List<ClubNoticeBoard> CNBList = clubNoticeBoardMapper.findAll(clubNo);
        return CNBList.stream()
                .map(ClubNoticeBoardListResponseDto::new)
                .collect(Collectors.toList());
    }

    // 글쓰기
    public void insert(ClubNoticeBoardWriteResponseDto dto) {
        ClubNoticeBoard CNB = dto.toEntity();
        clubNoticeBoardMapper.save(CNB);
    }

    // 글 삭제
    public void delete(long clubNoticeNo) {
        clubNoticeBoardMapper.delete(clubNoticeNo);
    }

    // 상세 조회
    public ClubNoticeBoardDetailResponseDto detail(long clubNoticeNo) {
        log.info("clubNoticeNo: {}", clubNoticeNo);
        ClubNoticeBoard CNB = clubNoticeBoardMapper.findOne(clubNoticeNo);
        clubNoticeBoardMapper.upViewCount(clubNoticeNo);
        return new ClubNoticeBoardDetailResponseDto(CNB);
    }

}
