package com.project.freeBoard.dto;

import com.project.entity.FreeBoard;
import lombok.*;

import java.time.LocalDateTime;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class FreeBoardWriteRequestDto {

    //html 폼태그 name 속성과 일치해야 함
    private String account;
    private String content;
    //private String title;
    private String photo;
    private LocalDateTime time;
    private int clubNo;

    public FreeBoard toEntity(){
        FreeBoard b = new FreeBoard();
        b.setAccount(this.account);
        b.setContent(this.content);
        //b.setBoardTitle(this.title);
        b.setBoardImg(this.photo);
        b.setRegDateTime(this.time);
        b.setClubNo(this.clubNo);

        return b;
    }


}
