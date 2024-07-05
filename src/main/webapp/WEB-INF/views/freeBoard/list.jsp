<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
      <%@ include file="../include/static-head.jsp" %>

      <link rel="stylesheet" href="/assets/css/freeBoard/list.css">
    </head>

    <body>
      <div id="wrap">
        <%@ include file="../include/header.jsp" %>

        <div class="main-title-wrapper">
          <!-- <h1 class="main-title">소동 게시판</h1> -->
          <button class="add-btn">New Post!</button>
        </div>

        <div class="card-container">

          <c:forEach var="b" items="${bList}">
            <div class="card-wrapper">
              <section class="card">

                <!-- sns 상단부분(계정, 시간) -->
                <div class="card-info">

                 <div class="card-account">
                  <h3 class="card-account">${b.account}</h3>
                </div>

                  <div class="time-view-wrapper">
                    <div class="time">
                      <i class="far fa-clock"></i>
                      ${b.date}
                   </div>
                  </div>
                </div>



                <!-- 카드 콘텐츠(이미지, 내용) -->
                <div class="card-content">
                  <img src="${b.boardImg}" class="card-boardImg">
                  <div class="snsContent">
                    ${b.content}
                  </div>
                </div>

              </section>


              <!-- 삭제버튼 -->
              <div class="card-btn">
                <button class="del-btn">
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