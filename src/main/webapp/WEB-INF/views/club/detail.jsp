<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <!-- main css -->
    <link rel="stylesheet" href="/assets/css/club/main.css">

    <style>
        body {
            background-color: #f4f4f4;
            font-family: 'Nunito Sans', sans-serif;
        }
        .form-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 40px;
            background-color: #fff;
            box-shadow: 0px 10px 25px rgba(0,0,0,0.05);
            border-radius: 8px;
        }
        .form-container h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 10px;
        }
        .form-container h2 {
            font-size: 16px;
            color: #555;
            margin-bottom: 20px;
        }
        label {
            color: #666;
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], #content {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #fafafa;
        }
        #content {
            height: 150px;
            overflow-y: auto;
            font-size: 14px;
            line-height: 1.6;
            color: #333;
            background-color: #fafafa;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .buttons {
            text-align: right;
        }
        button {
            padding: 10px 20px;
            font-size: 14px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.3s;
        }
        button.list-btn, button.notice-btn, button.freeboard-btn {
            background-color: #6c757d;
            margin-left: 10px;
        }
        button:hover {
            opacity: 0.9;
        }
        button.list-btn:hover {
            background-color: #5a6268;
        }
        button.notice-btn:hover {
            background-color: #5a6268;
        }
        button.freeboard-btn:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
<div id="wrap" class="form-container">
    <h1>게시물 번호: ${bbb.boardNo}</h1>
    <h2>작성일자: ${bbb.regDateTime}</h2>
    <label for="writer">작성자</label>
    <input type="text" id="writer" name="writer" value="${bbb.writer}" readonly>
    <label for="title">제목</label>
    <input type="text" id="title" name="title" value="${bbb.title}" readonly>
    <label for="content">내용</label>
    <div id="content">${bbb.content}</div>
    <div class="buttons">
        <button class="notice-btn" type="button" onclick="window.location.href='/club/notice'">공지사항</button>
        <button class="free_board-btn" type="button" onclick="window.location.href='/club/freeBoard'">자유게시판</button>
        <button class="list-btn" type="button" onclick="window.location.href='/club/list'">목록</button>
    </div>
</div>
</body>
</html>
