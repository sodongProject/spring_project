package com.project.login.controller;

import com.project.login.service.UsersService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import static org.mockito.BDDMockito.given;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@ExtendWith(SpringExtension.class)
@SpringBootTest
@AutoConfigureMockMvc
public class LoginControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private UsersService usersService;

    @Test
    public void testCheckIdentifier() throws Exception {
        // 중복이 아닌 경우
        given(usersService.checkIdentifier("account", "uniqueUser1234")).willReturn(false);

        mockMvc.perform(MockMvcRequestBuilders.get("/users/check")
                        .param("type", "account")
                        .param("keyword", "uniqueUser1234"))
                .andExpect(status().isOk())
                .andExpect(content().string("false"));

        // 중복인 경우
        given(usersService.checkIdentifier("account", "catcat123")).willReturn(true);

        mockMvc.perform(MockMvcRequestBuilders.get("/users/check")
                        .param("type", "account")
                        .param("keyword", "catcat123"))
                .andExpect(status().isOk())
                .andExpect(content().string("true"));
    }
}
