<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>

    <link rel="stylesheet" href="/assets/css/club/description.css">
    <%@ include file="../include/static-head.jsp" %>

</head>
<body>
<%@ include file="../include/header.jsp" %>

<div id="wrap" class="form-container" data-cno="${club.clubNo}">
    <div class="header">
        <h1>${club.title}</h1>
        <span class="writer">작성자: ${club.userName}</span>
    </div>
    <div class="image-section">
        <c:choose>
            <c:when test="${not empty club.multipartFile}">
                <img src="${club.multipartFile}" alt="profile image" title="${club.multipartFile}">
            </c:when>
            <c:otherwise>
                <img class="image" src="/assets/img/club/image-add.png" alt="profile image"/>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="content-section">
        <p>${club.content}</p>
    </div>
    <div class="buttons">
        <button class="list-btn" onclick="window.location.href='/club/list'">목록</button>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>

</body>
</html>
