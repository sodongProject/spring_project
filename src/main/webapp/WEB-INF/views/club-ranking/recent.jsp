<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
  .recent {
    border: 2px solid red;
    padding: 20px;
    margin-top: 20px;
    background-color: #ffe5e5;
  }

  .recent-box {
    border: 1px solid red;
    padding: 10px;
    margin-top: 10px;
    background-color: #fff0f0;
  }
</style>

<div class="recent">
  <h2>가장 최근에 만들어진 동호회</h2>
  <c:if test="${not empty recentList}">
    <c:forEach var="c" items="${recentList}" varStatus="rank">
      <div class="recent-box">
        <div>주최자: ${c.account}님</div>
        <div>동호회명: ${c.clubName}</div>
        <div>생성일: ${c.date}</div>
      </div>
    </c:forEach>
  </c:if>
  <c:if test="${empty recentList}">
    <div>최근에 만들어진 동호회가 없습니다.</div>
  </c:if>
</div>
