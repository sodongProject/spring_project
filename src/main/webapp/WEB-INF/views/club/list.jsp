<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>소동</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="/assets/css/club/main.css">
    <link rel="stylesheet" href="/assets/css/club/list.css">
    <link rel="stylesheet" href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div id="wrap">
    <div class="main-title-wrapper">
        <h1 class="main-title">
            <button class="homeBtn">소동 일으키기</button>
        </h1>
        <button class="add-btn">새 소동 만들기</button>
    </div>

    <div class="top-section">
        <!-- 검색창 영역 -->
        <div class="search">
            <form action="/club/list" method="get">
                <select class="form-select" name="type" id="search-type">
                    <option value="total" selected>전체</option>
                    <option value="club_name">제목</option>
                    <option value="club_description">내용</option>
                    <option value="account">작성자</option>
                    <option value="cd">제목+내용</option>
                </select>
                <input type="text" class="form-control" name="keyword" value="${s.keyword}">
                <button class="btn btn-primary" type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </form>
        </div>
    </div>

    <c:if test="${clubList.size() == 0}">
        <div class="empty">
            검색한 게시물이 존재하지 않습니다!
        </div>
    </c:if>

    <div class="card-container">
        <c:forEach var="b" items="${clubList}">
            <div class="card-wrapper">
                <div class="container" data-bno="${b.clubNo}" data-club-auth="${b.userAuthStatus}">
                    <div class="top-section">
                        <i class='bx bxs-moon'></i>
                        <c:if test="${login.auth == 'ADMIN' || clubLogin.account == b.account}">
                            <button class="del-btn" data-href="/club/delete?clubNo=${b.clubNo}">
                                <i class="fas fa-times"></i>
                            </button>
                        </c:if>
                    </div>
                    <div class="middle-section">
                        <img class="image" src="/assets/img/club/image-add.png" alt="profile image"/>
                        <div class="view">
                            <i class="fas fa-eye"></i>
                            <span class="view-count">${b.view}</span>
                        </div>
                        <h2>${b.shortTitle}</h2>
                        <p>${b.shortContent}</p>
                        <div class="social-media">
                            <i class='bx bxl-twitter'></i>
                            <i class='bx bxl-facebook'></i>
                            <i class='bx bxl-instagram'></i>
                        </div>
                        <div class="btnCenter">
                            <button class="btn">상세보기</button>
                            <c:if test="${b.userAuthStatus == 'PENDING'}">
                                <button class="btn join-btn" data-bno="${b.clubNo}" >가입하기</button>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- 게시글 목록 하단 영역 -->
<div class="bottom-section">
    <!-- 페이지 버튼 영역 -->
    <nav aria-label="Page navigation example">
        <ul class="pagination pagination-lg pagination-custom">
            <c:if test="${maker.pageInfo.pageNo != 1}">
                <li class="page-item">
                    <a class="page-link" href="/club/list?pageNo=1&type=${s.type}&keyword=${s.keyword}">&lt;&lt;</a>
                </li>
            </c:if>
            <c:if test="${maker.prev}">
                <li class="page-item">
                    <a class="page-link"
                       href="/club/list?pageNo=${maker.begin - 1}&type=${s.type}&keyword=${s.keyword}">prev</a>
                </li>
            </c:if>
            <c:forEach var="i" begin="${maker.begin}" end="${maker.end}">
                <li data-page-num="${i}" class="page-item">
                    <a class="page-link" href="/club/list?pageNo=${i}&type=${s.type}&keyword=${s.keyword}">${i}</a>
                </li>
            </c:forEach>
            <c:if test="${maker.next}">
                <li class="page-item">
                    <a class="page-link" href="/club/list?pageNo=${maker.end + 1}&type=${s.type}&keyword=${s.keyword}">next</a>
                </li>
            </c:if>
            <c:if test="${maker.pageInfo.pageNo != maker.finalPage}">
                <li class="page-item">
                    <a class="page-link"
                       href="/club/list?pageNo=${maker.finalPage}&type=${s.type}&keyword=${s.keyword}">&gt;&gt;</a>
                </li>
            </c:if>
        </ul>
    </nav>
</div>
<!-- end div.bottom-section -->

<!-- 가입 모달 창 -->
<div class="loginModal" id="loginModal">
    <div class="modal-content">
        <p>가입 하실건가요??</p>
        <div class="loginModal-buttons">
            <button class="loginConfirm" id="loginConfirmJoin"><i class="fas fa-check"></i> 예</button>
            <button class="loginCancel" id="loginCancelJoin"><i class="fas fa-times"></i> 아니오</button>
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
    const $homeBtn = document.querySelector('.homeBtn');
    const $cardContainer = document.querySelector('.card-container');
    const modal = document.getElementById('modal');
    const confirmDelete = document.getElementById('confirmDelete');
    const cancelDelete = document.getElementById('cancelDelete');
    const loginModal = document.getElementById('loginModal');
    const loginConfirmJoin = document.getElementById('loginConfirmJoin');
    const loginCancelJoin = document.getElementById('loginCancelJoin');
    let currentClubNo;

    $homeBtn.addEventListener('click', e => {
        window.location.href = '/club/list';
    });


    $cardContainer.addEventListener('click', e => {
        e.preventDefault();

        if (e.target.matches('.btn')  || e.target.closest('.bx') || e.target.closest('.image')) {
            return;
        }


        if (e.target.matches('.top-section .del-btn .fas')) {
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
        } else if (e.target.matches('.join-btn')) {
            currentClubNo = e.target.dataset.bno;
            loginModal.style.display = 'flex';
        } else {
            // 상세보기 버튼 클릭 시
            const clubAuth = e.target.closest('.container').dataset.clubAuth;
            const bno = e.target.closest('.container').dataset.bno;
            if (clubAuth === 'ADMIN' || clubAuth === 'MEMBER') {
                console.log(clubAuth);
                window.location.href = '/club/detail?bno=' + bno;
            }
        }
    });


    loginCancelJoin.onclick = () => {
        loginModal.style.display = 'none';
    };


    document.addEventListener('DOMContentLoaded', function() {

        // 모든 '가입하기' 버튼에 대한 이벤트 리스너 추가
        document.querySelectorAll('.join-btn').forEach(button => {
            button.addEventListener('click', function() {
                const clubNo = this.getAttribute('data-bno');
                // 모달을 보여주고, 예 버튼을 클릭했을 때 가입 요청을 보내도록 설정
                loginModal.style.display = 'flex';
                loginConfirmJoin.onclick = function() {
                    sendJoinRequest(clubNo);
                    loginModal.style.display = 'none';
                };
                loginCancelJoin.onclick = function() {
                    loginModal.style.display = 'none';
                };
            });
        });

        // 가입 요청 보내기
        function sendJoinRequest(clubNo) {
            console.log("Sending join request for clubNo:", clubNo);
            fetch('/club/join', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                },
                body: JSON.stringify({ clubNo: clubNo })
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                        loginModal.style.display = 'none';
                    }
                    return response.json();
                })
                .then(data => {
                    console.log("Response data:", data);
                    if (data.message) {
                        if (data.status === 'ok') { // Assuming 'status' field denotes success in the server response
                            updateApplicantsList(clubNo);
                        }
                    } else {
                        alert('오류 발생: 서버로부터 응답을 받지 못했습니다.');
                    }
                })
                .catch(error => {
                    console.error('Error sending join request:', error);
                    alert('Error: ' + error.message);
                });
        }

    });


    window.addEventListener('click', e => {
        if (e.target === modal || e.target === loginModal) {
            modal.style.display = 'none';
            loginModal.style.display = 'none';
        }
    });

    document.querySelector('.add-btn').onclick = e => {
        window.location.href = '/club/write';
    };

    function appendActivePage() {
        // 1. 현재 위치한 페이지 번호를 알아낸다.
        const currentPage = '${maker.pageInfo.pageNo}';
        console.log('현재페이지: ' + currentPage);

        // 2. 해당 페이지번호와 일치하는 li 태그를 탐색한다.
        const $li = document.querySelector(`.pagination li[data-page-num="\${currentPage}"]`);

        // 3. 해당 li 태그에 class = active 를  추가한다.
        $li?.classList.add('active');
    }

    // 기존 검색 조건 option 태그 고정하기
    function fixSearchOption() {
        const type = '${s.type}' || 'total';  // 기본값을 'total'로 설정
        const $option = document.querySelector(`#search-type option[value="${type}"]`);
        if ($option) {
            $option.setAttribute('selected', 'selected');
        }
    }

    appendActivePage();
    fixSearchOption();

    document.querySelectorAll('.container').forEach(container => {
        const moonIcon = container.querySelector('.bxs-moon');
        moonIcon.addEventListener('click', () => {
            moonIcon.classList.toggle('bxs-moon');
            if (moonIcon.classList.toggle('bxs-sun')) {
                container.classList.add('active');
            } else {
                container.classList.remove('active');
            }
        });
    });
</script>
</body>
</html>
