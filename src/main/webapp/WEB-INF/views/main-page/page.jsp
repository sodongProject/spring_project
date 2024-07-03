<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>

    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
        display: flex;
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

      .bi-bi-search {
        text-align: right;
        width: 100px;
        height: 100px;
      }
    </style>
  </head>
  <body>
    <div class="main-title-wrapper">
      <h1 class="main-title">sodong</h1>
      <button class="notice-btn">Sodong 공지사항</button>
    </div>

    <!-- 회원수 가장 많은 동호회 랭킹순 -->
    <%@ include file="../club-ranking/most-member.jsp" %>

    <!-- 가장 최근에 생긴 동호회 랭킹순 -->
    <%@ include file="../club-ranking/recent.jsp" %>

    <!-- 소모임이 가장 많은 동호회 랭킹순 -->
    <%@ include file="../club-ranking/most-scheduled.jsp" %>

    <!-- 페이지에 로그인한 유저가 가입한 동호회 목록 -->
    <!-- 관리자가 로그인하면 안보이게 처리 -->
    <%@ include file="../club-ranking/login-users-club.jsp" %>

    <script>
      // 공지사항 경로
      document.querySelector(".notice-btn").onclick = (e) => {
        window.location.href = "/main-notice/list";
      };
    </script>
  </body>
</html>
