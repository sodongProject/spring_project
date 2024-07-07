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
        <h1>소동의 신규 및 업데이트 소식</h1>
        <c:if test="${login.auth == 'ADMIN'}">
          <button class="write-btn">글 작성</button>
        </c:if>
        <div class="search-bar">
          <input type="text" placeholder="제목, 내용" />
          <button>검색</button>
        </div>
        <!-- 공지사항 목록 -->
        <c:if test="${list.size() > 0}">
          <ul class="notice-list">
            <c:forEach var="b" items="${list}">
              <li
                class="notice-list-box"
                data-main-notice-no="${b.mainNoticeNo}"
              >
                <span class="mainNoticeTitle">${b.mainNoticeTitle}</span>
                <span class="date">
                  ${b.date}
                  <c:if test="${login.auth == 'ADMIN'}">
                    <div class="btn-box">
                      <button class="modify-btn">수정</button>
                      <button
                        class="del-btn"
                        data-href="/main-notice/delete?mainNoticeNo=${b.mainNoticeNo}"
                      >
                        삭제
                      </button>
                    </div>
                  </c:if>
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
              <input
                type="text"
                id="editTitle"
                name="mainNoticeTitle"
                required
              />
              <label for="editContent">내용</label>
              <textarea
                id="editContent"
                name="mainNoticeContent"
                rows="5"
                required
              ></textarea>
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
                  <a
                    class="page-link"
                    href="/main-notice/list?pageNo=1&type=${s.type}&keyword=${s.keyword}"
                    >&lt;&lt;</a
                  >
                </li>
              </c:if>
              <c:if test="${maker.prev}">
                <li class="page-item">
                  <a
                    class="page-link"
                    href="/main-notice/list?pageNo=${maker.begin - 1}&type=${s.type}&keyword=${s.keyword}"
                    >prev</a
                  >
                </li>
              </c:if>
              <c:forEach var="i" begin="${maker.begin}" end="${maker.end}">
                <li data-page-num="${i}" class="page-item">
                  <a
                    class="page-link"
                    href="/main-notice/list?pageNo=${i}&type=${s.type}&keyword=${s.keyword}"
                    >${i}</a
                  >
                </li>
              </c:forEach>
              <c:if test="${maker.next}">
                <li class="page-item">
                  <a
                    class="page-link"
                    href="/main-notice/list?pageNo=${maker.end + 1}&type=${s.type}&keyword=${s.keyword}"
                    >next</a
                  >
                </li>
              </c:if>
              <c:if test="${maker.pageInfo.pageNo != maker.finalPage}">
                <li class="page-item">
                  <a
                    class="page-link"
                    href="/main-notice/list?pageNo=${maker.finalPage}&type=${s.type}&keyword=${s.keyword}"
                    >&gt;&gt;</a
                  >
                </li>
              </c:if>
            </ul>
          </nav>
        </div>
      </section>
    </section>


    <script>
      const $board = document.querySelector(".notice-board");

      // 공지사항 작성 경로
      document.querySelector(".write-btn").onclick = (e) => {
        window.location.href = "/main-notice/write";
      };


      //================= 공지사항 검색버튼 스크립트 =================//
      const $searchInput = document.querySelector(".search-bar input");
      const $searchBtn = document.querySelector(".search-bar button");

      // 검색 버튼 클릭 시
      $searchBtn.addEventListener("click", () => {
        const searchText = $searchInput.value.trim().toLowerCase();

        // 모든 공지사항 리스트 가져오기
        const $noticeList = document.querySelectorAll(".notice-list-box");

        $noticeList.forEach(($li) => {
          const title = $li
            .querySelector(".mainNoticeTitle")
            .innerText.trim()
            .toLowerCase();
          const content = $li
            .querySelector(".mainNoticeContent")
            .innerText.trim()
            .toLowerCase();

          // 검색어가 제목 또는 내용에 포함되어 있으면 보이기
          if (title.includes(searchText) || content.includes(searchText)) {
            $li.style.display = "block";
          } else {
            $li.style.display = "none";
          }
        });
      });


      //================= 공지사항 삭제버튼 스크립트 (관리자 권한만) =================//
      const modal = document.getElementById("modal"); // 모달창 얻기
      const confirmDelete = document.getElementById("confirmDelete"); // 모달 삭제 확인버튼
      const cancelDelete = document.getElementById("cancelDelete"); // 모달 삭제 취소 버튼

      $board.addEventListener("click", (e) => {
        if (e.target.matches(".del-btn")) {
          e.stopPropagation(); // 이벤트 전파 중단
          console.log("삭제버튼 클릭");
          modal.style.display = "flex"; // 모달 창 띄움

          const $delBtn = e.target.closest(".del-btn");
          // 삭제 링크주소 얻기
          const deleteLocation = $delBtn.dataset.href;
          console.log(deleteLocation);

          // 확인 버튼 이벤트
          confirmDelete.onclick = (e) => {
            // 삭제 처리 로직
            window.location.href = deleteLocation;

            modal.style.display = "none"; // 모달 창 닫기
          };

          // 취소 버튼 이벤트
          cancelDelete.onclick = (e) => {
            modal.style.display = "none"; // 모달 창 닫기
          };
        } else if (e.target.matches(".modify-btn")) {
          e.stopPropagation(); // 이벤트 전파 중단
          console.log("수정버튼 클릭");

          const $li = e.target.closest("li.notice-list-box");
          // 수정할 공지사항 정보 가져오기
          const mainNoticeNo = $li.dataset.mainNoticeNo;
          const title = $li.querySelector(".mainNoticeTitle").innerText.trim();
          const content = $li
            .querySelector(".mainNoticeContent")
            .innerText.trim();

          // 폼에 데이터 채우기
          document.getElementById("editNoticeNo").value = mainNoticeNo;
          document.getElementById("editTitle").value = title;
          document.getElementById("editContent").value = content;

          // 모달 열기
          editModal.style.display = "flex";
        } else {
          // 삭제 및 수정 버튼 제외한 부분은 글 상세조회 요청
          const $li = e.target.closest("li.notice-list-box");
          if ($li) {
            const mainNoticeNo = $li.dataset.mainNoticeNo;
            // 요청 보내기
            window.location.href =
              "/main-notice/detail?mainNoticeNo=" + mainNoticeNo;
          }
        }
      });

      // 전역 이벤트로 모달창 닫기
      window.addEventListener("click", (e) => {
        if (e.target === modal) {
          modal.style.display = "none";
        } else if (e.target === editModal) {
          editModal.style.display = "none";
        }
      });

      
      //================= 공지사항 수정버튼 스크립트 (관리자 권한만) =================//
      const editModal = document.getElementById("editModal");
      const editForm = document.getElementById("editForm");
      const cancelEdit = document.getElementById("cancelEdit");

      $board.addEventListener("click", (e) => {
        const $li = e.target.closest("li.notice-list-box");

        if (!$li) return;

        if (e.target.matches(".modify-btn")) {
          console.log("수정버튼 클릭");

          // 수정할 공지사항 정보 가져오기
          const mainNoticeNo = $li.dataset.mainNoticeNo;
          const title = $li.querySelector(".mainNoticeTitle").innerText.trim();
          const content = $li
            .querySelector(".mainNoticeContent")
            .innerText.trim();

          // 폼에 데이터 채우기
          document.getElementById("editNoticeNo").value = mainNoticeNo;
          document.getElementById("editTitle").value = title;
          document.getElementById("editContent").value = content;

          // 모달 열기
          editModal.style.display = "flex";
        }
      });

      // 취소 버튼 클릭 시
      cancelEdit.onclick = (e) => {
        editModal.style.display = "none";
      };

      // 모달 영역 외부 클릭 시 모달 닫기
      // window.addEventListener("click", (e) => {
      //   if (e.target === editModal) {
      //     editModal.style.display = "none";
      //   }
      // });

      // 폼 submit 시 처리
      editForm.addEventListener("submit", (e) => {
        e.preventDefault();
        editForm.submit();
      });
    </script>
      <%@ include file="../include/footer.jsp" %>

  </body>
</html>
