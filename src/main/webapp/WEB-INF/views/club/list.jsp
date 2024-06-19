<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>클럽 만들기</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="/assets/css/club/main.css">
    <link rel="stylesheet" href="/assets/css/club/list.css">
</head>
<body>
<div id="wrap">
    <div class="main-title-wrapper">
        <h1 class="main-title">클럽 만들기</h1>
        <button class="add-btn">새 글 쓰기</button>
    </div>

    <div class="card-container">
        <c:forEach var="b" items="${clubList}">
            <div class="card-wrapper">
                <section class="card" data-bno="${b.clubNo}">
                    <div class="card-title-wrapper">
                        <h2 class="card-title">${b.shortTitle}</h2>
                        <div class="time-view-wrapper">
                            <div class="time">
                                <i class="far fa-clock"></i>
                                    ${b.date}
                            </div>
                            <div class="view">
                                <i class="fas fa-eye"></i>
                                <span class="view-count">${b.view}</span>
                            </div>
                        </div>
                    </div>
                    <div class="card-content">
                            ${b.shortContent}
                    </div>
                </section>
                <div class="card-btn-group">
                    <button class="join-btn" data-href="/club/joinClub?clubNo=${b.clubNo}">가입하기</button>
                    <button class="del-btn deleteBtn" data-href="/club/delete?clubNo=${b.clubNo}">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
            </div>
        </c:forEach>
    </div>
</div>


<%-- 가입 모달 창 --%>
<div class="loginModal" id="loginModal">
    <div class="modal-content">
        <p>가입 하실건가요??</p>
        <div class="loginModal-buttons">
            <button class="loginConfirm" id="loginConfirmDelete"><i class="fas fa-check"></i> 예</button>
            <button class="loginCancel" id="loginCancelDelete"><i class="fas fa-times"></i> 아니오</button>
        </div>
    </div>
</div>

<!-- 모달 창 -->
<div class="modal" id="modal">
    <div class="modal-content">
        <p>정말로 삭제할까요?</p>
        <div class="modal-buttons">
            <button class="confirm" id="confirmDelete"><i class="fas fa-check"></i> 예</button>
            <button class="cancel" id="cancelDelete"><i class="fas fa-times"></i> 아니오</button>
        </div>
    </div>
</div>

<script>
    const $cardContainer = document.querySelector('.card-container');
    const modal = document.getElementById('modal');
    const confirmDelete = document.getElementById('confirmDelete');
    const cancelDelete = document.getElementById('cancelDelete');

    $cardContainer.addEventListener('click', e => {
        if (e.target.matches('.card-btn-group .del-btn .fas')) {
            modal.style.display = 'flex';
            const $delBtn = e.target.closest('.del-btn');
            const deleteLocation = $delBtn.dataset.href;
            confirmDelete.onclick = e => {
                window.location.href = deleteLocation;
                modal.style.display = 'none';
            };
            cancelDelete.onclick = e => {
                modal.style.display = 'none';
            };
        }else {
            const bno = e.target.closest('section.card').dataset.bno;
            // 요청 보내기
            window.location.href = '/club/detail?bno=' + bno;
        }
    });

    const loginModal = document.getElementById('loginModal');
    const loginConfirmJoin = document.getElementById('loginConfirmDelete');
    const loginCancelJoin = document.getElementById('loginCancelDelete');

    $cardContainer.addEventListener('click', e => {
        if (e.target.matches('.card-btn-group .join-btn')) {
            loginModal.style.display = 'flex'
            const $loginBtn = e.target.closest('.join-btn');
            const joinLocation = $loginBtn.dataset.href;
            loginConfirmJoin.onclick = () => {
                window.location.href = joinLocation;
                loginModal.style.display = 'none';
            };
            loginCancelJoin.onclick = () => {
                loginModal.style.display = 'none';
            };
        }
    })

    window.addEventListener('click', e => {
        if (e.target === modal || e.target === loginModal) {
            modal.style.display = 'none';
            loginModal.style.display = 'none';
        }
    });

    function removeDown(e) {
        if (!e.target.matches('.card-container *')) return;
        const $targetCard = e.target.closest('.card-wrapper');
        $targetCard?.removeAttribute('id', 'card-down');
    }

    function removeHover(e) {
        if (!e.target.matches('.card-container *')) return;
        const $targetCard = e.target.closest('.card');
        $targetCard?.classList.remove('card-hover');
        const $delBtn = e.target.closest('.card-wrapper')?.querySelector('.del-btn');
        $delBtn.style.opacity = '0';
    }

    $cardContainer.onmouseover = e => {
        if (!e.target.matches('.card-container *')) return;
        const $targetCard = e.target.closest('.card');
        $targetCard?.classList.add('card-hover');
        const $delBtn = e.target.closest('.card-wrapper')?.querySelector('.del-btn');
        $delBtn.style.opacity = '1';
    }

    $cardContainer.onmousedown = e => {
        if (e.target.matches('.card-container .card-btn-group *')) return;
        const $targetCard = e.target.closest('.card-wrapper');
        $targetCard?.setAttribute('id', 'card-down');
    };

    $cardContainer.onmouseup = removeDown;
    $cardContainer.addEventListener('mouseout', removeDown);
    $cardContainer.addEventListener('mouseout', removeHover);

    document.querySelector('.add-btn').onclick = e => {
        window.location.href = '/club/write';
    };

</script>
</body>
</html>
