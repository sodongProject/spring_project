<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="../include/static-head.jsp" %>
    <link href="/assets/css/common.css" rel="stylesheet" />
    <link href="/assets/css/reset.css" rel="stylesheet" />
    <style>
      #page {
        width: 1200px;
        margin: 0 auto;
        padding-top: 100px;
      }

      section.second-page {
        height: 100vh;
      }

      /* 타이틀 */
      h1.main-title {
        font-family: Montserrat;
        font-size: 36px;
        font-weight: 700;
        letter-spacing: -0.015em;
        text-align: center;
        margin-top: 50px;
      }

      h1.main-title img {
        width: 60px;
        height: 60px;
        margin-top: 20px;
      }

      /* 동호회 랭킹순위 박스 */
      div.ranking-box {
        display: flex;
        justify-content: space-between;
        margin-top: 60px;
      }

      div.most-recent,
      div.most-schedule {
        width: calc((100% - 100px) / 3);
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 20px;
        margin-top: 70px;
        height: 530px;
        border-radius: 40px;
        box-shadow: 0 0 20px #00000020;
      }

      div.most-member {
        width: calc((100% - 100px) / 3);
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 20px;
        height: 600px;
        border-radius: 40px;
        box-shadow: 0 0 20px #00000020;
      }

      .rank-list li {
        width: 100%;
        height: 50px;
        border-radius: 500px;
        background: #F2F2F2;
        align-items: center;
        margin-bottom: 4px;
      }

      .ranking-box .rank-list {
        width: 100%;
        height: 300px;
      }

      .ranking-box h3 {
        font-family: Montserrat;
        font-size: 18px;
        font-weight: 700;
        color: #0d0d0d;
        margin-top: 30px;
      }

      /* 통계 카드 스타일 */
      .stats-box {
        display: flex;
        justify-content: space-between;
        margin-top: 80px;
      }

      .stats-item {
        display: flex;
        align-items: center;
        width: calc((100% - 60px) / 4);
        background: #f8f9fa;
        padding: 20px;
        text-align: center;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      }

      .stats-item img {
        width: 40px;
        height: 40px;
        margin-right: 10px;
      }

      .stats-text {
        text-align: left;
        margin-left: 20px;
      }

      .stats-text h2 {
        font-family: Montserrat;
        font-size: 32px;
        font-weight: 700;
        color: #333;
        margin: 0;
      }

      .stats-text p {
        font-family: Montserrat;
        font-size: 16px;
        color: #666;
        margin: 0;
      }

      /* 정보 카드 스타일 */
      .info-box {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        margin-top: 100px;
      }

      .info-item {
        width: calc((100% - 60px) / 3);
        background: #fff;
        padding: 20px;
        margin-bottom: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        text-align: center;
      }

      .info-item h3 {
        font-family: Montserrat;
        font-size: 20px;
        font-weight: 700;
        color: #333;
      }

      .info-item p {
        font-family: Montserrat;
        font-size: 14px;
        color: #666;
      }

      .info-item a {
        display: block;
        margin-top: 10px;
        color: #007bff;
        text-decoration: none;
        font-weight: 500;
      }
    </style>
  </head>
  <body>
    <%@ include file="../include/header.jsp" %>

    <section id="page">
    <!-- 2번째 페이지 시작 -->
    <section class="second-page">
      <!-- 페이지 타이틀 -->
      <div class="main-title-wrapper">
        <h1 class="main-title">
          <img src="/assets/img/main-page/title-left.png" />RANKING<img
            src="/assets/img/main-page/title-right.png"
          />
        </h1>
        <button class="notice-btn">Sodong 공지사항</button>
      </div>

      <!-- 동호회 랭킹 순위 박스 -->
      <div class="ranking-box">
        <!-- 가장 최근에 생긴 -->
        <div class="most-recent">
          <ul class="rank-list">
            <li></li>
          </ul>
          <h3>가장 최근에 생긴</h3>
        </div>

        <!-- 가장 회원이 많은 -->
        <div class="most-member">
          <div class="rank-list"></div>
          <h3>가장 회원이 많은</h3>
        </div>

        <!-- 가장 소모임이 많은 -->
        <div class="most-schedule">
          <div class="rank-list"></div>
          <h3>가장 소모임이 많은</h3>
        </div>
      </div>
      </section>
      <!-- 2번째 페이지 끝 -->


      <!-- 3번째 페이지 시작 -->
      <section class="third-page">

        <!-- SODONG 통계 카드 박스 -->
        <div class="stats-box">
          <div class="stats-item">
            <img src="/assets/img/main-page/member.png" alt="" />
            <div class="stats-text">
              <h2>232</h2>
              <p>Happy Clients</p>
            </div>
          </div>
          <div class="stats-item">
            <img src="/assets/img/main-page/yellow-star.png" alt="" />
            <div class="stats-text">
              <h2>521</h2>
              <p>Clubs</p>
            </div>
          </div>
          <div class="stats-item">
            <img src="/assets/img/main-page/orange-star.png" alt="" />
            <div class="stats-text">
              <h2>1463</h2>
              <p>Schedules</p>
            </div>
          </div>
          <div class="stats-item">
            <img src="/assets/img/main-page/red.png" alt="" />
            <div class="stats-text">
              <h2>15</h2>
              <p>뭐할까요</p>
            </div>
          </div>
        </div>

        <!-- 동호회 카드 박스 -->
        <div class="info-box">
          <div class="info-item">
            <h3>축구</h3>
            <p>축구</p>
            <a href="#">Read more →</a>
          </div>
          <div class="info-item">
            <h3>농구</h3>
            <p>농구</p>
            <a href="#">Read more →</a>
          </div>
          <div class="info-item">
            <h3>야구</h3>
            <p>야구</p>
            <a href="#">Read more →</a>
          </div>
          <div class="info-item">
            <h3>피구</h3>
            <p>피구</p>
            <a href="#">Read more →</a>
          </div>
          <div class="info-item">
            <h3>배구</h3>
            <p>배구</p>
            <a href="#">Read more →</a>
          </div>
          <div class="info-item">
            <h3>ㅁㅁ</h3>
            <p>ㅁㅁ</p>
            <a href="#">Read more →</a>
          </div>
        </div>


      </section>
      <!-- 3번째 페이지 끝 -->
      <%@ include file="../include/footer.jsp" %>
    </section>

    <script>
      // 공지사항 경로
      document.querySelector(".notice-btn").onclick = (e) => {
        window.location.href = "/main-notice/list";
      };
    </script>

  </body>
</html>
