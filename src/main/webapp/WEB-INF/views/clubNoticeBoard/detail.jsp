<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 세부사항</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .notice-container {
            background: white;
            border: 1px solid #ccc;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            width: 90%;
            max-width: 600px;
        }
        #title {
            font-size: 18px;
            color: #555;
            margin-bottom: 2px;
        }
        #content {
            margin-top: 10px;
            padding: 10px;
            background: #fafafa;
            border: 1px solid #eaeaea;
            color: #333;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 16px;
            text-decoration: none;
            color: #31708f;
            padding: 10px;
            border: 1px solid #31708f;
            width: fit-content;
            margin: 20px auto 0;
        }
    </style>
</head>
</head>
<body>

<div class="notice-container">
    <h1>게시물 번호: ${club.clubNoticeNo}</h1>
    <h2>작성일자: ${club.regDateTime}</h2>
    <label for="writer">작성자</label>
    <input type="text" id="writer" name="writer" value="${club.writer}" readonly>
    <label for="title">제목</label>
    <input type="text" id="title" name="title" value="${club.title}" readonly>
    <label for="content">내용</label>
    <div id="content">${club.content}</div>

</div>
<a href="javascript:history.back()" class="back-link">목록으로 돌아가기</a>
</body>
</html>
