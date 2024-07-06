<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동호회 상세정보</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@400;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/reset-css/5.0.1/reset.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <link rel="stylesheet" href="/assets/css/club/clubDetail.css">
</head>
<body>
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
        <c:if test="${club.userAuthStatus == 'ADMIN'}">
            <form action="/club/applicants" method="get" style="display: inline;">
                <input type="hidden" name="clubNo" value="${club.clubNo}">
                <button class="admin-btn" type="submit">가입 신청자 확인</button>
            </form>
        </c:if>
        <button class="notice-btn" onclick="window.location.href='/clubNoticeBoard/list?clubNo=${club.clubNo}'">공지사항</button>
        <button class="free_board-btn" onclick="window.location.href='/club/freeBoard'">자유게시판</button>
        <button class="list-btn" onclick="window.location.href='/club/list'">목록</button>
        <button class="cancel-btn" id="cancelButton">탈퇴하기</button>
    </div>
</div>

<script>
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
</script>

</body>
</html>
