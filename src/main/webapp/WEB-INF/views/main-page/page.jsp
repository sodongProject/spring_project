<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="../include/static-head.jsp" %>

    <link href="/assets/css/" rel="stylesheet" />
    <style>
      section {
        width: 1200px;
        margin: 0 auto;
        padding-top: 100px;
      }

      /* 타이틀 */
      h1.main-title {
        font-family: Montserrat;
        font-size: 64px;
        font-weight: 700;
        line-height: 95px;
        letter-spacing: -0.015em;
        text-align: center;
      }

      /* 동호회 랭킹순위 박스 */
      div.ranking-box {
        display: flex;
        justify-content: space-between;
        margin-top: 80px;
      }

      div.most-member-box,
      div.recent-box,
      div.most-scheduled-box {
        width: calc((100% - 100px) / 3);
        height: 500px;
        top: 267px;
        left: 607px;
        gap: 0px;
        border: 1px 0px 0px 0px;
        opacity: 0px;
        border: 1px solid #00000080;
      }

      p.rank-list {
        border: 1px solid red;
      }

      .notice-box {
        border: 1px solid #000;
        height: 70px;
        width: 100px;
      }

      .club-ranking {
        border: 1px solid #000;
        height: 70px;
        width: 100px;
      }
    </style>
  </head>
  <body>
    <section class="main-page">
      <div class="main-title-wrapper">
        <h1 class="main-title">SODONG 랭킹</h1>
        <button class="notice-btn">Sodong 공지사항</button>
      </div>

      <!-- 동호회 랭킹 순위 -->
      <div class="ranking-box">
        <div class="most-member-box">
        <%@ include file="../club-ranking/most-member.jsp" %>

          <!-- <div class="rank-list"></div>
          <div>
          <h3 class="rank-text">가장 많은 회원 수</h3>
            
          </div> -->
        </div>
        <div class="recent-box">
          <div class="rank-list"></div>
          <div>
            <h3 class="rank-text">가장 최근에 생긴</h3>

          </div>
        </div>
        <div class="most-scheduled-box">
          <div class="rank-list"></div>
          <div>
            <h3 class="rank-text">가장 소모임이 많은</h3>

          </div>
        </div>
      </div>
    </section>

    <!-- 회원수 가장 많은 동호회 랭킹순 -->
    <!-- 가장 최근에 생긴 동호회 랭킹순 -->
    <!-- <%@ include file="../club-ranking/recent.jsp" %> -->
    <!-- 소모임이 가장 많은 동호회 랭킹순 -->
    <!-- <%@ include file="../club-ranking/most-scheduled.jsp" %> -->

    <!-- 페이지에 로그인한 유저가 가입한 동호회 목록 -->
    <!-- 관리자가 로그인하면 안보이게 처리 -->
    <!-- <%@ include file="../club-ranking/login-users-club.jsp" %> -->

    <script>
      // 공지사항 경로
      document.querySelector(".notice-btn").onclick = (e) => {
        window.location.href = "/main-notice/list";
      };
    </script>
  </body>
</html>
