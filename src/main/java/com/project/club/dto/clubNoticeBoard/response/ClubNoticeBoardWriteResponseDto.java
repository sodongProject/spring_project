package com.project.club.dto.clubNoticeBoard.response;


import com.project.club.entity.ClubNoticeBoard;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class ClubNoticeBoardWriteResponseDto {

    private String writer;
    private String title;
    private String content;
    private Boolean ClubNoticeIsDeleted = false; // 기본값 false
    private long clubNo;

//    private MultipartFile clubProfile;

    public ClubNoticeBoard toEntity() {
        ClubNoticeBoard C = new ClubNoticeBoard();
        C.setAccount(this.writer);
        C.setClubNoticeContent(this.content);
        C.setClubNoticeTitle(this.title);
        C.setClubNoticeIsDeleted(this.ClubNoticeIsDeleted);
        C.setClubNo(this.clubNo);

        return C;
    }
}
