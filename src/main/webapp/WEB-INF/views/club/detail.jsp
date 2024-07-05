<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동호회 상세정보</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <link rel="stylesheet" href="/assets/css/club/clubDetail.css">
</head>
<body>
<div id="wrap" class="form-container" data-cno="${club.clubNo}">
    <div class="header">
        <h1>${club.title}</h1>
        <span class="writer">작성자: ${club.userName}</span>
    </div>
    <div class="image-section">
        <c:choose>
            <c:when test="${not empty club.multipartFile}">
                <img src="${club.multipartFile}" alt="profile image" title="${club.multipartFile}">
            </c:when>
            <c:otherwise>
                <img class="image" src="/assets/img/club/image-add.png" alt="profile image"/>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="content-section">
        <p>${club.content}</p>
    </div>
    <div class="buttons">
        <c:if test="${club.userAuthStatus == 'ADMIN'}">
            <form action="/club/applicants" method="get" style="display: inline;">
                <input type="hidden" name="clubNo" value="${club.clubNo}">
                <button class="admin-btn" type="submit">가입 신청자 확인</button>
            </form>
        </c:if>
        <button class="notice-btn" onclick="window.location.href='/clubNoticeBoard/list?clubNo=${club.clubNo}'">공지사항</button>
        <button class="free_board-btn" onclick="window.location.href='/club/freeBoard'">자유게시판</button>
        <button class="list-btn" onclick="window.location.href='/club/list'">목록</button>
    </div>
</div>
</body>
</html>
