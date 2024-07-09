<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>

    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/assets/css/club/clubDetail.css">

    <link rel="stylesheet" href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'>
    <link rel="stylesheet" href="/assets/css/schedules/schedules.css">
    <link rel='stylesheet'
          href='https://cdn-uicons.flaticon.com/2.4.2/uicons-solid-rounded/css/uicons-solid-rounded.css'>
    <link rel='stylesheet'
          href='https://cdn-uicons.flaticon.com/2.4.2/uicons-thin-straight/css/uicons-thin-straight.css'>
    <link rel='stylesheet'
          href='https://cdn-uicons.flaticon.com/2.4.2/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    <link rel='stylesheet'
          href='https://cdn-uicons.flaticon.com/2.4.2/uicons-solid-straight/css/uicons-solid-straight.css'>
    <link rel='stylesheet'
          href='https://cdn-uicons.flaticon.com/2.4.2/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    <link rel='stylesheet'
          href='https://cdn-uicons.flaticon.com/2.4.2/uicons-regular-straight/css/uicons-regular-straight.css'>
    <link rel='stylesheet'
          href='https://cdn-uicons.flaticon.com/2.4.2/uicons-regular-straight/css/uicons-regular-straight.css'>

    <link rel="stylesheet" href="/assets/css/clubNoticeBoard/clubNoticeList.css"/>

</head>
<body>
<%@ include file="../include/header.jsp" %>

<div id="clubDetailWrap" class="clubDetailForm-container" data-cno="${club.clubNo}"
     data-account="${sessionScope.login.account}">
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
    <div class="clubDetailContent-section">
        <p>${club.content}</p>
    </div>
    <div class="clubDetailButtons">
        <c:if test="${club.userAuthStatus eq 'ADMIN'}">
            <form action="/club/applicants" method="get">
                <input type="hidden" name="clubNo" value="${club.clubNo}">
                <button class="clubDetailAdmin-btn" type="submit">가입 신청자 확인</button>
            </form>
        </c:if>
        <%--        <button class="notice-btn" onclick="window.location.href='/clubNoticeBoard/list?clubNo=${club.clubNo}'">공지사항</button>--%>
        <button class="free_board-btn" onclick="window.location.href='/freeBoard/list?clubNo=${club.clubNo}'">자유게시판
        </button>
        <button class="cancel-btn" id="cancelButton">탈퇴하기</button>
        <button class="member-btn" id="showMembersBtn">동호호 전체 인원</button>
        <button class="list-btn" onclick="window.location.href='/club/list'">목록</button>

    </div>


    <div class="clubNoticeContainer">
        <div class="clubNoticeTop-section1">
            <h1>공지사항</h1>
            <div class="new-notice-button">
                <a href="/clubNoticeBoard/list?clubNo=${clubNo}">전체보기</a>
                <c:if test="${club.userAuthStatus eq 'ADMIN'}">
                    <a href="/clubNoticeBoard/write?clubNo=${clubNo}">새 공지사항 작성</a>
                </c:if>
            </div>
        </div>

        <c:forEach var="b" items="${CNBList}">
            <div class="notice" data-bno="${b.clubNoticeNo}">
                <div class="clubNoticeTop-section">
                    <c:if test="${b.userAuthStatus == 'ADMIN'}">
                        <button class="clubNoticeDel-btn" data-href="/clubNoticeBoard/delete"
                                data-clubNoticeNo="${b.clubNoticeNo}">
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


    <div id="schedule-section">
        <button id="open_modal_btn">새 스케쥴</button>

        <div id="schedule-modal" class="modal" data-clubNo="1">
            <div class="modal-content">
                <span class="close"><i class="fi fi-br-cross"></i></span>
                <form>
                    <div id="title"><h1>새 스케쥴</h1></div>
                    <div id="club_no">
                        <input type="number" name="clubNo" value="1" disabled hidden>
                    </div>
                    <div class="schedule_title">
                        <label>소모임 이름</label>
                        <input id="schedule_title" type="text" class="title" name="scheduleTitle" required>
                    </div>
                    <div class="schedule_content">
                        <label>내용</label>
                        <textarea id="schedule_content" class="content" name="scheduleContent" required></textarea>
                    </div>
                    <div class="schedule_at">
                        <label>모임 시간</label>
                        <input id="schedule_at" type="datetime-local" name="scheduleAt" value="${now}" min="${now}"
                               required>
                    </div>
                    <div class="participation_points">
                        <label>회비</label>
                        <input type="number" id="participation_points" name="participationPoints" required>
                    </div>
                    <button id="add_schedule_button" type="submit">등록</button>
                </form>
            </div>
        </div>

        <div id="wrap">
            <div class='page-item prev-btn'>
                <i class="fi fi-ts-angle-small-right page-link prev" data-pno="1"></i>
            </div>
            <div class="card-container">

            </div>
            <div class='page-item'>
                <i class="fi fi-ts-angle-small-right page-link next" data-end="1"></i>
            </div>
        </div>

        <div id="register-modal">
            <div class="register-modal-content">
                <h1 class="register-content">???에 참여하시겠습니까?</h1>
                <p class="participation_point">참가비 : ???</p>
                <div class="register-btn">
                    <button class="refuse-btn">취소</button>
                    <button class="accept-btn">참여</button>

                </div>
            </div>
        </div>

        <div id="detail-modal">
            <div class="detail-modal-content">

            </div>
        </div>

        <div id="register-list-modal">
            <div class="register-list-modal-content">
                <div class="application-user-info">
                    <div class="user-info">
                        <span class="user-name">신청인 : 유저 이름</span>
                        <span class="user-temperature">유저 온도 : 36.5</span>
                    </div>
                    <div class="register-list-btn">
                        <button class="accept-btn">수락</button>
                        <button class="refuse-btn">거절</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="schedule-member-modal">
            <div class="schedule-member-modal-content">
                <div class="member-list">
                    <div class="member-info">
                        <span class="user-name">이름 : ???</span>
                        <span class="user-temperature">유저 온도 : 36.5</span>
                    </div>
                    <div class="member-exile-btn">
                        <button class="exile-btn">추방</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="schedule-secession-modal">
            <div class="secession-modal-content">
                <h1 class="secession-content">???에 탈퇴하시겠습니까?</h1>
                <div class="schedule-secession-btn">
                    <button class="secession-btn">탈퇴</button>
                    <button class="cancel-btn">취소</button>
                </div>
            </div>
        </div>

        <div class="schedule-delete-modal">
            <div class="delete-modal-content">

            </div>
        </div>

        <div class="schedule-exit-modal">
            <div class="exit-modal-content">
                <h1 class="exit-content"> ??? 에서 탈퇴하시겠습니까?</h1>
                <div class="schedule-exit-btn">
                    <button class="exit-btn">탈퇴</button>
                    <button class="not-exit-btn">취소</button>
                </div>
            </div>
        </div>

    </div>
</div>

<%@ include file="../include/footer.jsp" %>

<%-- 모달 구조 --%>
<div id="clubDetailMemberModal" class="clubDetailModal">
    <div class="clubDetailModal-content">
        <span class="clubDetailClose">&times;</span>
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
                            <button class="deny-btn" onclick="denyApplicant('${member.account}', ${club.clubNo})">추방
                            </button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

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

    // 모달 열기/닫기 로직
    const clubDetailModal = document.getElementById("clubDetailMemberModal");
    const clubDetailBtn = document.getElementById("showMembersBtn");
    const clubDetailSpan = document.getElementsByClassName("clubDetailClose")[0];

    clubDetailBtn.onclick = function () {
        clubDetailModal.style.display = "block";
    }

    clubDetailSpan.onclick = function () {
        clubDetailModal.style.display = "none";
    }

    window.onclick = function (e) {
        if (e.target == clubDetailModal) {
            clubDetailModal.style.display = "none";
        }
    }


    document.getElementById('cancelButton').addEventListener('click', function () {
        const clubNo = document.getElementById('clubDetailWrap').getAttribute('data-cno');
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
                body: new URLSearchParams({account: account, clubNo: clubNo})
            })
                .then(response => response.text())
                .then(responseText => {
                    alert('추방 처리가 완료되었습니다.');  // 사용자에게 추방 완료를 알림
                    const element = document.querySelector(`#modalApplicantList tr[data-account='${account}']`);
                    if (element) {
                        element.remove();  // 추방된 사용자의 테이블 행을 제거
                    }
                    clubDetailModal.style.display = "none";  // 모달 창을 닫음
                })
                .catch(error => {
                    alert('Error: ' + error.message);  // 에러 발생 시 사용자에게 알림
                });
        }
    }

    // Modal 관련 JavaScript
    const modal = document.getElementById("schedule-modal");
    const btn = document.getElementById("open_modal_btn");
    const span = document.querySelector('.close');
    const $writeBtn = document.getElementById("add_schedule_button");
    const $refuseBtn = document.querySelector(".refuse-btn");
    const $registerModal = document.getElementById("register-modal");


    btn.onclick = function () {
        modal.style.display = "flex";
    };

    $refuseBtn.onclick = function () {
        $registerModal.style.display = "none";
    };

    $writeBtn.onclick = function () {
        modal.style.display = "none";
    };

    span.onclick = function () {
        modal.style.display = "none";
    };


    window.onclick = function (event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    };

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

<script type="module" src="/assets/js/schedules/list.js"></script>
<script type="module" src="/assets/js/schedules/detail.js"></script>

</body>
</html>
