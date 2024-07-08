<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <%@ include file="../include/static-head.jsp" %>
  <link href="/assets/css/myPage/myPage.css" rel="stylesheet" />

</head>
<body>
  <%@ include file="../include/header.jsp" %>

  <div class="myPage_wrap">
    <%@ include file="../include/myPage-nav.jsp" %>
    <div class="myPage_inner">
      <h1>포인트 충전</h1>
      <form action="/myPage/rechargePoint" method="post">
        <input name="pointsAmount" type="number">
        <button type="submit">충전</button>
    </div>
  </div>
  <%@ include file="../include/footer.jsp" %>

</body>
</html>