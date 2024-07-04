package com.project.mainpage.dto.response;

import com.project.mainpage.entity.MainNoticeBoard;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Getter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class NoticeDetailDto {

    private long mainNoticeNo; // 공지글 번호
    private String mainNoticeTitle; // 제목
    private String mainNoticeContent; // 내용
    private LocalDateTime mainNoticeCreatedAt; // 작성시간
    private String date; // 포맷팅된 날짜문자열

    public NoticeDetailDto (MainNoticeBoard dto) {
        this.mainNoticeNo = dto.getMainNoticeNo();
        this.mainNoticeTitle = dto.getMainNoticeTitle();
        this.mainNoticeContent = dto.getMainNoticeContent();

        LocalDateTime time = dto.getMainNoticeCreatedAt();
        this.date = dateFormatting(time);
    }

    private String dateFormatting(LocalDateTime regDateTime) {
        DateTimeFormatter pattern = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        return pattern.format(regDateTime);
    }

}
