<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>

    <style>
      #notice-board {
        border: 1px solid blue;
        height: 100%;
        width: 200px;
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
    <!-- <%@ include file="../include/header.jsp" %> -->

    <div id="notice-board">
      <div class="main-title-wrapper">
        <h1 class="main-title">공지사항</h1>
        <button class="add-btn">새 글 쓰기</button>
      </div>

      <div class="notice-list-box">
        <c:if test="${list.size() > 0}">
          <c:forEach var="b" items="${list}">
            <div class="notice-box">
              <div>작성자: ${b.account}</div>
              <div>공지사항 제목: ${b.mainNoticeTitle}</div>
              <div>공지사항 내용: ${b.mainNoticeContent}</div>
              <div>작성 시간: ${b.mainNoticeCreatedAt}</div>
            </div>
          </c:forEach>
        </c:if>
      </div>
    </div>

    <script>
      // write button event
      document.querySelector(".add-btn").onclick = (e) => {
        window.location.href = "/notice/write";
      };
    </script>
  </body>
</html>
