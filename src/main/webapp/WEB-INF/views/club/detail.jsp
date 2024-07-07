<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>

    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/assets/css/club/clubDetail.css">


</head>
<body>
<%@ include file="../include/header.jsp" %>

<div id="wrap" class="form-container" data-cno="${club.clubNo}" data-account="${sessionScope.login.account}">
    <div class="header">
        <h1>${club.title}</h1>
        <span class="writer">작성자: ${club.userName}</span>
    </div>
    <div class="image-section">
        <c:choose>
            <c:when test="${not empty club.multipartFile}">
                <img src="${club.multipartFile}" alt="프로필 이미지" title="${club.multipartFile}">
            </c:when>
            <c:otherwise>
                <img class="image" src="/assets/img/club/image-add.png" alt="프로필 이미지"/>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="content-section">
        <p>${club.content}</p>
    </div>
    <div class="buttons">
        <c:if test="${club.userAuthStatus eq 'ADMIN'}">
            <form action="/club/applicants" method="get">
                <input type="hidden" name="clubNo" value="${club.clubNo}">
                <button class="admin-btn" type="submit">가입 신청자 확인</button>
            </form>
        </c:if>
        <button class="notice-btn" onclick="window.location.href='/clubNoticeBoard/list?clubNo=${club.clubNo}'">공지사항</button>
        <button class="free_board-btn" onclick="window.location.href='/freeBoard/list'">자유게시판</button>
        <button class="list-btn" onclick="window.location.href='/club/list'">목록</button>
        <button class="cancel-btn" id="cancelButton">탈퇴하기</button>
        <button class="member-btn" id="showMembersBtn">동호호 전체 인원 확인</button>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>

<%-- 모달 구조 --%>
<div id="memberModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>가입 신청자 목록</h2>
        <table>
            <thead>
            <tr>
                <th>이름</th>
                <th>온도</th>
                <th>권한</th>
                <th>가입시간</th>
                <c:if test="${club.userAuthStatus eq 'ADMIN'}">


                <th>추방</th>
                </c:if>
            </tr>
            </thead>
            <tbody id="modalApplicantList">
            <c:forEach items="${club.members}" var="member">
                <tr data-account="${member.account}">
                    <td>${member.userName}</td>
                    <td>${member.temperature}</td>
                    <td>${member.role}</td>
                    <td>${member.joinDate}</td>
                    <td>
                        <c:if test="${club.userAuthStatus eq 'ADMIN'}">
                            <button class="deny-btn" onclick="denyApplicant('${member.account}', ${club.clubNo})">추방</button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>



<script>

    // 모달 열기/닫기 로직
    const modal = document.getElementById("memberModal");
    const btn = document.getElementById("showMembersBtn");
    const span = document.getElementsByClassName("close")[0];

    btn.onclick = function() {
        modal.style.display = "block";
    }

    span.onclick = function() {
        modal.style.display = "none";
    }

    window.onclick = function(e) {
        if (e.target == modal) {
            modal.style.display = "none";
        }
    }


    document.getElementById('cancelButton').addEventListener('click', function() {
        const clubNo = document.getElementById('wrap').getAttribute('data-cno');
        if (confirm('정말로 탈퇴하시겠습니까?')) {
            fetch('/club/cancelled', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'clubNo=' + clubNo
            })
                .then(response => response.json())
                .then(data => {
                    alert(data.message);
                    if (data.message.includes('완료')) {
                        window.location.href = '/club/list';
                    }
                })
                .catch(error => console.error('Error:', error));
        }
    });

    function denyApplicant(account, clubNo) {
        if (confirm('해당 사용자를 추방하시겠습니까?')) {
            fetch(`/club/denyMember`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: new URLSearchParams({ account: account, clubNo: clubNo })
            })
                .then(response => response.text())
                .then(responseText => {
                    alert('추방 처리가 완료되었습니다.');  // 사용자에게 추방 완료를 알림
                    const element = document.querySelector(`#modalApplicantList tr[data-account='${account}']`);
                    if (element) {
                        element.remove();  // 추방된 사용자의 테이블 행을 제거
                    }
                    modal.style.display = "none";  // 모달 창을 닫음
                })
                .catch(error => {
                    alert('Error: ' + error.message);  // 에러 발생 시 사용자에게 알림
                });
        }
    }



</script>

</body>
</html>
