<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/schedules/schedules.css">
</head>
<body>

<div class="schedule_modal">
    <form action="/schedules/write" method="POST">
        <div class="schedule_title">
            <label>제목</label>
            <input type="text" class="title" name="scheduleTitle">
        </div>
        <div class="schedule_content">
            <label>내용</label>
            <textarea type="text" class="title" name="scheduleContent">
            </textarea>
        </div>
        <div class="schedule_image">
            <div class="schedule_image_box">
                <img src="#" alt="/">
            </div>
            <label>이미지 추가</label>
            <input type="file" id="schedule_image" name="schedule_image" style="display: none">
        </div>
        <div class="schedule_at">
            <label>모임 시간</label>
            <input type="datetime-local" class="schedule_at" name="scheduleAt" value="${now}" min="${now}">
        </div>

        <button type="submit">등록</button>
    </form>
</div>

<script>
    const $profile = document.querySelector('.schedule_image');

    const $fileInput = document.getElementById('schedule_image');

    $profile.addEventListener('click', e => {
        $fileInput.click();
    });

    $fileInput.addEventListener('change', e => {
        const fileData = $fileInput.files[0];
        const reader = new FileReader();

        reader.readAsDataURL(fileData);

        reader.onloadend = e=> {
            const $img = document.querySelector('.schedule_image_box img');
            $img.src = reader.result;
        }
    })
</script>

</body>
</html>