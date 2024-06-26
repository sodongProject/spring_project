<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <h1>포인트 조회 페이지</h1>
  <h2>잔여 포인트: ${points}</h2>
  <form action="/myPage/rechargePoint" method="post">
    <input name="rePointsAmount" type="number">
    <button type="submit">충전</button>
  </form>
  <form action="/myPage/exchangePoint" method="post">
    <input name="exPointsAmount" type="number"/>
    <button type="submit">환전</button>
  </form>
  <c:if test="${isPossible == false}">보유 금액보다 작은 금액을 입력해주세요.</c:if>
</body>
</html>