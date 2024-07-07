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

<div class="container">

    <div class="top-section1">
        <h1>공지사항</h1>

        <c:if test="${userRole == 'ADMIN'}">
            <div class="new-notice-button">
                <a href="/clubNoticeBoard/write?clubNo=${clubNo}">새 공지사항 작성</a>
            </div>
        </c:if>
    </div>

    <c:forEach var="b" items="${CNBList}">
        <div class="notice" data-bno="${b.clubNoticeNo}">
            <div class="top-section">
                <c:if test="${b.userAuthStatus == 'ADMIN'}">
                    <button class="del-btn" data-href="/clubNoticeBoard/delete" data-clubNoticeNo="${b.clubNoticeNo}">
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
<div class="modal" id="modal">
    <div class="modal-content">
        <h2>삭제 확인</h2>
        <p>정말로 삭제할까요?</p>
        <div class="modal-buttons">
            <button class="confirm" id="confirmDelete"><i class="fas fa-check"></i> 예</button>
            <button class="cancel" id="cancelDelete"><i class="fas fa-times"></i> 아니오</button>
        </div>
    </div>
</div>

<script>
    const $cardContainer = document.querySelector('.container');
    const modal = document.getElementById('modal');
    const confirmDelete = document.getElementById('confirmDelete');
    const cancelDelete = document.getElementById('cancelDelete');
    let deleteLocation = '';
    let deleteClubNoticeNo = '';

    $cardContainer.addEventListener('click', e => {
        if (e.target.closest('.del-btn')) {
            e.preventDefault();
            modal.style.display = 'flex';
            deleteLocation = e.target.closest('.del-btn').dataset.href;
            deleteClubNoticeNo = e.target.closest('.del-btn').dataset.clubnoticeno;
        } else if (e.target.closest('.notice')) {
            const bno = e.target.closest('.notice').dataset.bno;
            window.location.href = '/clubNoticeBoard/detail?clubNoticeNo=' + bno;
        }
    });

    confirmDelete.onclick = () => {
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
                    modal.style.display = 'none';
                } else {
                    console.error('삭제 실패:', response.status, response.statusText);
                    alert('삭제에 실패했습니다.');
                    modal.style.display = 'none';
                }
            })
            .catch(error => {
                console.error('오류 발생:', error);
                modal.style.display = 'none';
            });
    };

    cancelDelete.onclick = () => {
        modal.style.display = 'none';
    };

    window.addEventListener('click', e => {
        if (e.target === modal) {
            modal.style.display = 'none';
        }
    });
</script>
</body>
</html>
