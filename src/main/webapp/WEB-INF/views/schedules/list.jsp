

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>스케줄 생성하기</title>
    <%@ include file="../include/static-head.jsp" %>

    <link rel="stylesheet" href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'>
    <link rel="stylesheet" href="/assets/css/schedules/schedules.css">
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.2/uicons-solid-rounded/css/uicons-solid-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.2/uicons-thin-straight/css/uicons-thin-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.2/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.2/uicons-solid-straight/css/uicons-solid-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.2/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.2/uicons-regular-straight/css/uicons-regular-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.2/uicons-regular-straight/css/uicons-regular-straight.css'>
</head>
<body>
<div id="schedule-section">
    <button id="open_modal_btn">스케줄 생성하기</button>

    <div id="schedule-modal" class="modal" data-clubNo="1">
        <div class="modal-content">
            <span class="close"><i class="fi fi-br-cross"></i></span>
            <form>
                <div id="title"><h1>스케줄 생성하기</h1></div>
                <div id="club_no" >
                    <input type="number" name="clubNo" value="1" disabled hidden>
                </div>
                <div class="schedule_title">
                    <label>소모임 이름</label>
                    <input id="schedule_title" type="text" class="title" name="scheduleTitle" required>
                </div>
                <div class="schedule_content">
                    <label>내용</label>
                    <textarea id="schedule_content" class="content" name="scheduleContent" required></textarea>
                </div>
                <div class="schedule_at">
                    <label>모임 시간</label>
                    <input id="schedule_at" type="datetime-local" name="scheduleAt" value="${now}" min="${now}" required>
                </div>
                <div class="participation_points">
                    <label>회비</label>
                    <input type="number" id="participation_points" name="participationPoints" required>
                </div>
                <button id="add_schedule_button" type="submit">등록</button>
            </form>
        </div>
    </div>

    <div id="wrap">
        <div class='page-item prev-btn'>
            <i class="fi fi-ts-angle-small-right page-link prev" data-pno="1"></i>
        </div>
        <div class="card-container">

        </div>
        <div class='page-item'>
            <i class="fi fi-ts-angle-small-right page-link next" data-end="1"></i>
        </div>
    </div>

    <div id="register-modal">
        <div class="register-modal-content">
            <h1 class="register-content">???에 참여하시겠습니까?</h1>
            <p class="participation_point">참가비 : ???</p>
            <div class="register-btn">
                <button class="accept-btn">참여</button>
                <button class="refuse-btn">취소</button>
            </div>
        </div>
    </div>

    <div id="detail-modal">
        <div class="detail-modal-content">

        </div>
    </div>

    <div id="register-list-modal">
        <div class="register-list-modal-content">
            <div class="application-user-info">
                <div class="user-info">
                    <span class="user-name">신청인 : 유저 이름</span>
                    <span class="user-temperature">유저 온도 : 36.5</span>
                </div>
                <div class="register-list-btn">
                    <button class="accept-btn">수락</button>
                    <button class="refuse-btn">거절</button>
                </div>
            </div>
        </div>
    </div>

    <div class="schedule-member-modal">
        <div class="schedule-member-modal-content">
            <div class="member-list">
                <div class="member-info">
                    <span class="user-name">이름 : ???</span>
                    <span class="user-temperature">유저 온도 : 36.5</span>
                </div>
                <div class="member-exile-btn">
                    <button class="exile-btn">추방</button>
                </div>
            </div>
        </div>
    </div>

    <div class="schedule-secession-modal">
        <div class="secession-modal-content">
            <h1 class="secession-content">???에 탈퇴하시겠습니까?</h1>
            <div class="schedule-secession-btn">
                <button class="secession-btn">탈퇴</button>
                <button class="cancel-btn">취소</button>
            </div>
        </div>
    </div>

    <div class="schedule-delete-modal">
        <div class="delete-modal-content">

        </div>
    </div>

</div>


<script>
    // Modal 관련 JavaScript
    const modal = document.getElementById("schedule-modal");
    const btn = document.getElementById("open_modal_btn");
    const span = document.querySelector('.close');
    const $writeBtn = document.getElementById("add_schedule_button");
    const $refuseBtn = document.querySelector(".refuse-btn");
    const $registerModal = document.getElementById("register-modal");


    btn.onclick = function() {
        modal.style.display = "flex";
    };

    $refuseBtn.onclick = function() {
        $registerModal.style.display = "none";
    };

    $writeBtn.onclick = function() {
        modal.style.display = "none";
    };

    span.onclick = function() {
        modal.style.display = "none";
    };



    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    };



</script>

<script type="module" src="/assets/js/schedules/list.js"></script>
<script type="module" src="/assets/js/schedules/detail.js"></script>
</body>
</html>
