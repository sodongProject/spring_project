package com.project.club.service;

import com.project.club.entity.UsersClubs;
import com.project.club.mapper.UsersClubsMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;


@Service
@RequiredArgsConstructor
@Slf4j
public class UsersClubsService {


    private final UsersClubsMapper usersClubsMapper;

    public void addUsersClubs(UsersClubs usersClubs) {
        usersClubsMapper.insertUsersClubs(usersClubs);
    }
}
