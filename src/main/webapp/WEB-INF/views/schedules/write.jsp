<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<%--<!DOCTYPE html>--%>
<%--<html lang="ko">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Title</title>--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/schedules/schedules.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>스케줄 생성하기!</h1>--%>
<%--<div class="schedule_modal">--%>
<%--    <form action="/schedules/write" method="POST">--%>
<%--        <div class="schedule_title">--%>
<%--            <label>제목</label>--%>
<%--            <input type="text" class="title" name="scheduleTitle">--%>
<%--        </div>--%>
<%--        <div class="schedule_content">--%>
<%--            <label>내용</label>--%>
<%--            <textarea type="text" class="title" name="scheduleContent">--%>
<%--            </textarea>--%>
<%--        </div>--%>
<%--        <div class="schedule_image">--%>
<%--            <div class="schedule_image_box">--%>
<%--                <img src="#" alt="/">--%>
<%--            </div>--%>
<%--            <label>이미지 추가</label>--%>
<%--            <input type="file" id="schedule_image" name="schedule_image" style="display: none">--%>
<%--        </div>--%>
<%--        <div class="schedule_at">--%>
<%--            <label>모임 시간</label>--%>
<%--            <input type="datetime-local" class="schedule_at" name="scheduleAt" value="${now}" min="${now}">--%>
<%--        </div>--%>

<%--        <button type="submit">등록</button>--%>
<%--    </form>--%>
<%--</div>--%>

<%--<script>--%>
<%--    const $profile = document.querySelector('.schedule_image');--%>

<%--    const $fileInput = document.getElementById('schedule_image');--%>

<%--    $profile.addEventListener('click', e => {--%>
<%--        $fileInput.click();--%>
<%--    });--%>

<%--    $fileInput.addEventListener('change', e => {--%>
<%--        const fileData = $fileInput.files[0];--%>
<%--        const reader = new FileReader();--%>

<%--        reader.readAsDataURL(fileData);--%>

<%--        reader.onloadend = e=> {--%>
<%--            const $img = document.querySelector('.schedule_image_box img');--%>
<%--            $img.src = reader.result;--%>
<%--        }--%>
<%--    })--%>
<%--</script>--%>

<%--</body>--%>
<%--</html>--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>스케줄 생성하기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/schedules/schedules.css">
</head>
<body>
<h1>스케줄 생성하기!</h1>
<h1>${login.account}</h1>
<button id="openModalBtn">모달 열기</button>

<div id="scheduleModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <form action="/schedules/write" method="POST">
            <div class="schedule_title">
                <label>제목</label>
                <input type="text" class="title" name="scheduleTitle">
            </div>
            <div class="schedule_content">
                <label>내용</label>
                <textarea class="content" name="scheduleContent"></textarea>
            </div>
            <div class="schedule_image">
                <div class="schedule_image_box">
                    <img src="#" alt="/">
                </div>
                <label>이미지 추가</label>
                <input type="file" id="schedule_image" name="scheduleImage" style="display: none">
            </div>
            <div class="schedule_at">
                <label>모임 시간
                <input type="datetime-local" class="schedule_at" name="scheduleAt" value="${now}" min="${now}">
                </label>
            </div>
            <button type="submit">등록</button>
        </form>
    </div>
</div>

<script>
    // Modal 관련 JavaScript
    const modal = document.getElementById("scheduleModal");
    const btn = document.getElementById("openModalBtn");
    const span = document.getElementsByClassName("close")[0];

    btn.onclick = function() {
        modal.style.display = "block";
    }

    span.onclick = function() {
        modal.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    // 이미지 미리보기 관련 JavaScript
    const $profile = document.querySelector('.schedule_image');
    const $fileInput = document.getElementById('schedule_image');

    $profile.addEventListener('click', e => {
        $fileInput.click();
    });

    $fileInput.addEventListener('change', e => {
        const fileData = $fileInput.files[0];
        const reader = new FileReader();

        reader.readAsDataURL(fileData);

        reader.onloadend = e => {
            const $img = document.querySelector('.schedule_image_box img');
            $img.src = reader.result;
        }
    });
</script>
</body>
</html>
