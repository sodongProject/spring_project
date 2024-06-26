package com.project.club.mapper;

import com.project.club.entity.UsersClubs;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UsersClubsMapper {

    void insertUsersClubs(UsersClubs usersClubs);
}
