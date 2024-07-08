<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/assets/css/clubNoticeBoard/clubNoticeList.css" />
</head>

<body>
<%@ include file="../include/header.jsp" %>

<div class="clubNoticeContainer">

    <div class="clubNoticeTop-section1">
        <h1>공지사항</h1>

        <c:if test="${userRole == 'ADMIN'}">
            <div class="new-notice-button">
                <a href="/clubNoticeBoard/write?clubNo=${clubNo}">새 공지사항 작성</a>
            </div>
        </c:if>
    </div>

    <c:forEach var="b" items="${CNBList}">
        <div class="notice" data-bno="${b.clubNoticeNo}">
            <div class="clubNoticeTop-section">
                <c:if test="${b.userAuthStatus == 'ADMIN'}">
                    <button class="clubNoticeDel-btn" data-href="/clubNoticeBoard/delete" data-clubNoticeNo="${b.clubNoticeNo}">
                        <i class="fas fa-times"></i>
                    </button>
                </c:if>
            </div>
            <div class="notice-header">
                <div class="notice-userName">작성자 : ${b.userName}</div>
                <div class="notice-title">${b.shortTitle}</div>
                <div class="notice-date">${b.date}</div>
            </div>
        </div>
    </c:forEach>
</div>

<%@ include file="../include/footer.jsp" %>

<!-- 모달창 -->
<div class="clubNoticeModal" id="clubNoticeModal">
    <div class="clubNoticeModal-content">
        <h2>삭제 확인</h2>
        <p>정말로 삭제할까요?</p>
        <div class="clubNoticeModal-buttons">
            <button id="clubNoticeConfirmDelete"><i class="fas fa-check"></i> 예</button>
            <button id="clubNoticeCancelDelete"><i class="fas fa-times"></i> 아니오</button>
        </div>
    </div>
</div>

<script>
    const $clubNoticeCardContainer = document.querySelector('.clubNoticeContainer');
    const clubNoticeModal = document.getElementById('clubNoticeModal');
    const clubNoticeConfirmDelete = document.getElementById('clubNoticeConfirmDelete');
    const clubNoticeCancelDelete = document.getElementById('clubNoticeCancelDelete');
    let deleteLocation = '';
    let deleteClubNoticeNo = '';

    $clubNoticeCardContainer.addEventListener('click', e => {
        if (e.target.closest('.clubNoticeDel-btn')) {
            e.preventDefault();
            clubNoticeModal.style.display = 'flex';
            deleteLocation = e.target.closest('.clubNoticeDel-btn').dataset.href;
            deleteClubNoticeNo = e.target.closest('.clubNoticeDel-btn').dataset.clubnoticeno;
        } else if (e.target.closest('.notice')) {
            const bno = e.target.closest('.notice').dataset.bno;
            window.location.href = '/clubNoticeBoard/detail?clubNoticeNo=' + bno;
        }
    });

    clubNoticeConfirmDelete.onclick = () => {
        fetch(deleteLocation, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams({
                clubNoticeNo: deleteClubNoticeNo
            })
        })
            .then(response => {
                if (response.ok) {
                    console.log('삭제 성공:', deleteClubNoticeNo);
                    document.querySelector(`.notice[data-bno="${deleteClubNoticeNo}"]`).remove();
                    clubNoticeModal.style.display = 'none';
                } else {
                    console.error('삭제 실패:', response.status, response.statusText);
                    alert('삭제에 실패했습니다.');
                    clubNoticeModal.style.display = 'none';
                }
            })
            .catch(error => {
                console.error('오류 발생:', error);
                clubNoticeModal.style.display = 'none';
            });
    };

    clubNoticeCancelDelete.onclick = () => {
        clubNoticeModal.style.display = 'none';
    };

    window.addEventListener('click', e => {
        if (e.target === clubNoticeModal) {
            clubNoticeModal.style.display = 'none';
        }
    });
</script>
</body>
</html>
