<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet"  href="/assets/css/myPage.css" />
  </head>
  <body>
    <div class="myPage_wrap">
      <nav class="myPage_nav">
        <div class="menu-wrap">
          <h2 class="menu-tit">회원정보</h2>
          <ul class="menu-list">
            <li>
              <a href="#">기본정보조회</a>
              <a href="#">기본정보수정</a>
            </li>
          </ul>
        </div>
        <div class="menu-wrap">
          <h2 class="menu-tit">
            <a href="#">포인트</a>
          </h2>
        </div>
        <div class="menu-wrap">
          <h2 class="menu-tit">
            <a href="#">회원탈퇴</a>
          </h2>
        </div>
      </nav>
  
      <div class="myPage_inner">
        <h1>마이페이지</h1>
        <form action="/myPage/${ref}" method="post">
          <h1>비밀번호 확인 페이지</h1>
          <input type="password" name="inputValue" />
          <button type="submit">확인</button>
          <c:if test="${result == false}">비밀번호를 확인해주세요.</c:if>
        </form>ㄴ
      </div>
   
    </div>


    <!-- <span>${result}</span> -->
  </body>
</html>
