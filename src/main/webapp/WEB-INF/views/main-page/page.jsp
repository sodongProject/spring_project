<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
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

  <div class="main-title-wrapper">
    <h1 class="main-title">sodong</h1>
  </div>

  <%@ include file="../notice/list.jsp" %>
  <%@ include file="../club-ranking/most-member.jsp" %>
  <%@ include file="../club-ranking/recent.jsp" %>
  <%@ include file="../club-ranking/most-scheduled.jsp" %>

  <button class="search-btn"></button>

  <script>
    // write button event
    document.querySelector(".add-btn").onclick = (e) => {
      window.location.href = "/notice/write";
    };
  </script>

</body>
</html>