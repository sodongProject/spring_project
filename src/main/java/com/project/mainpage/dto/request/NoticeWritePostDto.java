package com.project.mainpage.dto.request;

import com.project.mainpage.entity.MainNoticeBoard;
import lombok.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Setter @Getter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class NoticeWritePostDto {

    @NotNull
    private long bno; // 공지글 번호
    @NotBlank
    private String title; // 공지 제목
    @NotBlank
    private String content; // 공지 내용
    @NotBlank
    private String account; // 유저 ID

    public MainNoticeBoard toEntity() {
        MainNoticeBoard b = new MainNoticeBoard();
        b.setMainNoticeTitle(this.title);
        b.setMainNoticeContent(this.content);
        b.setAccount(this.account);
        return b;
    }

}
