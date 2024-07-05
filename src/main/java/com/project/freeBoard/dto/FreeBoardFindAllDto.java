package com.project.freeBoard.dto;

import lombok.*;

import javax.persistence.ManyToOne;
import java.time.LocalDateTime;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
@Builder
public class FreeBoardFindAllDto {

    private long clubCommunityNo; // 게시판 ID
    private String clubCommunityContent; // 내용
    private LocalDateTime clubCommunityCreatedAt; // 작성시간
    private Boolean clubCommunityIsDelete; // 삭제여부
    private String account; // 유저ID
    private int clubNo; // 동호회ID
    private String clubCommunityImage; //이미지


}
