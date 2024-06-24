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
        <div>
            제목: <input type="text" class="title" name="scheduleTitle">
        </div>
        <div>
            내용: <input type="text" class="title" name="scheduleContent">
        </div>
        <div>
            이미지: <input type="text" class="title" name="scheduleImage">
        </div>
        <div>
            계정: <input type="text" class="title" name="account">
        </div>
        <div>
            동호회 번호: <input type="text" class="title" name="clubNo">
        </div>
        <div>
            언제?: <input type="text" class="title" name="scheduleAt">
        </div>
        <button type="submit">등록</button>

    </form>
</div>


</html>