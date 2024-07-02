<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<link rel="stylesheet" href="/assets/css/schedules/scheduleDetail.css">
<script type="module" src="/assets/js/schedules/detail.js" defer></script>
<body>

<c:if test="${scheduleLoginUserInfo.userScheduleRole == 'ADMIN'}">
    <div class="register-list">
        <button>신청관리</button>
    </div>
</c:if>

<h1>${scheduleLoginUserInfo.userScheduleRole}</h1>
<h1 id="schedule_detail" data-sno="${schedule.scheduleNo}" data-cno="${schedule.clubNo}">스케줄 상세보기</h1>
<div>제목${schedule.scheduleTitle}</div>
<div>스케줄 생성 시간 ${schedule.scheduleContent}</div>
<div>스케줄 조회수 ${schedule.scheduleViewCount}</div>
<div>스케줄 주최자 ${schedule.account}</div>
<div>스케줄 일자 ${schedule.scheduleAt}</div>
<div>스케줄 참여 인원 ${schedule.scheduleCount}</div>
<div>회비 ${schedule.participationPoints}</div>

<div id="register-list-modal">
    <div class="register-modal-content">
        <div class="application-user-info">
            <div class="user-info">
                <span class="user-name">신청인 : 유저 이름</span>
                <span class="user-temperature">유저 온도 : 36.5</span>
            </div>
            <div class="register-btn">
                <button class="accept-btn">수락</button>
                <button class="refuse-btn">거절</button>
            </div>
        </div>
    </div>
</div>

</body>


</html>