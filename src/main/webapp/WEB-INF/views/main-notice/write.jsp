<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!Doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/assets/css/mainNotice/write.css" />
</head>

<body>
<div class="container">
    <h1>공지사항 작성</h1>
    <form action="/main-notice/write" method="post" name="write">
        <label for="userName">작성자:</label>
        <input type="text" id="userName" name="userName" value="${login.userName}" placeholder="관리자" readonly>
        <label for="title">제목:</label>
        <input type="text" id="title" name="mainNoticeTitle" required>
        <label for="content">내용:</label>
        <textarea id="content" name="mainNoticeContent" rows="10" required></textarea>

        <input type="submit" value="작성하기">
        <input type="submit" value="공지사항 목록" onclick="window.location.href='/main-notice/list'">
    </form>
</div>

</body>
</html>


