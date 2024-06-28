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
    <div class="myPage_wrap">
    <%@ include file="../include/myPage-nav.jsp" %>
     
  
      <div class="myPage_inner">
        <h1>비밀번호 확인</h1>
        <div class="myPage_dep">
          <h2>본인확인을 위해 비밀번호를 입력해주세요.</h2>
          <form action="/myPage/${ref}" method="post">
            <input type="password" name="inputValue" id="confirmPwInput"/>
            <button type="submit" id="confirmPwBtn">확인</button>
            <c:if test="${result == false}">비밀번호를 확인해주세요.</c:if>
          </form>
        </div>
       
      </div>
   
    </div>


    <!-- <span>${result}</span> -->
  </body>
</html>
