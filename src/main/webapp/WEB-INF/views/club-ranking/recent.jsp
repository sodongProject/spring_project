<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .recent {
        text-align: right;
        color: red;
    }

</style>

<div class="recent">
    <h3>가장 최근에 만들어진 동호회</h3>
    <c:if test="${recentList.size() > 0}">
        <c:forEach var="c" items="${recentList}">
            <div>${c.clubName}</div>
            <div>생성일: ${c.createdAt}</div>
        </c:forEach>
    </c:if>
    <c:if test="${empty recentList}">
        <div>최근에 만들어진 동호회가 없습니다.</div>
    </c:if>
</div>
