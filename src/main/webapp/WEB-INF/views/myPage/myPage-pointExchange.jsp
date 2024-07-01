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
    <div class="myPage_wrap">
      <%@ include file="../include/myPage-nav.jsp" %>
      <div class="myPage_inner">
        <h1>포인트 환전</h1>
        <form action="/myPage/exchangePoint" method="post">
          <input name="pointsAmount" type="number" />

          <button type="submit">환전</button>
        </form>
      </div>
    </div>
  </body>
</html>
