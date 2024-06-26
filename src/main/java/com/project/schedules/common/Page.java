package com.project.schedules.common;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter
//@Setter // 이상한값 들어가는거 방지
@ToString
@EqualsAndHashCode
//@NoArgsConstructor    // 생성자를 만들었으니 제거
@AllArgsConstructor
public class Page {

        private int pageNo;     // 클라이언트가 요청한 페이지 번호
        private int amount;     // 클라이언트가 요청한 한 페이지당 게시물 목록 수

        public Page() {
            this.pageNo = 1;
            this.amount = 3;
        }

        public void setPageNo(int pageNo) {
            if (pageNo < 1 || pageNo > Integer.MAX_VALUE) {
                this.pageNo = 1;
                return;
            }
            this.pageNo = pageNo;
        }

        public void setAmount(int amount) {
            if (amount < 3 || amount > 60){
                this.amount = 3;
                return;
            }
            this.amount = amount;
        }

    /*
        만약에 한 페이지에 게시물을 10개씩 렌더링 한다면

        1 페이지 -> Limit 0,10
        2 페이지 -> Limit 10,10
        3 페이지 -> Limit 20,10

        만약에 한 페이지에 게시물을 6개씩 렌더링 한다면

        1 페이지 -> Limit 0,6
        2 페이지 -> Limit 6,6
        3 페이지 -> Limit 12,6

        만약에 한 페이지에 게시물을 n개씩 렌더링 한다면

        1 페이지 -> Limit 0,n
        2 페이지 -> Limit 6,n
        3 페이지 -> Limit 12,n
        M 페이지 -> Limit (M - 1) * n, n
     */


        //  마이바티스에선 필드를 설정하지 않고 게터를 만들어도 존재하는걸로 판단하여 가져감 그래서
        // pageStart 를 만들어서 xml 로 보냄
        public int getPageStart(){
            return (this.pageNo - 1) * this.amount;
        }

    }


