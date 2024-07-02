package com.project.freeBoard.service;

import com.project.entity.FreeBoard;
import com.project.freeBoard.mapper.FreeBoardDto;
import com.project.freeBoard.mapper.FreeBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class FreeBoardService {

    private FreeBoardMapper freeBoardMapper;

    // 등록
    public boolean save(FreeBoardDto freeBoardDto) {
        FreeBoard freeBoard = dtoToEntity(freeBoardDto);
        return freeBoardMapper.save(freeBoard);
    }

    // 삭제
    public boolean delete(long freeboardNo) {
        return freeBoardMapper.delete(freeboardNo);
    }

    public List<FreeBoardDto> findAll() {
        List<FreeBoard> freeBoards = freeBoardMapper.findAll();
        return freeBoards.stream()
                .map(this::entityToDto)
                .collect(Collectors.toList());
    }

    public FreeBoardDto findOne(int boardNo) {
        FreeBoard freeBoard = freeBoardMapper.findOne(boardNo);
        return entityToDto(freeBoard);
    }

    private FreeBoard dtoToEntity(FreeBoardDto dto) {
        return FreeBoard.builder()
                .boardNo(dto.getBoardNo())
                .boardTitle(dto.getBoardTitle())
                .content(dto.getContent())
                .boardImg(dto.getBoardImg())
                .account(dto.getAccount())
                .clubNo(dto.getClubNo())
                .regDateTime(dto.getRegDateTime())
                .viewCount(dto.getViewCount())
                .boardDelete(dto.getBoardDelete())
                .build();
    }

    private FreeBoardDto entityToDto(FreeBoard entity) {
        return new FreeBoardDto(
                entity.getBoardNo(),
                entity.getBoardTitle(),
                entity.getContent(),
                entity.getBoardImg(),
                entity.getAccount(),
                entity.getClubNo(),
                entity.getRegDateTime(),
                entity.getViewCount(),
                entity.getBoardDelete()
        );
    }
}
