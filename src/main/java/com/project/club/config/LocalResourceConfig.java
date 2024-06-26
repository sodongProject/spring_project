package com.project.club.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


// 로컬 서버에 저장된 이미지를 웹 브라우저에서 불러올 수 있도록
// 로컬 서버 파일경로를 웹 서버 URL 로 변경하는 설정
@Configuration
public class LocalResourceConfig implements WebMvcConfigurer {

    @Value("${file.upload.root-path}")
    private String rootPath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        /*
            addResourceLocations : 로컬에 있는 경로
            addResourceHandler   : 해당 로컬 경로를 웹 URL 로 변환하는 과정

            ex)
                D:/xxx/dog.jpg 가 있다 가정하면
                로컬에서 접근할 때에는 file:D:/xxx/dog.jpg 이렇게 접근이 가능하지만 웹에서는 차단이 됨
                웹 에서 접근할 때 http://localhost:8383/local/dog/jpg 로 가능
         */
        registry
                .addResourceHandler("/local/**")
                .addResourceLocations("file:" + rootPath);

    }
}
