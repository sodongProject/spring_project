<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <div id="wrap" class="form-container">
    <h1>공지사항 글쓰기</h1>
    <form action="/main-notice/write" method="post">
        <label for="title">작성자</label>
        <input type="text" id="account" name="account" value="">
        <label for="title">제목</label>
        <input type="text" id="title" name="title" required>
        <label for="content">내용</label>
        <textarea id="content" name="content" maxlength="200" required></textarea>
        <div class="buttons">
            <button class="list-btn" type="button" onclick="window.location.href='/notice/list'">목록</button>
            <button type="submit">글쓰기</button>
        </div>
    </form>
</div>

</body>
</html>