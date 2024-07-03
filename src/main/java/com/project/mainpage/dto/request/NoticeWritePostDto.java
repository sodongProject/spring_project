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

    private long mainNoticeNo; // 공지글 번호
    private String mainNoticeTitle; // 제목
    private String mainNoticeContent; // 공지 내용
    private String account; // 유저 ID

    public MainNoticeBoard toEntity() {
        MainNoticeBoard b = new MainNoticeBoard();
        b.setMainNoticeTitle(this.mainNoticeTitle);
        b.setMainNoticeContent(this.mainNoticeContent);
        b.setAccount(this.account);
        return b;
    }

}
