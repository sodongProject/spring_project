<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!Doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>공지사항 작성</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            width: 800px;
            margin: 20px auto;
        }

        form {
            margin-bottom: 20px;
            padding: 20px;
            border: 1px solid #ccc;
        }

        label {
            display: block;
            margin: 10px 0;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #f2cb05;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    
<div class="container">
    <h1>공지사항 작성</h1>
    <form action="/main-notice/write" method="post" name="write">
        <label for="account">작성자:</label>
        <input type="text" id="account" name="account" value="${login.account}" placeholder="관리자" readonly>
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


