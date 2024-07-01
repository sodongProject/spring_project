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
        <h1>포인트 조회</h1>
        <h2>잔여 포인트: ${points}</h2>
        <form action="/myPage/rechargePoint" method="post">
          <input name="rePointsAmount" type="number" min="1" />
          <button type="submit">충전</button>
        </form>
        <form action="/myPage/exchangePoint" method="post">
          <input name="exPointsAmount" type="number" min="1" />
          <button type="submit">환전</button>
        </form>
        <c:if test="${isPossible == false}"
          >보유 금액보다 작은 금액을 입력해주세요.</c:if
        >
      </div>
    </div>
  </body>
</html>
