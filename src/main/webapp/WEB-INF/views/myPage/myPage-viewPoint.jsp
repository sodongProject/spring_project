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

    <div class="myPage_wrap">
      <%@ include file="../include/myPage-nav.jsp" %>
      <div class="myPage_inner">
        <h1>보유 포인트 조회</h1>
        <div class="main_profile">
          <div>
          <h2 class="point">보유 포인트: <b>${points}</b> 포인트</h2>
          </div>
          <div>
          <h2>포인트 충전 금액: </h2>

            <form action="/myPage/rechargePoint" method="post">
              <input class="text short" name="rePointsAmount" type="number" min="1" />
              <button type="submit">충전</button>
            </form>
          </div>
     
          <div>
          <h2>포인트 환전 금액: </h2>
            
            <form action="/myPage/exchangePoint" method="post">
              <input class="text short" name="exPointsAmount" type="number" min="1" />
              <button type="submit">환전</button>
            </form>
            <c:if test="${isPossible == false}">보유 금액을 초과하지 않는 금액을 입력해주세요.</c:if>
          </div>
        
        </div>
       
      </div>
    </div>
    <%@ include file="../include/footer.jsp" %>

  </body>
</html>
