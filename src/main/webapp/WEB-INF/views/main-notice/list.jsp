<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Sodong</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .header {
            background-color: #007bff;
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

        <!-- 페이지네이션 -->
        <div class="pagination">
          <c:if test="${pageMaker.prev}">
              <button onclick="goPage(`${pageMaker.begin - 1}`)">&lt;</button>
          </c:if>
          <c:forEach begin="${pageMaker.begin}" end="${pageMaker.end}" var="pageNum">
              <button onclick="goPage(`${pageNum}`)">${pageNum}</button>
          </c:forEach>
          <c:if test="${pageMaker.next}">
              <button onclick="goPage(`${pageMaker.end + 1}`)">&gt;</button>
          </c:if>
      </div>
    </div>

    <!-- 상세 정보 모달 -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2><strong>제목:</strong> <span id="modalTitle"></span></h2>
            <p><strong>글 번호:</strong> <span id="detailMainNoticeNo"></span></p>
            <p><strong>내용:</strong> <span id="detailMainNoticeContent"></span></p>
            <p><strong>작성일자:</strong> <span id="detailDate"></span></p>
            <p><strong>조회수:</strong> <span id="detailMainNoticeViewCount"></span></p>
            <div class="form-buttons">
                <button id="modifyButton" type="button" onclick="modifyNotice()">수정</button>
                <button id="deleteButton" type="button" onclick="deleteNotice()">삭제</button>
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

     // 공지사항 수정하기 (관리자만)
function modifyNotice() {
    // 모달 내의 제목과 내용을 수정할 수 있는 입력 필드로 변경
    var modalTitle = document.getElementById("modalTitle");
    var detailMainNoticeContent = document.getElementById("detailMainNoticeContent");

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

  </script>
</body>
</html>
