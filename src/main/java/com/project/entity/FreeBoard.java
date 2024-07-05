package com.project.entity;

import lombok.*;
import org.apache.catalina.User;

import javax.persistence.ManyToOne;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FreeBoard {

    private long boardNo; // 게시판 ID
    private String content; // 내용
    private LocalDateTime regDateTime; // 작성시간
    private String boardImg; // 이미지
    private int viewCount; // 조회수
    private Boolean boardDelete; // 삭제여부
    @ManyToOne
    private String account; // 유저ID
    private int clubNo; // 동호회ID

    public FreeBoard(ResultSet rs) throws SQLException {
        this.boardNo = rs.getInt("club_community_no");
        this.content = rs.getString("club_community_content");
        this.regDateTime = rs.getTimestamp("club_community_created_at").toLocalDateTime();
        this.boardImg = rs.getString("club_community_image");
        this.viewCount = rs.getInt("club_community_view_count");
        this.boardDelete = rs.getBoolean("club_community_is_deleted");
        this.account = rs.getString("account");
        this.clubNo = rs.getInt("club_no");
    }
}