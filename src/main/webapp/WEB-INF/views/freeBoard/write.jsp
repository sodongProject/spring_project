<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../include/static-head.jsp" %>

    <link rel="stylesheet" href="/assets/css/freeBoard/write.css">

    <!-- ck editor -->
    <script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>

</head>
<body>
    <div class="container">
        <%@ include file="../include/header.jsp" %>
        <form action="/freeBoard/write" method="post" enctype="multipart/form-data">
            <label for="photo">Upload Photo</label>
            <div class="form-group SnsProfile">
            <div class="sns-box">
             <img src="/assets/img/image-add.png" alt="프로필 썸네일">
            </div>
                <input type="file" id="photo" name="boardImg" accept="image/*" style="display: none;">
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