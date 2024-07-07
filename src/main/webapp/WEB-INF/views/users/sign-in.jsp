<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
   <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/assets/css/login/signIn.css">
</head>
<body>
    <%@ include file="../include/header.jsp" %>
    <div class="container">
        <!-- Heading -->
        <h1>로그인</h1>
        

  
        
        <!-- Form -->
        <form  action="/users/sign-in" name="sign-in" method="post" id="signInForm">

          <!-- account input -->
          <div class="first-input input__block first-input__block">
             <input type="text" name="account" id="signInId" class="input" maxlength="10" required="required" placeholder="Id"/>
          </div>

          <!-- password input -->
          <div class="input__block">
             <input type="password" size="17" maxlength="20"  placeholder="Password" class="input" id="signInPw" name="password" required="required"/>
          </div>
  <!-- auto login -->
  <label class="auto-label" for="auto-login">
    <!-- <span><i class="fas fa-sign-in-alt"></i> -->
      자동 로그인</span>
    <input type="checkbox" id="auto-login" name="autoLogin">
</label>
          <!-- sign in button -->
          <button type="submit" value="로그인" id="signIn-btn" class="signin__btn">
            로그인
          </button>

        
        <a class="signUpBtn" href="/users/sign-up">
          회원가입
        </a>

        </form>
 
      </div>
      


      <script src="/assets/js/login/signIn.js"></script>

</body>
</html>