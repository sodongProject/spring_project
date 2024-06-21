package com.project.login.mapper;
import com.project.login.entity.Users;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


@Mapper
public interface UsersMapper {

    //회원가입
    boolean save(Users users);

    //회원정보 개별 조회(단일 조회)
    Users findOne(String account);

    //이메일 중복 검사
    //boolean existsById(String type, String keyword);

    boolean existsById(
            @Param("type") String type,
            @Param("keyword") String keyword
    );

    //자동로그인 쿠키값, 만료시간 업데이트
    //void updateAutoLogin(AutoLoginDto dto);

    //세션 아이디로 회원정보 조회
    Users findMemberBySessionId(String sessionId);

}