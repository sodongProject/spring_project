<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<style>
  /* .most-member {
    border: 2px solid blue;
    padding: 20px;
    margin-top: 20px;
    background-color: #f0f8ff;
  }

  .member-box {
    border: 1px solid blue;
    padding: 10px;
    margin-top: 10px;
    background-color: #f0fff0;
  } */
</style>

<div class="rank-list">

</div>
<div>
  <h3 class="rank-text">가장 많은 회원 수</h3>
  
</div>
<!-- <div class="most-member">
  <h2>가입자가 가장 많은 동호회</h2>
  <c:if test="${not empty memberList}">
    <c:forEach var="c" items="${memberList}" varStatus="rank">
      <div class="member-box">
        <div>주최자: ${c.account}님</div>
        <div>동호회명: ${c.clubName}</div>
        <div>회원 수: ${c.clubMemberMax}명</div>
      </div>
    </c:forEach>
  </c:if>
  <c:if test="${empty memberList}">
    <div>가입자가 가장 많은 동호회가 없습니다.</div>
  </c:if>
</div> -->
