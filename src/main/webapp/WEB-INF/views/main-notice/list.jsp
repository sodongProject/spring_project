<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Sodong</title>

    <style>
     /* 페이지 스타일 */
    /* pagination style */
    /* 기존 CSS 유지 */

.bottom-section {
    width: 80%;
    height: 150px;
    margin: 0 auto;
    padding: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.bottom-section nav {
    flex: 1;
    justify-content: center;
}

.pagination {
    display: flex;
    justify-content: center;
    align-items: center;
    list-style: none;
    padding: 0;
    margin: 0;
}

.pagination-custom a {
    color: #444 !important;
    text-decoration: none;
    padding: 15px 20px; /* 크기를 더 크게 조정 */
    margin: 0 10px; /* 간격을 넓게 조정 */
    background: #f1f1f1;
    border-radius: 10px; /* 둥근 모서리 */
    font-size: 2em; /* 폰트 크기를 크게 조정 */
    transition: background-color 0.3s, transform 0.3s;
}

.pagination-custom a:hover {
    background: #ddd !important;
    transform: scale(1.1); /* 호버 시 크기 확대 */
}

.pagination-custom li.active a,
.pagination-custom li a:focus {
    background: #333 !important;
    color: #fff !important;
    transform: scale(1.1); /* 활성화된 상태에서 크기 확대 */
}

body {
  font-family: Arial, sans-serif;
  display: flex;
}
.header {
  background-color: #f2cb05;
  color: white;
  padding: 10px;
}
.container {
  width: 80%;
  margin: 0 auto;
}
table {
  width: 100%;
  border-collapse: collapse;
}
table, th, td {
  border: 1px solid #dddddd;
}
th, td {
  padding: 8px;
  text-align: center;
}
th {
  background-color: #f2f2f2;
}
.pagination {
  text-align: center;
  margin-top: 10px;
}
/* 모달 스타일 */
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgb(0,0,0);
  background-color: rgba(0,0,0,0.4);
  padding-top: 60px;
}
.modal-content {
  background-color: #fefefe;
  margin: 5% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}
.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
.form-buttons {
  margin-top: 10px;
  text-align: right;
}

#detailMainNoticeContent {
    border: 1px solid #000;
}

.modal-content h2 {
    text-align: center;
}
    </style>
</head>
<body>
    <div class="header">
        <h1>Sodong</h1>
    </div>
    <div class="container">
        <h2>Sodong 공지사항</h2>
        <!-- 검색창 영역 -->
        <div class="search">
          <form action="/main-notice/list" method="get">

              <select class="form-select" name="type" id="search-type">
                  <option value="total" selected>전체</option>
                  <option value="club_name">제목</option>
                  <option value="club_description">내용</option>
                  <option value="cd">제목+내용</option>
              </select>

              <input type="text" class="form-control" name="keyword" value="${s.keyword}">

              <button class="btn btn-primary" type="submit">
                  <i class="fas fa-search"></i>
              </button>
          </form>
      </div>
        <table>
            <tr>
                <th>글 번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일자</th>
                <th>조회수</th>
            </tr>
            <c:if test="${list.size() > 0}">
                <c:forEach var="b" items="${list}">
                    <tr onclick="showDetails('${b.mainNoticeNo}', '${b.mainNoticeTitle}', '${b.date}', '${b.mainNoticeViewCount}', '${b.mainNoticeContent}')">
                        <td>${b.mainNoticeNo}</td>
                        <td>${b.mainNoticeTitle}</td>
                        <td>관리자</td>
                        <td>${b.date}</td>
                        <td id="viewCount${b.mainNoticeNo}">${b.mainNoticeViewCount}</td>
                    </tr>
                </c:forEach>
            </c:if>
        </table>
        <button class="write-btn">글 작성</button>

        <!-- 게시글 목록 하단 영역 -->
<div class="bottom-section">
    <!-- 페이지 버튼 영역 -->
    <nav aria-label="Page navigation example">
        <ul class="pagination pagination-lg pagination-custom">
            <c:if test="${maker.pageInfo.pageNo != 1}">
                <li class="page-item">
                    <a class="page-link" href="/main-notice/list?pageNo=1&type=${s.type}&keyword=${s.keyword}">&lt;&lt;</a>
                </li>
            </c:if>
            <c:if test="${maker.prev}">
                <li class="page-item">
                    <a class="page-link"
                       href="/main-notice/list?pageNo=${maker.begin - 1}&type=${s.type}&keyword=${s.keyword}">prev</a>
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
                    <a class="page-link"
                       href="/main-notice/list?pageNo=${maker.finalPage}&type=${s.type}&keyword=${s.keyword}">&gt;&gt;</a>
                </li>
            </c:if>
        </ul>
    </nav>
</div>
<!-- end div.bottom-section -->

    <!-- 상세 정보 모달 -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2><strong>제목:</strong> <span id="modalTitle"></span></h2>
            <p><strong>글 번호:</strong> <span id="detailMainNoticeNo"></span></p>
            <p><strong class="detail-content">내용:</strong> <textarea id="detailMainNoticeContent" style="width: 1000px; height: 400px; font-size: large;" readonly></textarea></p>
            <p><strong>작성일자:</strong> <span id="detailDate"></span></p>
            <p><strong>조회수:</strong> <span id="detailMainNoticeViewCount"></span></p>
            <div class="form-buttons">
              <c:if test="${login.auth == 'ADMIN'}">
                <button id="modifyButton" type="button" onclick="modifyNotice()">수정</button>
                <button id="deleteButton" type="button" onclick="deleteNotice()">삭제</button>
              </c:if>
            </div>
        </div>
    </div>

    <script>

      // 공지사항 작성 경로
      document.querySelector(".write-btn").onclick = (e) => {
        e.stopPropagation();
        window.location.href = "/main-notice/write";
      };

      function showDetails(mainNoticeNo, mainNoticeTitle, date, mainNoticeViewCount, mainNoticeContent) {
          var modal = document.getElementById("myModal");
          document.getElementById("modalTitle").innerText = mainNoticeTitle;
          document.getElementById("detailMainNoticeNo").innerText = mainNoticeNo;
          document.getElementById("detailMainNoticeContent").innerText = mainNoticeContent;
          document.getElementById("detailDate").innerText = date;
          document.getElementById("detailMainNoticeViewCount").innerText = parseInt(mainNoticeViewCount) + 1;
          modal.style.display = "block";

          // 서버로 조회수 증가 요청 보내기
          increaseViewCount(mainNoticeNo);
      }

      function closeModal() {
          var modal = document.getElementById("myModal");
          modal.style.display = "none";
      }

      function increaseViewCount(mainNoticeNo) {
          var xhr = new XMLHttpRequest();
          xhr.open("POST", "/update-view-count", true);
          xhr.setRequestHeader("Content-Type", "application/json");
          xhr.onreadystatechange = function () {
              if (xhr.readyState == 4 && xhr.status == 200) {
                  console.log("View count increased");
              }
          };
          xhr.send(JSON.stringify({ mainNoticeNo: mainNoticeNo }));
      }

      function appendActivePage() {
        // 1. 현재 위치한 페이지 번호를 알아낸다.
        const currentPage = '${maker.pageInfo.pageNo}';
        console.log('현재페이지: ' + currentPage);

        // 2. 해당 페이지번호와 일치하는 li 태그를 탐색한다.
        const $li = document.querySelector(`.pagination li[data-page-num="\${currentPage}"]`);

        // 3. 해당 li 태그에 class = active 를  추가한다.
        $li?.classList.add('active');
    }

    appendActivePage();

     // 공지사항 수정하기 (관리자만)
function modifyNotice() {
    // 모달 내의 제목과 내용을 수정할 수 있는 입력 필드로 변경
    var modalTitle = document.getElementById("modalTitle");
    var detailMainNoticeContent = document.getElementById("detailMainNoticeContent");
    var mainNoticeNo = document.getElementById("detailMainNoticeNo").innerText;

    // 기존 텍스트를 입력 필드로 변경
    var titleInput = document.createElement("input");
    titleInput.type = "text";
    titleInput.value = modalTitle.innerText;
    modalTitle.innerHTML = "";
    modalTitle.appendChild(titleInput);

    var contentTextarea = document.createElement("textarea");
    contentTextarea.value = detailMainNoticeContent.innerText;
    detailMainNoticeContent.innerHTML = "";
    detailMainNoticeContent.appendChild(contentTextarea);

    // 저장 버튼 추가
    var saveButton = document.createElement("button");
    saveButton.textContent = "저장";
    saveButton.onclick = function () {
        // 수정된 제목과 내용을 가져와 서버로 전송
        var modifiedTitle = titleInput.value;
        var modifiedContent = contentTextarea.value;

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/main-notice/update", true);
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    console.log("공지사항 수정 완료");
                    // 수정된 내용을 테이블에 반영
                    modalTitle.innerText = modifiedTitle; // 모달 내 제목 업데이트
                    detailMainNoticeContent.innerText = modifiedContent; // 모달 내 내용 업데이트

                    // 테이블에서도 반영
                    var tableRow = document.querySelector("tr[data-mainNoticeNo='" + mainNoticeNo + "']");
                    if (tableRow) {
                        tableRow.querySelector("td:nth-child(2)").innerText = modifiedTitle; // 제목 업데이트
                    } else {
                        console.error("테이블에서 해당 항목을 찾을 수 없습니다.");
                    }

                    closeModal(); // 모달 닫기
                } else {
                    console.error("공지사항 수정 실패");
                }
            }
        };
        var data = {
            mainNoticeNo: document.getElementById("detailMainNoticeNo").innerText,
            mainNoticeTitle: modifiedTitle,
            mainNoticeContent: modifiedContent
        };
        xhr.send(JSON.stringify(data));
    };

    // 기존 수정 버튼을 저장 버튼으로 교체
    var modalContent = document.querySelector(".modal-content");
    var modifyButton = document.getElementById("modifyButton");
    modalContent.removeChild(modifyButton);
    modalContent.appendChild(saveButton);
}
+
        // 공지사항 삭제하기 (관리자만)
        // 모달 내의 삭제 버튼 클릭 시 호출되는 함수
        function deleteNotice() {
            var mainNoticeNo = document.getElementById("detailMainNoticeNo").innerText;
            const modal = document.getElementById("myModal");
            modal.style.display = "none"; // 모달 닫기

            // 확인 버튼 클릭 시 처리
            document.getElementById("confirmDelete").onclick = function () {
                // 삭제 처리 로직
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "/main-notice/delete?mainNoticeNo=" + mainNoticeNo, true);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4) { // 요청 완료
                        if (xhr.status === 200) { // 성공적으로 처리됨
                            console.log("공지사항 삭제 완료");

                            // 테이블에서 해당 행 제거
                            var row = document.getElementById("row" + mainNoticeNo);
                            if (row) {
                                row.parentNode.removeChild(row);
                            } else {
                                console.log("해당 행이 없습니다.");
                            }
                        } else {
                            console.error("공지사항 삭제 실패");
                        }
                    }
                };
                xhr.send();
            };

            // 취소 버튼 클릭 시 처리
            document.getElementById("cancelDelete").onclick = function () {
                // 모달 닫기
                modal.style.display = "none";
            };

            // 모달 창 표시
            modal.style.display = "block";
        }

        deleteNotice();

  </script>
</body>
</html>