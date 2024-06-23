<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .most-scheduled {
        text-align: end;
        color: green;
    }
</style>

<div class="most-scheduled">
    <h3>1년 동안 스케줄이 가장 많은 동호회</h3>
    <c:if test="${scheduledList.size() > 0}">
        <c:forEach var="c" items="${scheduledList}">
            <div>${c.clubName}</div>
            <div>스케줄 수: ${c.scheduleCount}</div>
        </c:forEach>
    </c:if>
    <c:if test="${empty scheduledList}">
        <div>1년 동안 스케줄이 가장 많은 동호회가 없습니다.</div>
    </c:if>
</div>
