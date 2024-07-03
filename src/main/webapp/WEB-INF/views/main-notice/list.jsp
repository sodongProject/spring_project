<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>소동 공지사항</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f8f8f8;
        margin: 0;
        padding: 0;
      }

      header {
        background-color: #f2cb05;
        padding: 20px;
        color: white;
        text-align: center;
      }

      main {
        padding: 20px;
      }

      .notice-board {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      }

      .notice-board h2 {
        margin-top: 0;
      }

      .search-bar {
        display: flex;
        margin-bottom: 20px;
        border-radius: 20px;
      }

      .search-bar input {
        flex: 1;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px 0 0 4px;
        font-size: 16px;
      }

      .search-bar button {
        padding: 10px 20px;
        border: none;
        background-color: #f2cb05;
        color: white;
        font-size: 16px;
        cursor: pointer;
        border-radius: 0 4px 4px 0;
      }

      .notice-list {
        list-style: none;
        padding: 0;
      }

      .notice-list li {
        padding: 10px;
        border-bottom: 1px solid #eee;
        display: flex;
        justify-content: space-between;
      }

      .notice-list .date {
        color: #999;
      }

      .pagination {
        display: flex;
        justify-content: center;
        margin-top: 20px;
      }

      .pagination ul {
        list-style: none;
        padding: 0;
        display: flex;
      }

      .pagination a {
        padding: 10px 15px;
        margin: 0 5px;
        text-decoration: none;
        color: #333;
        border: 1px solid #ddd;
        border-radius: 4px;
      }

      .pagination a:hover,
      .notice-list li:hover {
        background-color: #f0f0f0;
      }

      footer {
        background-color: #f8f8f8;
        padding: 20px;
        text-align: center;
        color: #999;
        border-top: 1px solid #eee;
        margin-top: 20px;
      }
    </style>
  </head>
  <body>
    <header>
      <h1>Sodong 공지사항</h1>
    </header>
    <main>
      <section class="notice-board">
        <h2>Sodong 서비스의 신규 및 업데이트 소식을 알려드립니다!</h2>
        <div class="search-bar">
          <input type="text" placeholder="제목, 내용" />
          <button>검색</button>
        </div>
        <!-- 공지사항 목록 -->
        <c:if test="${list.size() > 0}">
          <ul class="notice-list">
            <c:forEach var="b" items="${list}">
              <li class="notice-list-box">
                ${b.mainNoticeTitle}
                <span class="date"
                  >${b.date}
                  <c:if test="${login.auth == 'ADMIN'}">
                    <div class="btn-box">
                      <button class="modify-btn">수정</button>
                      <button class="delete-btn">삭제</button>
                    </div>
                  </c:if>
                </span>
              </li>
            </c:forEach>
          </ul>
        </c:if>

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
    </main>
    <footer>
      <p>Sodong Copyright © Sodong Corp. All Rights Reserved.</p>
    </footer>
  </body>
</html>
