package com.project.freeBoard.dto;

import com.project.entity.FreeBoard;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
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
    @NotBlank
    @Size(max=100)
    private String content;
    private String photo;
    private int clubNo;
    private long boardNo;
    private MultipartFile boardImg;

    public FreeBoard toEntity(){
        FreeBoard b = new FreeBoard();
        b.setAccount(this.account);
        b.setContent(this.content);
        b.setBoardImg(this.photo);
        b.setClubNo(this.clubNo);
        b.setBoardNo(this.boardNo);
        b.setBoardImg(String.valueOf(this.boardImg));

        return b;
    }



}
