<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

<h1>스케줄 등록하는 jsp</h1>

</body>
schedule_title, schedule_content, schedule_image, account, club_no, schedule_at

<div>
    <form action="/schedules/write" method="POST">
        <label>제목</label>
        <input type="text" class="title" name="scheduleTitle">

        <label>내용</label>
        <input type="text" class="title" name="scheduleContent">

        <label>이미지</label>
        <input type="text" class="title" name="scheduleImage">

        <label>계정</label>
        <input type="text" class="title" name="account">

        <label>동호회번호</label>
        <input type="number" class="title" name="clubNo">

        <button type="submit">등록</button>
    </form>
</div>


</html>