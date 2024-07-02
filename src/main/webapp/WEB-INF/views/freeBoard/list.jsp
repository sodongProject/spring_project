<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>

      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">

      <!-- reset -->
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

      <!-- fontawesome css: https://fontawesome.com -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

      <link rel="stylesheet" href="/assets/css/main.css">
      <link rel="stylesheet" href="/assets/css/freeBoard/list.css">

    </head>

    <body>

      <div id="wrap">

        <div class="main-title-wrapper">
          <h1 class="main-title">소동 게시판</h1>
          <button class="add-btn">New Post!</button>
        </div>

        <div class="card-container">

          <c:forEach var="b" items="${bList}">
            <div class="card-wrapper">
              <section class="card" data-bno="${b.bno}">
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
                <button class="del-btn" data-href="/freeBoard/delete?bno=${b.bno}">
                  <i class="fas fa-times"></i>
                </button>
              </div>
            </div>
          </c:forEach>


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


    <script src="/assets/js/freeBoard/list.js"></script>

    </body>

    </html>