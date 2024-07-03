//package com.project.freeBoard.repository;
//
//import com.project.entity.FreeBoard;
//import lombok.RequiredArgsConstructor;
//import org.springframework.jdbc.core.JdbcTemplate;
//import org.springframework.stereotype.Repository;
//
//import java.util.List;
//
//@Repository
//@RequiredArgsConstructor
//public class FreeBoardRepositoryImpl implements FreeBoardRepository {
//
//    private final JdbcTemplate template;
//
//    @Override
//    public List<FreeBoard> findAll() {
//        String sql = "SELECT * FROM clubs_community_boards";
//        return template.query(sql, (rs, rowNum) -> new FreeBoard(rs));
//    }
//
//    @Override
//    public FreeBoard findOne(int boardNo) {
//        String sql = "SELECT * FROM clubs_community_boards WHERE club_community_no = ?";
//        return template.queryForObject(sql, new Object[]{boardNo}, (rs, rowNum) -> new FreeBoard(rs));
//    }
//
//    @Override
//    public boolean save(FreeBoard freeBoard) {
//        String sql = "INSERT INTO clubs_community_boards " +
//                "(club_community_title, club_community_content, account) " +
//                "VALUES (?,?,?)";
//        return template.update(sql,
//                freeBoard.getBoardTitle(),
//                freeBoard.getContent(),
//                freeBoard.getAccount()) == 1;
//    }
//
//    @Override
//    public boolean delete(int boardNo) {
//        String sql = "DELETE FROM clubs_community_boards WHERE club_community_no = ?";
//        return template.update(sql, boardNo) == 1;
//    }
//
//    @Override
//    public void upViewCount(int boardNo) {
//        String sql = "UPDATE clubs_community_boards " +
//                "SET club_community_view_count = club_community_view_count + 1 " +
//                "WHERE club_community_no = ?";
//        template.update(sql, boardNo);
//    }
//}
