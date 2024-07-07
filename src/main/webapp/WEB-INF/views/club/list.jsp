<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>

    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/assets/css/club/clubList.css">

</head>
<body>
<%@ include file="../include/header.jsp" %>

<div id="wrap">
    <div class="main-title-wrapper">
        <h1 class="main-title">
            <button class="homeBtn">소동 일으키기</button>
        </h1>
        <button class="add-btn">새 소동 만들기</button>
    </div>

    <div class="top-section1">
        <!-- 검색창 영역 -->
        <div class="search">
            <form action="/club/list" method="get" id="search-form">
                <select class="form-select" name="type" id="search-type">
                    <option value="total" selected>전체</option>
                    <option value="club_name">제목</option>
                    <option value="club_description">내용</option>
                    <option value="account">작성자</option>
                    <option value="cd">제목+내용</option>
                </select>
                <input type="text" class="form-control" name="keyword">
                <button class="btn-primary" type="submit">
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
                                <i class="fas fa-times del-fa"></i>
                            </button>
                        </c:if>

                        <c:if test="${b.clubCompetition == true}">
                            <i class="fa-solid fa-fire competition"><p style="display: inline-block">대회</p></i>
                        </c:if>
                        <c:if test="${b.clubCompetition == false}">
                            <i class="fa-solid fa-fire notCompetition"></i>
                        </c:if>



                    </div>
                    <div class="middle-section">
                        <div class="profile-box">

                            <c:choose>
                                <c:when test="${not empty b.clubProfile}">
                                    <img src="${b.clubProfile}" alt="profile image" title="${b.clubProfile}">
                                </c:when>
                                <c:otherwise>
                                    <img class="image" src="/assets/img/club/image-add.png" alt="profile image"/>
                                </c:otherwise>
                            </c:choose>


                        </div>

                        <div class="view">
                                <%--                            <i class="fas fa-eye"></i>--%>
                            <i class="fa-solid fa-user"></i>
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
                            <button class="btn detail-btn" data-bno="${b.clubNo}">상세보기</button>
                            <c:if test="${sessionScope.login != null}">
                                <c:if test="${b.userAuthStatus == null}">
                                    <button class="btn join-btn" data-bno="${b.clubNo}">가입하기</button>
                                </c:if>
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

<%@ include file="../include/footer.jsp" %>

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

        if (e.target.matches('.detail-btn')) {
            const bno = e.target.closest('.container').dataset.bno;
            const clubAuth = e.target.closest('.container').dataset.clubAuth;
            if (clubAuth !== 'APPROVED'){
                window.location.href = '/club/description?bno=' + bno;
            } else {
                window.location.href = '/club/detail?bno=' + bno;
            }
        }

        if (e.target.matches('.btn') || e.target.closest('.bx') || e.target.closest('.image') || e.target.closest('img')) {
            return;
        }

        if (e.target.matches('.top-section .del-btn .fas')) {
            modal.style.display = 'flex';
            const $delBtn = e.target.closest('.del-btn');
            const clubNo = $delBtn.dataset.href.split('=')[1];
            confirmDelete.onclick = e => {
                deleteClub(clubNo);
                modal.style.display = 'none';
            };
            cancelDelete.onclick = e => {
                modal.style.display = 'none';
            };
        } else if (e.target.matches('.join-btn')) {
            currentClubNo = e.target.dataset.bno;
            loginModal.style.display = 'flex';
        } else {
            const clubAuth = e.target.closest('.container').dataset.clubAuth;
            const bno = e.target.closest('.container').dataset.bno;
            if (clubAuth === 'APPROVED') {
                window.location.href = '/club/detail?bno=' + bno;
            }
        }
    });

    loginCancelJoin.onclick = () => {
        loginModal.style.display = 'none';
    };

    function deleteClub(clubNo) {
        fetch('/club/delete?clubNo=' + clubNo, {
            method: 'GET',
            headers: {
                'Accept': 'application/json'
            }
        })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    alert(data.message);
                    location.reload();
                } else {
                    alert(data.message);
                }
            })
            .catch(error => {
                console.error('Error deleting club:', error);
                alert('삭제 중 오류가 발생했습니다.');
            });
    }

    document.addEventListener('DOMContentLoaded', function () {
        const joinButtons = document.querySelectorAll('.join-btn');
        joinButtons.forEach(button => {
            button.addEventListener('click', async function () {
                const clubNo = this.getAttribute('data-bno');
                loginModal.style.display = 'flex';
                loginConfirmJoin.onclick = async () => {
                    try {
                        await sendJoinRequest(clubNo);
                        alert('가입 요청이 성공적으로 처리되었습니다.');
                        loginModal.style.display = 'none';
                    } catch (error) {
                        console.error('Error sending join request:', error);
                        alert('Error: ' + error);
                        loginModal.style.display = 'none';
                    }
                };
                loginCancelJoin.onclick = () => {
                    loginModal.style.display = 'none';
                };
            });
        });
    });

    async function sendJoinRequest(clubNo) {
        try {
            const response = await fetch('/club/join', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                },
                body: JSON.stringify({ clubNo: clubNo })
            });

            const responseData = await response.json();
            if (!response.ok) {
                throw new Error(responseData.message || 'Failed to send join request');
            }

            return responseData; // 성공 응답 처리
        } catch (error) {
            console.error('Error sending join request:', error);
            throw error; // 에러를 던져 상위 캐치 블록에서 처리
        }
    }

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
        const currentPage = '${maker.pageInfo.pageNo}';
        const $li = document.querySelector(`.pagination li[data-page-num="${currentPage}"]`);
        $li?.classList.add('active');
    }

    function fixSearchOption() {
        const type = '${s.type}' || 'total';
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

    document.addEventListener('DOMContentLoaded', function () {
        let searchButton = document.querySelector('.btn-primary[type="submit"]');
        let keywordBtn = document.querySelector('.form-control[name="keyword"]');
        let searchForm = document.getElementById('search-form');

        keywordBtn.addEventListener('input', () => {
            if (keywordBtn.value.trim() === '') {
                searchButton.disabled = true;
            } else {
                searchButton.disabled = false;
            }
        });

        if (keywordBtn.value.trim() === '') {
            searchButton.disabled = true;
        }

        // 폼 제출 시 입력 필드 비우기
        searchForm.addEventListener('submit', (e) => {
            setTimeout(() => {
                keywordBtn.value = '';
            }, 0);
        });
    });


</script>
</body>
</html>
