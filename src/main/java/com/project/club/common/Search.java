package com.project.club.common;


import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
@EqualsAndHashCode

// 페이지에 있는 내용을 상속받아 search 사용
public class Search extends Page {

    // 검색어, 검색조건
    private String keyword, type;

    public Search() {
        this.keyword = "";
    }



}
