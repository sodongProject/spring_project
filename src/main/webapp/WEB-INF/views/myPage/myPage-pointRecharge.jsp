<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>포인트 충전</h1>
  <form action="/myPage/rechargePoint" method="post">
    <input name="pointsAmount" type="number">
    <button type="submit">충전</button>
</body>
</html>