<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../include/static-head.jsp" %>
    <%@ include file="../include/header.jsp" %>
    <link rel="stylesheet" href="/assets/css/mainNotice/list.css" />
</head>

<body>
    <section id="page">
        <section class="notice-board">
            <h1>Sodong 서비스의 신규 및 업데이트 소식을 알려드립니다!</h1>
            <c:if test="${login.auth == 'ADMIN'}">
                <button class="write-btn">글 작성</button>
            </c:if>
            <div class="search-bar">
                <input class="search-input" type="text" placeholder="제목, 내용" />
                <button class="search-btn">검색</button>
            </div>
            <!-- 공지사항 목록 -->
            <c:if test="${list.size() > 0}">
                <ul class="notice-list">
                    <c:forEach var="b" items="${list}">
                        <li class="notice-list-box" data-main-notice-no="${b.mainNoticeNo}">
                            <span class="mainNoticeTitle">${b.mainNoticeTitle}</span>
                            <span class="date">
                                ${b.date}
                                <div class="btn-box">
                                    <c:if test="${login.auth == 'ADMIN'}">
                                        <!-- <button class="modify-btn">수정</button> -->
                                        <button class="del-btn" data-href="/main-notice/delete?mainNoticeNo=${b.mainNoticeNo}">삭제</button>
                                    </c:if>
                                </div>
                            </span>
                        </li>
                    </c:forEach>
                </ul>
            </c:if>

            <!-- 공지사항 삭제 모달 창 -->
            <div class="modal" id="modal">
                <div class="modal-content">
                    <p>정말로 삭제할까요?</p>
                    <div class="modal-buttons">
                        <button class="confirm" id="confirmDelete">
                            <i class="fas fa-check"></i> 예
                        </button>
                        <button class="cancel" id="cancelDelete">
                            <i class="fas fa-times"></i> 아니오
                        </button>
                    </div>
                </div>
            </div>

            <!-- 공지사항 수정 모달 창 -->
            <div class="modal" id="editModal">
                <div class="modal-content">
                    <h3>공지사항 수정</h3>
                    <form id="editForm" method="post" action="/main-notice/update">
                        <input type="hidden" id="editNoticeNo" name="mainNoticeNo" />
                        <label for="editTitle">제목</label>
                        <input type="text" id="editTitle" name="mainNoticeTitle" required />
                        <label for="editContent">내용</label>
                        <textarea id="editContent" name="mainNoticeContent" rows="5" required></textarea>
                        <div class="modal-buttons">
                            <button type="submit" class="confirm">
                                <i class="fas fa-check"></i> 수정
                            </button>
                            <button type="button" class="cancel" id="cancelEdit">
                                <i class="fas fa-times"></i> 취소
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <!-- 페이지 버튼 영역 -->
            <div class="bottom-section">
                <nav aria-label="Page navigation example">
                    <ul class="pagination pagination-lg pagination-custom">
                        <c:if test="${maker.pageInfo.pageNo != 1}">
                            <li class="page-item">
                                <a class="page-link" href="/main-notice/list?pageNo=1&type=${s.type}&keyword=${s.keyword}">&lt;&lt;</a>
                            </li>
                        </c:if>
                        <c:if test="${maker.prev}">
                            <li class="page-item">
                                <a class="page-link" href="/main-notice/list?pageNo=${maker.begin - 1}&type=${s.type}&keyword=${s.keyword}">prev</a>
                            </li>
                        </c:if>
                        <c:forEach var="i" begin="${maker.begin}" end="${maker.end}">
                            <li data-page-num="${i}" class="page-item">
                                <a class="page-link" href="/main-notice/list?pageNo=${i}&type=${s.type}&keyword=${s.keyword}">${i}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${maker.next}">
                            <li class="page-item">
                                <a class="page-link" href="/main-notice/list?pageNo=${maker.end + 1}&type=${s.type}&keyword=${s.keyword}">next</a>
                            </li>
                        </c:if>
                        <c:if test="${maker.pageInfo.pageNo != maker.finalPage}">
                            <li class="page-item">
                                <a class="page-link" href="/main-notice/list?pageNo=${maker.finalPage}&type=${s.type}&keyword=${s.keyword}">&gt;&gt;</a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </section>
    </section>

    <script>
        const $board = document.querySelector(".notice-board");

        // 권한 정보를 JavaScript 변수로 전달
        const userAuth = "${login.auth}";

        // 공지사항 작성 경로
        document.querySelector(".write-btn").onclick = (e) => {
            window.location.href = "/main-notice/write";
        };

        // 공지사항 검색버튼 스크립트
        const $searchInput = document.querySelector(".search-input");
        const $searchBtn = document.querySelector(".search-btn");

        $searchBtn.addEventListener("click", () => {
            const searchText = $searchInput.value.trim().toLowerCase();
            const $noticeList = document.querySelectorAll(".notice-list-box");

            $noticeList.forEach(($li) => {
                const title = $li.querySelector(".mainNoticeTitle").innerText.trim().toLowerCase();
                const content = $li.querySelector(".mainNoticeContent")?.innerText.trim().toLowerCase() || '';

                if (title.includes(searchText) || content.includes(searchText)) {
                    $li.style.display = "block";
                } else {
                    $li.style.display = "none";
                }
            });
        });

        // 공지사항 삭제 및 수정 버튼 스크립트
        const modal = document.getElementById("modal");
        const confirmDelete = document.getElementById("confirmDelete");
        const cancelDelete = document.getElementById("cancelDelete");
        const editModal = document.getElementById("editModal");
        const editForm = document.getElementById("editForm");
        const cancelEdit = document.getElementById("cancelEdit");

        $board.addEventListener("click", (e) => {
            const $li = e.target.closest("li.notice-list-box");
            if (!$li) return;

            if (e.target.matches(".del-btn")) {
                if (userAuth === 'ADMIN') {
                    e.stopPropagation();
                    modal.style.display = "flex";
                    const deleteLocation = e.target.dataset.href;

                    confirmDelete.onclick = () => {
                        window.location.href = deleteLocation;
                        modal.style.display = "none";
                    };

                    cancelDelete.onclick = () => {
                        modal.style.display = "none";
                    };
                } else {
                    alert('권한이 없습니다.');
                }
            } else if (e.target.matches(".modify-btn")) {
                if (userAuth === 'ADMIN') {
                    e.stopPropagation();
                    const mainNoticeNo = $li.dataset.mainNoticeNo;
                    const title = $li.querySelector(".mainNoticeTitle").innerText.trim();
                    const content = $li.querySelector(".mainNoticeContent")?.innerText.trim() || '';

                    document.getElementById("editNoticeNo").value = mainNoticeNo;
                    document.getElementById("editTitle").value = title;
                    document.getElementById("editContent").value = content;

                    editModal.style.display = "flex";
                } else {
                    alert('권한이 없습니다.');
                }
            } else {
                const mainNoticeNo = $li.dataset.mainNoticeNo;
                window.location.href = "/main-notice/detail?mainNoticeNo=" + mainNoticeNo;
            }
        });

        // 모달 영역 외부 클릭 시 모달 닫기
        window.addEventListener("click", (e) => {
            if (e.target === modal) {
                modal.style.display = "none";
            } else if (e.target === editModal) {
                editModal.style.display = "none";
            }
        });

        cancelEdit.onclick = () => {
            editModal.style.display = "none";
        };

        editForm.addEventListener("submit", (e) => {
            e.preventDefault();
            editForm.submit();
        });
    </script>
      <%@ include file="../include/footer.jsp" %>
</body>
</html>
