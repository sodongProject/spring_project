package com.project.freeBoard.mapper;

import com.project.entity.FreeBoard;
import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class FreeBoardDto {

        private int boardNo; // 게시판 ID
        private String content; // 내용
        private String boardImg; // 이미지
        private String account; // 작성자 (유저ID)
        private int clubNo; // 클럽 번호
        private LocalDateTime regDateTime; // 작성시간
        private int viewCount; // 조회수
        private Boolean boardDelete; // 삭제여부

        public FreeBoardDto(FreeBoard freeBoard) {
                this.boardNo = freeBoard.getClubNo();
                this.content = freeBoard.getContent();
                this.boardImg = freeBoard.getBoardImg();
                this.account = freeBoard.getAccount();
                this.clubNo = freeBoard.getClubNo();
                this.regDateTime = freeBoard.getRegDateTime();
                this.viewCount = freeBoard.getViewCount();
                this.boardDelete = freeBoard.getBoardDelete();
        }
}
