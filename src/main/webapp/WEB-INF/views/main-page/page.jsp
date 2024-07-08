<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/assets/css/mainPage/page.css" />
  </head>
  
  <body>
    <%@ include file="../include/header.jsp" %>

    <p class="page-img"><img src="/assets/img/main-page/image2.jpg" alt=""></p>
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
              <c:if test="${not empty recentList}">
                <c:forEach var="c" items="${recentList}" varStatus="rank">
                  <li>동호회명: ${c.clubName}<br>생성일: ${c.date}</li>
                </c:forEach>
              </c:if>
              <c:if test="${empty recentList}">
                <div>최근에 만들어진 동호회가 없습니다.</div>
              </c:if>
            </ul>
            <h3>가장 최근에 생긴</h3>
          </div>

          <!-- 가장 회원이 많은 -->
          <div class="most-member">
            <ul class="rank-list">
              <c:if test="${not empty memberList}">
                <c:forEach var="c" items="${memberList}" varStatus="rank">
                  <li>
                    동호회명: ${c.clubName}<br>회원 수: ${c.clubMemberMax}명
                  </li>
                </c:forEach>
              </c:if>
              <c:if test="${empty memberList}">
                <div>가입자가 가장 많은 동호회가 없습니다.</div>
              </c:if>
            </ul>
            <h3>가장 회원이 많은</h3>
          </div>

          <!-- 가장 소모임이 많은 -->
          <div class="most-schedule">
            <ul class="rank-list">
              <c:if test="${not empty scheduledList}">
                <c:forEach var="c" items="${scheduledList}" varStatus="rank">
                  <li>
                    동호회명: ${c.clubName}<br>소모임 수: ${c.scheduleCount}개
                  </li>
                </c:forEach>
              </c:if>
              <c:if test="${empty scheduledList}">
                <div>소모임이 가장 많은 동호회가 없습니다.</div>
              </c:if>
            </ul>
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
