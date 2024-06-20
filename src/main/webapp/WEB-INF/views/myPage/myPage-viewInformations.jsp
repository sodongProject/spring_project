<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="/assets/css/myPage.css" />
  </head>
  <body>
    <div class="myPage_wrap">
      <nav class="myPage_navi">
        <!-- <ul>
        <li>
          <a href="#"></a>
        </li>
      </ul> -->
      </nav>
      <form action="/myPage/view" name="" class="myPage_form">
        <h1>myPage - view informations</h1>

        <!--  -->
        <div class="main_profile">
          <div>
            <h2>회원 아이디</h2>
            <p>${dto.account}</p>
          </div>
          <div>
            <h2>이메일</h2>
            <p></p>
          </div>
          <div>
            <h2>연락처</h2>
            <p></p>
          </div>
          <div>
            <h2>주소</h2>
            <p></p>
          </div>
          <div>
            <h2>비밀번호</h2>
            <p></p>
          </div>
        </div>

        <!--  -->
        <div class="sub_profile">
          <div>
            <h2>회원 이름</h2>
            <p></p>
          </div>
          <div>
            <h2>성별</h2>
            <p></p>
          </div>
          <div>
            <h2>온도</h2>
            <p></p>
          </div>
          <div>
            <h2>보유 포인트</h2>
            <p></p>
          </div>
        </div>
      </form>
    </div>
  </body>
</html>
