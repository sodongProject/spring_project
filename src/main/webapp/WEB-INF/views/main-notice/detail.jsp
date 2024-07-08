<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/assets/css/mainNotice/detail.css" />
  </head>
  
  <body>
    <section id="page">
    <%@ include file="../include/header.jsp" %>
    <main>
      <section class="notice-detail" data-main-notice-no="${b.mainNoticeNo}">
        <h1>${b.mainNoticeTitle}</h1>
        <p class="date">${b.date}</p>
        <hr>
        <p class="content">${b.mainNoticeContent}</p>
      </section>
    </main>
    <%@ include file="../include/footer.jsp" %>
  </section>
  </body>
  </html>
