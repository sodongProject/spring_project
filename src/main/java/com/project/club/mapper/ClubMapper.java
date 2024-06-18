package com.project.club.mapper;

import com.project.club.entity.Club;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ClubMapper {

    // 동호회 목록 조회
    List<Club> findAll();

    // 동호회 등록
    boolean save(Club club);

    // 동호회 삭제
    boolean delete(long clubNo);

    // 동호회 입장
    Club findOne(long clubNo);

    // 동호회 가입유저 수
    long count();





}

