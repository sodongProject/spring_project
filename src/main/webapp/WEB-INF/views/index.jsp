<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <h2>Welcome ${login.userName}</h2>

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
              </c:if>

              <c:if test="${login != null}">
                <li><a href="#">My Page</a></li>
                <li><a href="/users/sign-out">Sign Out</a></li>
              </c:if>
    </ul>


</body>
</html>
