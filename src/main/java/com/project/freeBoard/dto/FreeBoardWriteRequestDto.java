package com.project.freeBoard.dto;

import com.project.entity.FreeBoard;
import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class FreeBoardWriteRequestDto {

    //html 폼태그 name 속성과 일치해야 함
    private String writer;
    private String content;
    //private String title;
    //private String photo;

    public FreeBoard toEntity(){
        FreeBoard b = new FreeBoard();
        b.setAccount(this.writer);
        b.setContent(this.content);
        //b.setBoardTitle(this.title);
        //b.getBoardImg(this.photo);
        return  b;
    }


}
