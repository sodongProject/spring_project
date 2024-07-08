<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <%@ include file="./include/static-head.jsp" %>
    <link rel="stylesheet" href="/assets/css/main.css" />
  </head>
  <body>
    <%@ include file="./include/header.jsp" %>

    <section id="sodongSection" class="sodong">
      <div class="text_wrap">
        <h2 class="title">서울에서 일어나는 <b>우리들의 작은 소동</b></h2>
        <p class="btn_wrap">
          <a href="/users/sign-up">회원 가입 하기</a>

          <a href="/club/list">동호회 생성하기</a>
        </p>
      </div>
      <p class="img"><img src="/assets/img/main/c-main-logo.png" alt=""></p>

    </section>
    <section id="commuSection" class="community">
      <p class="img"><img src="/assets/img/main/c-main.png" alt=""></p>

      <div class="text_wrap">
        <p class="small">community</p>
        <h2 class="title">믿을 수 있는<b>소동 이야기</b></h2>
        <p class="btn_wrap">
          <a href="/main-page/page">VIEW MORE</a>
        </p>
      </div>
    </section>
    <%@ include file="./include/footer.jsp" %>
  </body>
</html>
