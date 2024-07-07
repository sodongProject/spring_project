<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/assets/css/clubNoticeBoard/clubNoticeDetail.css" />
</head>

<body>
<%@ include file="../include/header.jsp" %>

<div class="notice-container">
    <div class="header-section">
        <div class="value">${club.title}</div>
        <h2>${club.regDateTime}</h2>
    </div>
    <div class="content-section">
        <div class="notice-item">
            <div id="content" class="value">${club.content}</div>
        </div>
    </div>
</div>
<div class="back-link" onclick="javascript:history.back()">목록으로 돌아가기</div>

<%@ include file="../include/footer.jsp" %>

</body>
</html>
