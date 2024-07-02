<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>공지사항 상세정보</title>
    <style>
    </style>
  </head>
  <body>
    <header>
      <h1>공지사항 상세정보</h1>
    </header>
    <main>
      <section class="notice-detail">
        <h2>${notice.mainNoticeTitle}</h2>
        <p class="date">${notice.date}</p>
        <p>${notice.content}</p>
      </section>
    </main>
    <footer>
      <p>Sodong Copyright © Sodong Corp. All Rights Reserved.</p>
    </footer>
  </body>
</html>
