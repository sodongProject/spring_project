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
    <%@ include file="../include/header.jsp" %>

    <div class="myPage_wrap withdrawal">
      <%@ include file="../include/myPage-nav.jsp" %>
      <div class="myPage_inner">
        <h1>회원 탈퇴</h1>
        <div class="main_profile">
          <div>
            <h2 class="point">정말 탈퇴하시겠습니까?(복구 불가)</h2>
            <form action="/myPage/withdrawalCompl" method="get">
              <button type="submit" id="withdrawalBtn">회원 탈퇴</button>
            </form>
          </div>
        </div>
      </div>
    </div>
    <%@ include file="../include/footer.jsp" %>

  </body>
</html>
