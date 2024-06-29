<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<style>
  .most-member {
    border: 1px solid blue;
    text-align: center;
    color: blue;
  }
</style>

<div class="most-member">
  <h3>가입자가 가장 많은 동호회</h3>
  <c:if test="${memberList.size() > 0}">
    <c:forEach var="c" items="${memberList}" varStatus="rank">
      <c:if test="${rank.index < 5}">
        <hr />
        <div class="member-box">
          <!-- <c:if test="${rank.index == 0}">
            <div>순위: ${rank.index + 1}등</div>
          </c:if> -->
          <div>동호회 주최자: ${c.account}님</div>
          <div>동호회명: ${c.clubName}</div>
          <div>회원 수: ${c.clubMemberMax}명</div>
        </div>
        <hr />
      </c:if>
    </c:forEach>
  </c:if>
  <c:if test="${empty memberList}">
    <div>가입자가 가장 많은 동호회가 없습니다.</div>
  </c:if>
</div>
