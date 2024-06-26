<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<style>
  .recent {
    border: 1px solid red;
    text-align: center;
    color: red;
  }
</style>

<div class="recent">
  <h3>가장 최근에 만들어진 동호회</h3>
  <c:if test="${recentList.size() > 0}">
    <c:forEach var="c" items="${recentList}" varStatus="rank">
      <c:if test="${rank.index < 5}">
        <hr />
        <div class="recent-box">
          <!-- <c:if test="${rank.index == 0}">
            <div>순위: ${rank.index + 1}등</div>
          </c:if> -->
          <div>동호회 주최자: ${c.account}님</div>
          <div>동호회명: ${c.clubName}</div>
          <div>생성일: ${c.clubCreatedAt}</div>
        </div>
        <hr />
      </c:if>
    </c:forEach>
  </c:if>
  <c:if test="${empty recentList}">
    <div>최근에 만들어진 동호회가 없습니다.</div>
  </c:if>
</div>
