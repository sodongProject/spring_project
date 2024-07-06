<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>가입 신청자 목록</title>
    <link rel="stylesheet" href="/assets/css/club/applicants.css">
</head>
<body>
<div class="container">
    <h1>가입 신청자 목록</h1>
    <div id="messages"></div>
    <table>
        <thead>
        <tr>
            <th>이름</th>
            <th>온도</th>
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
                <td>${applicant.status}</td>
                <td>
                    <c:if test="${applicant.status == 'WAITING'}">
                        <button class="approve-btn" onclick="approveApplicant('${applicant.account}', ${param.clubNo})">승인</button>
                    </c:if>
                </td>
                <td>
                    <c:if test="${applicant.status == 'WAITING'}">
                        <button class="deny-btn" onclick="denyApplicant('${applicant.account}', ${param.clubNo})">거절</button>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <button class="back-btn" onclick="window.location.href='/club/detail?bno=${param.clubNo}'">돌아가기</button>
</div>

<script>
    function approveApplicant(account, clubNo) {
        fetch(`/club/approve`, {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: new URLSearchParams({ account: account, clubNo: clubNo })
        })
            .then(response => response.text())
            .then(responseText => {
                document.getElementById("messages").innerHTML = '<div class="alert alert-success">' + responseText + '</div>';
                document.getElementById("applicant-" + account).remove();
            })
            .catch(error => {
                document.getElementById("messages").innerHTML = '<div class="alert alert-danger">' + error.message + '</div>';
            });
    }

    function denyApplicant(account, clubNo) {
        fetch(`/club/deny`, {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: new URLSearchParams({ account: account, clubNo: clubNo })
        })
            .then(response => response.text())
            .then(responseText => {
                document.getElementById("messages").innerHTML = '<div class="alert alert-success">' + responseText + '</div>';
                document.getElementById("applicant-" + account).remove();
            })
            .catch(error => {
                document.getElementById("messages").innerHTML = '<div class="alert alert-danger">' + error.message + '</div>';
            });
    }
</script>
</body>
</html>
