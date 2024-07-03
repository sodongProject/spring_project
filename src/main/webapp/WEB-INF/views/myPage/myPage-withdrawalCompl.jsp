<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="../include/static-head.jsp" %>
    <link href="/assets/css/myPage/myPage.css" rel="stylesheet" />
  </head>
  <body>
    <div class="myPage_wrap withdrawal">
      <%@ include file="../include/myPage-nav.jsp" %>
      <div class="myPage_inner">
        <h1>회원 탈퇴가 완료되었습니다</h1>

        <button onclick="window.location='/'" id="goHomeBtn">홈으로</button>
      </div>
    </div>
  </body>
</html>
