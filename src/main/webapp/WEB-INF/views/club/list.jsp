<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <link rel="stylesheet" href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'>


</head>
<body>
<div id="wrap">
    <div class="main-title-wrapper">
        <h1 class="main-title">
            <button class="homeBtn">클럽 만들기</button>
        </h1>
        <button class="add-btn">새 글 쓰기</button>
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
                <div class="container" data-bno="${b.clubNo}">
                    <div class="top-section">
                        <button class="del-btn" data-href="/club/delete?clubNo=${b.clubNo}">
                            <i class="fas fa-times"></i>
                        </button>
                        <i class='bx bxs-moon'></i>
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
                            <button class="btn join-btn" data-href="/club/joinClub?clubNo=${b.clubNo}">가입하기</button>
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
                    <a class="page-link"
                       href="/club/list?pageNo=1&type=${s.type}&keyword=${s.keyword}">&lt;&lt;</a>
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
                    <a class="page-link"
                       href="/club/list?pageNo=${maker.end + 1}&type=${s.type}&keyword=${s.keyword}">next</a>
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

<%--<!-- 모달 창 -->--%>
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
    const $homeBtn = document.querySelector('.homeBtn')
    const $cardContainer = document.querySelector('.card-container');
    const modal = document.getElementById('modal');
    const confirmDelete = document.getElementById('confirmDelete');
    const cancelDelete = document.getElementById('cancelDelete');

    $homeBtn.addEventListener('click', e => {
        window.location.href = '/club/list'
    });

    $cardContainer.addEventListener('click', e => {
        e.preventDefault()
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
        } else if (e.target.matches('.join-btn') || e.target.matches('.btn')
            || e.target.closest('[data-href]') || e.target.closest('.bx')|| e.target.closest('.image')) {
            // "가입하기", "상세보기" 버튼 또는 data-href 속성을 가진 요소 클릭 시 아무 동작도 하지 않음
        } else {
            const bno = e.target.closest('.container').dataset.bno;
            // 요청 보내기
            window.location.href = '/club/detail?bno=' + bno;
        }
    });


    const loginModal = document.getElementById('loginModal');
    const loginConfirmJoin = document.getElementById('loginConfirmDelete');
    const loginCancelJoin = document.getElementById('loginCancelDelete');

    $cardContainer.addEventListener('click', e => {
        if (e.target.matches('.btnCenter .join-btn')) {
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

    function appendActivePage() {

        // 1. 현재 위치한 페이지 번호를 알아낸다.
        //  -> 주소창에 묻어있는 페이지 파라미터 숫자를 읽거나
        //     서버에서 내려준 페이지번호를 읽는다.
        const currentPage = '${maker.pageInfo.pageNo}';
        console.log('현재페이지: ' + currentPage);

        // 2. 해당 페이지번호와 일치하는 li 태그를 탐색한다.
        const $li = document.querySelector(`.pagination li[data-page-num="\${currentPage}"]`);

        // 3. 해당 li 태그에 class = active 를  추가한다.

        // li? 는 if null 이 아니면 이라는 의미
        $li?.classList.add('active');

    }

    // 기존 검색 조건 option 태그 고정하기
    function fixSearchOption() {
        // 1. 방금 전에 어떤 조건을 검색했는지 값을 알아옴
        const type = '${s.type}' || 'total';  // 기본값을 'total'로 설정

        // 2. 해당 조건을 가진 option 태그를 검색
        const $option = document.querySelector(`#search-type option[value="${type}"]`);

        // 3. 해당 태그에 selected 속성 부여
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

