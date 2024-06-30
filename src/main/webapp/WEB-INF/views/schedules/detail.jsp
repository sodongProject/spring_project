<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

<h1>스케줄 상세보기</h1>
<div>제목${schedule.scheduleTitle}</div>
<div>스케줄 생성 시간 ${schedule.scheduleContent}</div>
<div>스케줄 조회수 ${schedule.scheduleViewCount}</div>
<div>스케줄 주최자 ${schedule.account}</div>
<div>스케줄 일자 ${schedule.scheduleAt}</div>
<div>스케줄 참여 인원 ${schedule.scheduleCount}</div>
<div>회비 ${schedule.participationPoints}</div>

</body>

</html>