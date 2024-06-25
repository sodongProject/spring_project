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

    public List<ClubNoticeBoardListResponseDto> findList() {

        List<ClubNoticeBoard> CNBList = clubNoticeBoardMapper.findAll();
        List<ClubNoticeBoardListResponseDto> dtoList = CNBList.stream()
                .map(ClubNoticeBoardListResponseDto::new)
                .collect(Collectors.toList());

        return dtoList;
    }

    public void insert(ClubNoticeBoardWriteResponseDto dto) {
        ClubNoticeBoard CNB = dto.toEntity();
        clubNoticeBoardMapper.save(CNB);
    }

    public boolean remove(long clubNoticeNo) {
        log.info("삭제시킬 번호 가져와: {}", clubNoticeNo);
        boolean delete = clubNoticeBoardMapper.delete(clubNoticeNo);
        log.info("트루 펄스로 변환좀 해줘 {} ", clubNoticeNo);
        return delete;
    }

    public ClubNoticeBoardDetailResponseDto detail(long clubNoticeNo) {
        ClubNoticeBoard CNB = clubNoticeBoardMapper.findOne(clubNoticeNo);
        return new ClubNoticeBoardDetailResponseDto(CNB);
    }
}
