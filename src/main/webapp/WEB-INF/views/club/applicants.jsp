<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>가입 신청자 목록</title>
    <link rel="stylesheet" href="/assets/css/club/main.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="container">
    <h1>가입 신청자 목록</h1>
    <div id="messages"></div>
    <table>
        <thead>
        <tr>
            <th>이름</th>
            <th>체온</th>
            <th>상태</th>
            <th>승인</th>
            <th>거절</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="applicant" items="${applicants}">
            <tr id="applicant-${applicant.account}">
                <td>${applicant.userName}</td>
                <td>${applicant.temperature}</td>
                <td>${applicant.role}</td>
                <td>
                    <c:if test="${applicant.role == 'PENDING'}">
                        <button onclick="approveApplicant('${applicant.account}', ${param.clubNo})">승인</button>
                    </c:if>
                </td>
                <td>
                    <c:if test="${applicant.role == 'PENDING'}">
                        <button onclick="denyApplicant('${applicant.account}', ${param.clubNo})">거절</button>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <button onclick="window.location.href='/club/detail?bno=${param.clubNo}'">돌아가기</button>
</div>

<script>
    function approveApplicant(account, clubNo) {
        $.post("/club/approve", { account: account, clubNo: clubNo })
            .done(function(response) {
                $("#messages").html('<div class="alert alert-success">' + response + '</div>');
                $("#applicant-" + account).remove();
            })
            .fail(function(xhr, status, error) {
                $("#messages").html('<div class="alert alert-danger">' + xhr.responseText + '</div>');
            });
    }

    function denyApplicant(account, clubNo) {
        $.post("/club/deny", { account: account, clubNo: clubNo })
            .done(function(response) {
                $("#messages").html('<div class="alert alert-success">' + response + '</div>');
                $("#applicant-" + account).remove();
            })
            .fail(function(xhr, status, error) {
                $("#messages").html('<div class="alert alert-danger">' + xhr.responseText + '</div>');
            });
    }
</script>
</body>
</html>
