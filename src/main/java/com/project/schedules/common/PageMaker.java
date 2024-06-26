package com.project.schedules.common;

import com.project.schedules.common.Page;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

// 페이지 화면 렌더링에 필요한 정보들을 계산
@Getter
@ToString
@EqualsAndHashCode
public class PageMaker {

    // 한 화면에 페이지를 몇개씩 배치할 것인지?
    private static final int PAGE_COUNT = 10;

    // 페이지 시작 번호와 끝 번호
    private int begin, end, finalPage;


    // 총 게시물 수
    private int totalCount;

    // 이전, 다음버튼 활성화 여부
    private boolean prev, next;

    // 현재 페이지 정보
    private com.project.schedules.common.Page pageInfo;

    public PageMaker(Page page, int totalCount) {
        this.pageInfo = page;
        this.totalCount = totalCount;
        makePageInfo();
    }

    // 페이지 생성에 필요한 데이터를 만드는 알고리즘
    private void makePageInfo() {
        // 1. end 값 계산
        /*
            지금 사용자가 7페이지를 보고 있다면
            페이지 구간 1~10 구간

            지금 사용자가 24페이지를 보고 있다면
            페이지 구간 20~30 구간

            5개씩 페이지를 배치하는 경우는
            7page : 6~10
            24page : 21~25

            공식: (올림 (현재 사용자가 위치한 페이지넘버 / 한 화면에 보여줄 페이지 수)) * 한 화면에 보여줄 페이지 수
         */

        // int 타입의 변수들을 올림처리 하려면 한쪽에 double 로 타입변경 과 ceil 다운캐스팅 int 로 해줌
        this.end = (int) (Math.ceil(pageInfo.getPageNo() / (double) PAGE_COUNT) * PAGE_COUNT);

        // 2. begin
        this.begin = this.end - PAGE_COUNT + 1;

        // 3. 마지막 페이지 구간에서 end 값 보정
        /*
            총 게시물이 237개이고 한 화면에 게시물을 10개씩 배치하고 있다면
            1 ~ 10 page 구간에는 게시물이 총 100개
            11 ~ 20 page 구간에는 게시물이 총 100개
            21 ~ 30 page 구간에는 게시물이 총 37개

            -> 마지막 구간에서 end 값이 30이 맞는지 확인이 필요함.
            -> 실제로는 24로 고정이 되어야 한다.

            // 마지막 페이지 번호를 구하는 공식

            게시물이 351개 한 페이지당 게시물 10개씩 배치
            끝 페이지 번호 = 36페이지

            올림 (총 게시물 수 / 한 페이지당 배치할 게시물 수)

         */

        // int/int 는 소수점이 안나오기 때문에 double 로 올림
        this.finalPage = (int) Math.ceil((double) totalCount / pageInfo.getAmount());

        // 마지막 구간에서 end 값을 finalPage 로 보정
        if(finalPage < this.end){
            this.end = finalPage;
        }

        // 4. 이전 버튼 활성화 여부
        this.prev = this.begin != 1;

        // 5. 다음 버튼 활성화 여부
        this.next = this.end < finalPage;

    }
}
