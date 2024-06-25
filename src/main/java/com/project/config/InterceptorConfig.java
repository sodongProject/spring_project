package com.project.config;

import com.project.interceptor.AfterLoginInterceptor;
import com.project.interceptor.AutoLoginInterceptor;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

// 만들어 놓은 인터셉터들을 스프링 컨텍스트에 등록하는 설정 파일
@Configuration
@RequiredArgsConstructor
public class InterceptorConfig implements WebMvcConfigurer {

    private final AfterLoginInterceptor afterLoginInterceptor;
    //보드인터셉터
    private final AutoLoginInterceptor autoLoginInterceptor;

    //설정 메서드
    @Override
    public void addInterceptors(InterceptorRegistry registry) {

            registry
                    .addInterceptor(afterLoginInterceptor)
                    //해당 인터셉터가 동작할 URL설정
                    .addPathPatterns("/users/sign-up", "/users/sign-in");

        //게시판 인터셉터 등록

        //자동로그인 인터셉터 등록
        registry
                .addInterceptor(autoLoginInterceptor)
                .addPathPatterns("/**");

    };


    }

