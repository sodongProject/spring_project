<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>가입 신청자 목록</title>
    <link rel="stylesheet" href="/assets/css/club/main.css">
</head>
<body>
<div class="container">
    <h1>가입 신청자 목록</h1>
    <table>
        <thead>
        <tr>
            <th>이름</th>
            <th>체온</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="applicant" items="${applicants}">
            <tr>
                <td>${applicant.userName}</td>
                <td>${applicant.temperature}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <button onclick="window.location.href='/club/detail?bno=${param.clubNo}'">돌아가기</button>
</div>
</body>
</html>
