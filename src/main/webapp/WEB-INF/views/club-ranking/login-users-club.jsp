<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
  .club-list {
    border: 1px solid orange;
    text-align: center;
    color: orange;
  }
</style>

</head>
<body>

  <div class="club-list">
    <h3>${account}님의 동호회 목록</h3>
    <c:if test="${clubList.size() > 0}">
      <c:forEach var="c" items="${clubList}">
          <hr />
          <div class="list-box">
            <div>동호회명: ${c.clubName}</div>
            <div>동호회 생성일: ${c.clubCreatedAt}</div>
            <div>회원 수: ${c.clubMemberMax}명</div>
          </div>
          <hr />
      </c:forEach>
    </c:if>
    <c:if test="${empty clubList}">
      <div>가입한 동호회가 없습니다.</div>
    </c:if>
  </div>

</body>
</html>