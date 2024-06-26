<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<style>
  .most-scheduled {
    border: 1px solid green;
    text-align: center;
    color: green;
  }
</style>

<div class="most-scheduled">
  <h3>1년 동안 스케줄이 가장 많은 동호회</h3>
  <c:if test="${scheduledList.size() > 0}">
    <c:forEach var="c" items="${scheduledList}" varStatus="rank">
      <c:if test="${rank.index < 5}">
        <hr />
        <div class="scheduled-box">
          <!-- <c:if test="${rank.index == 0}">
            <div>순위: ${rank.index + 1}등</div>
          </c:if> -->
          <div>동호회 주최자: ${c.account}님</div>
          <div>동호회명: ${c.clubName}</div>
          <div>스케줄 수: ${c.scheduleCount}개</div>
        </div>
        <hr />
      </c:if>
    </c:forEach>
  </c:if>
  <c:if test="${empty scheduledList}">
    <div>1년 동안 스케줄이 가장 많은 동호회가 없습니다.</div>
  </c:if>
</div>
