<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <form action="/myPage/${ref}" method="post">
    
    <h1>
      비밀번호 확인 페이지
    </h1>
    <input type="password" name="inputValue"/>
    <button type="submit">확인</button>
    <c:if test="${result == false}">비밀번호를 확인해주세요.</c:if>


  </form>

  
  <!-- <span>${result}</span> -->
  
</body>
</html>