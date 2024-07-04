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

    <!-- reset -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

    <!-- fontawesome css: https://fontawesome.com -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

    <link rel="stylesheet" href="/assets/css/club/description.css">
</head>
<body>

<div id="wrap" class="info-container" data-cno="${club.clubNo}">
    <h1>동호회 상세 정보</h1>
    <div class="info-card">
        <h2>게시물 번호: ${club.clubNo}</h2>
        <p>작성일자: <span class="info">${club.regDateTime}</span></p>
        <p>작성자: <span class="info">${club.writer}</span></p>
        <p>제목: <span class="info">${club.title}</span></p>
        <div class="content-box">
            <p>내용:</p>
            <div class="content">${club.content}</div>
        </div>
    </div>
    <div class="buttons">
        <button class="list-btn" type="button" onclick="window.location.href='/club/list'">목록</button>
    </div>
</div>

</body>
</html>
