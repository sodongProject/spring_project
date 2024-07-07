package com.project;

import com.project.util.LoginUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home(HttpSession session) {
//        System.out.println();

        if(!LoginUtil.isLoggedIn(session)){
            return "index";
        }
        return "redirect:/main-page/page";
    }
}
