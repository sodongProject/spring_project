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
          <a href="#">회원 가입 하기</a>

          <a href="#">동호회 생성하기</a>
        </p>
      </div>
      <p class="img"><img src="/assets/img/main/c-main-logo.png" alt=""></p>

    </section>
    <section id="commuSection" class="community">
      <p class="img"><img src="/assets/img/main/c-phone.png" alt=""></p>

      <div class="text_wrap">
        <p class="small">community</p>
        <h2 class="title">믿을 수 있는<b>소동 이야기</b></h2>
        <p class="btn_wrap">
          <a href="#">CONTACT US</a>
        </p>
      </div>
    </section>
    <!-- <div class="profile-box">
      <img src="${login.profile}" alt="프로필이미지" />
    </div>

    <h2>Welcome ${login.userName}</h2>

    <br /><br /><br />
    <p>Account: ${login.account}</p>
    <p>Email: ${login.email}</p>
    <p>Phone: ${login.phoneNumber}</p>
    <p>Address: ${login.address}</p>
    <p>Auth: ${login.auth}</p>
    <p>Temperature: ${login.temperature}</p>

    <button onclick="saveReq()">글 작성</button>
    <a href="/index">글 작성 링크</a>

    <ul>
      <c:if test="${login == null}">
        <li><a href="/users/sign-up">Sign Up</a></li>
        <li><a href="/users/sign-in">Sign In</a></li>
        <li><a href="/club/list">Club Page</a></li>
      </c:if>

      <c:if test="${login != null}">
        <li><a href="#">My Page</a></li>
        <li><a href="/users/sign-out">Sign Out</a></li>
        <li><a href="/main-page/page">Home Page</a></li>
        <li><a href="/club/list">Club Page</a></li>
      </c:if>
    </ul> -->
  
    <%@ include file="./include/footer.jsp" %>
  
  </body>
</html>
