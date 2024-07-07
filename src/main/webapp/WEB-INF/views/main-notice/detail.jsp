<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <%@ include file="../include/static-head.jsp" %>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>공지사항 상세정보</title>
    <style>
    

      /* header {
        background-color: #f2cb05;
        padding: 20px;
        color: white;
        text-align: center;
      } */

      main {
        width: 1200px;
        margin: 0 auto;
        margin-top: 200px;
        /* max-width: 800px; */
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      }

      .notice-detail {
          padding: 20px;
          background-color: white;
          overflow: auto; /* 내용이 넘칠 경우 스크롤바 표시 */
          display: inline-block; /* 내용의 크기에 따라 자동으로 크기가 조정되도록 설정 */
          max-width: 100%; /* 최대 너비 설정 */
          box-sizing: border-box; /* padding과 border를 요소의 크기에 포함시킴 */
          word-wrap: break-word; /* 글자 줄바꿈 설정 */
        }

      .notice-detail h2 {
        margin-top: 0;
      }

      .notice-detail .date {
        color: #999;
        margin-bottom: 20px;
      }

      footer {
        background-color: #f8f8f8;
        padding: 20px;
        text-align: center;
        color: #999;
        border-top: 1px solid #eee;
        margin-top: 20px;
      }

      /* .content { */
      /* overflow: visible; */
      /* text-overflow: ellipsis; */
      /* } */
    </style>
  </head>
  <body>
    <%@ include file="../include/header.jsp" %>
    <main>
      <section class="notice-detail" data-main-notice-no="${b.mainNoticeNo}">
        <h2>${b.mainNoticeTitle}</h2>
        <p class="date">${b.date}</p>
        <p class="content">${b.mainNoticeContent}</p>
      </section>
    </main>
    <footer>
      <p>Sodong Copyright © Sodong Corp. All Rights Reserved.</p>
    </footer>
  </body>
</html>
