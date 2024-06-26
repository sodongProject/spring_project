<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!doctype html>
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
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="container">

    <h1>공지사항 작성</h1>
    <form action="/clubNoticeBoard/write" method="post" name="write">
        <label for="writer">작성자:</label>
        <input type="text" id="writer" name="writer" required>
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" required>
        <label for="content">내용:</label>
        <textarea id="content" name="content" rows="10" required></textarea>

<%--        아래 게시판번호는 받아와야 하니 나중에는 지워야 함 근데 어떻게 받아올까?       --%>
        <label for="clubNo">게시판번호</label>
        <input type="text" id="clubNo" name="clubNo" required>

        <input type="submit" value="작성하기">
    </form>
</div>

</html>


