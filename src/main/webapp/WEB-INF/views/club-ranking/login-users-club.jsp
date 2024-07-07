<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>



<div class="club-list">
  <h2>${login.account}님이 가입한 동호회 목록</h2>
  <c:if test="${clubList.size() > 0}">
    <c:forEach var="c" items="${clubList}">
      <div class="list-box">
        <div>동호회명: ${c.clubName}</div>
        <div>생성일: ${c.date}</div>
        <div>회원 수: ${c.clubMemberMax}명</div>
      </div>
    </c:forEach>
  </c:if>
  <c:if test="${empty clubList}">
    <div>가입한 동호회가 없습니다.</div>
  </c:if>
</div>
