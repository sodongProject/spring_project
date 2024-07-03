package com.project.myPage.config;

import com.project.myPage.interceptor.MyPageInterceptor;
import com.project.myPage.service.MyPageService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@RequiredArgsConstructor
public class InterceptorConfig implements WebMvcConfigurer {


    private final MyPageInterceptor myPageInterceptor;


    @Override
    public void addInterceptors(InterceptorRegistry registry) {


        registry.addInterceptor(myPageInterceptor)
                .addPathPatterns("/myPage/*");


    }
}
