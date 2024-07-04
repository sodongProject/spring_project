<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 글쓰기</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">

    <!-- reset -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

    <link rel="stylesheet" href="/assets/css/freeBoard/write.css">

    <!-- ck editor -->
    <script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>

</head>
<body>
    <div class="container">
        <form action="/freeBoard/write" method="post">
            <div class="form-group">
                <label for="photo">Upload Photo</label>
                <input type="file" id="photo" name="photo" accept="image/*">
            </div>
            <div class="form-group">
                            <label for="account">Account</label>
                            <input type="content" id="account" name="account">
            </div>

             <label for="clubNo">ClubNo</label>
             <input type="content" id="clubNo" name="clubNo">

             <div class="form-group">
                <label for="content">Content (max 200 characters)</label>
                <textarea id="content" name="content" rows="4" placeholder="Enter your content here..." maxlength="200"></textarea>
                <div class="char-count" id="charCount">0 / 200</div>
            </div>
            <div class="form-group">
            <button class="list-btn" type="button" onclick="window.location.href='/board/list'">목록</button>
                <button type="submit">Post</button>
            </div>
        </form>
    </div>

    <script>CKEDITOR.replace('content');</script>
    <script src="/assets/js/freeBoard/write.js"></script>

</body>
</html>