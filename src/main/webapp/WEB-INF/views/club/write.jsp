<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>클럽 만들기</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <link rel="stylesheet" href="/assets/css/club/main.css">

    <script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
    <style>
        * {
            box-sizing: border-box;
        }
        body {
            background-color: #f4f5f7;
            font-family: 'Roboto', sans-serif;
        }
        #wrap {
            width: 60%;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 40px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .form-container h1 {
            font-size: 32px;
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        label {
            color: #555;
            font-weight: 500;
            margin-bottom: 10px;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
            transition: border-color 0.3s;
        }
        input[type="text"]:focus, textarea:focus {
            border-color: #0056b3;
            outline: none;
        }
        .buttons {
            display: flex;
            justify-content: space-between;
        }
        button {
            cursor: pointer;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            border-radius: 5px;
            border: none;
            transition: background-color 0.2s;
        }
        button[type="submit"] {
            background-color: #007bff;
        }
        button.list-btn {
            background-color: #6c757d;
        }
        button:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>
<div id="wrap" class="form-container">
    <h1>클럽 만들기</h1>
    <form action="/club/write" method="post">
        <label for="writer">작성자</label>
        <input type="text" id="writer" name="writer" required>
        <label for="title">제목</label>
        <input type="text" id="title" name="title" required>
        <label for="content">내용</label>
        <textarea id="content" name="content" required></textarea>
        <label for="clubCompetition">대회 참여 여부</label>
        <input type="checkbox" id="clubCompetition" name="clubCompetition" value="true">
        <div class="buttons">
            <button class="list-btn" type="button" onclick="window.location.href='/club/list'">목록</button>
            <button type="submit">글쓰기</button>
        </div>
    </form>
</div>
<script>
    CKEDITOR.replace('content');
</script>
</body>
</html>
