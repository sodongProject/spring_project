package com.project.club.service;

import com.project.club.common.Search;
import com.project.club.dto.ClubFindAllDto;
import com.project.club.dto.ClubListResponseDto;
import com.project.club.dto.ClubWriteRequestDto;
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

        List<ClubListResponseDto> dtoList = clubList
                .stream()
                .map(c -> new ClubListResponseDto(c))
                .collect(Collectors.toList());
        return dtoList;
    }

    public int getCount(Search search) {
        return (int) clubMapper.count(search);
    }

    // 등록 요청 처리
    public void insert(ClubWriteRequestDto dto) {
        Club C = dto.toEntity();
        clubMapper.save(C);
    }


    public boolean remove(long clubNo) {
        log.info("삭제시킬 번호 가져와: {}", clubNo);
        boolean isDeleted = clubMapper.delete(clubNo);
        log.info("펄스를 트루로 변환시켜!: {}", isDeleted);
        return isDeleted;
    }


    public void detail(long bno) {
        clubMapper.findOne(bno);
    }

}

