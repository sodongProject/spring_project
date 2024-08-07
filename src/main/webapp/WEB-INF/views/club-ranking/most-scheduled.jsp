<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


  <div class="most-scheduled">
    <h2>소모임이 가장 많은 동호회</h2>
    <c:if test="${not empty scheduledList}">
      <c:forEach var="c" items="${scheduledList}" varStatus="rank">
        <div class="scheduled-box">
          <div>주최자: ${c.account}님</div>
          <div>동호회명: ${c.clubName}</div>
          <div>소모임 수: ${c.scheduleCount}개</div>
        </div>
      </c:forEach>
    </c:if>
    <c:if test="${empty scheduledList}">
      <div>소모임이 가장 많은 동호회가 없습니다.</div>
    </c:if>
  </div>
