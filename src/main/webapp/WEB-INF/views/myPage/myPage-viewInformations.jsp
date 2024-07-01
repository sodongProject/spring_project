<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="../include/static-head.jsp" %>
    <link href="/assets/css/myPage/myPage.css" rel="stylesheet" />

  </head>
  <body>
    <div class="myPage_wrap view">
      <%@ include file="../include/myPage-nav.jsp" %>
      <div class="myPage_inner ">
        <form action="/myPage/view" name="" class="myPage_form">
          <h1>개인정보 조회 페이지</h1>
      <!--  -->
      <div class="sub_profile">
        <div>
          <h2>이름</h2>
          <p class="text">${dto.name}</p>
        </div>
        <div>
          <h2>성별</h2>
          <p class="text">
            <c:if test="${dto.gender == 'M'}"> 남성 </c:if>
            <c:if test="${dto.gender == 'F'}"> 여성 </c:if>
          </p>
        </div>
        <div>
          <h2>온도</h2>
          <p class="text">${dto.temperature}</p>
        </div>
        <div>
          <h2>보유 포인트</h2>
          <p class="text">${dto.userPoint}</p>
        </div>
      </div>
          <!--  -->
          <div class="main_profile">
            <div>
              <h2>아이디</h2>
              <p class="text">${dto.account}</p>
            </div>
            <div>
              <h2>이메일</h2>
              <p class="text">${dto.email}</p>
            </div>
            <div>
              <h2>연락처</h2>
              <p class="text">${dto.phoneNumber}</p>
            </div>
            <div>
              <h2>주소</h2>
              <p class="text">${dto.address}</p>
            </div>
            <!-- <div>
              <h2>비밀번호</h2>
              <input type="password" class="text" value="${dto.password}" disabled/>
            </div> -->
          </div>

    
        </form>
      </div>
    </div>
  </body>
</html>
