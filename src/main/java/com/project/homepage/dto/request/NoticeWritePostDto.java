package com.project.homepage.dto.request;

import lombok.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class NoticeWritePostDto {

    @NotNull
    private long bno; // 공지글 번호
    @NotBlank
    private String title; // 공지 제목
    @NotBlank
    private String content; // 공지 내용
    @NotBlank
    private String writer; // 작성자

}
