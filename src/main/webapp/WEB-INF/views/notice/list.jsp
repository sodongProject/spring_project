<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>

    <style>
      .notice-box {
        border: 1px solid #000;
        height: 70px;
        width: 100px;
      }
    </style>
  </head>
  <body>
    <div class="main-title-wrapper">
      <h1 class="main-title">공지사항</h1>
      <button class="add-btn">새 글 쓰기</button>
    </div>

    <div class="notice-list-box">
      <c:if test="${list.size() > 0}">
        <c:forEach var="b" items="${list}">
          <div class="notice-box">
            <div>${b.account}</div>
            <div>${b.mainNoticeTitle}</div>
            <div>${b.mainNoticeContent}</div>
          </div>
        </c:forEach>
      </c:if>
    </div>

    <script>
      // write button event
      document.querySelector(".add-btn").onclick = (e) => {
        window.location.href = "/notice/write";
      };
    </script>
  </body>
</html>
