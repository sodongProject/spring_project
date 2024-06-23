<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .most-member {
        text-align: center;
        color: blue;
    }

</style>

<div class="most-member">
    <h3>가입자가 가장 많은 동호회</h3>
    <c:if test="${memberList.size() > 0}">
        <c:forEach var="c" items="${memberList}">
            <div>${c.clubName}</div>
            <div>회원 수: ${c.memberCount}</div>
        </c:forEach>
    </c:if>
    <c:if test="${empty memberList}">
        <div>가입자가 가장 많은 동호회가 없습니다.</div>
    </c:if>
</div>
