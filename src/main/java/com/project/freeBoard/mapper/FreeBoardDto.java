package com.project.freeBoard.mapper;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class FreeBoardDto {

        private int boardNo; // 게시판 ID
        private String boardTitle; // 제목
        private String content; // 내용
        private String boardImg; // 이미지
        private String account; // 작성자 (유저ID)
        private int clubNo; // 클럽 번호
        private LocalDateTime regDateTime; // 작성시간
        private int viewCount; // 조회수
        private Boolean boardDelete; // 삭제여부

}


