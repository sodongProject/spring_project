<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/assets/css/login/signUp.css">
</head>
<body>
    <%@ include file="../include/header.jsp" %>
    <div class="container">
        <!-- Heading -->
        <h1>SIGN UP</h1>

        <!-- Links -->
        <ul class="links">
          <li>
            <a href="/users/sign-in" id="signin">SIGN IN</a>
          </li>
          <li>
            <a href="/users/sign-up" id="signup">SIGN UP</a>
          </li>
        </ul>
        

        <!-- Form -->
        <form action="/users/sign-up" name="signup" id="signUpForm" method="post" enctype="multipart/form-data">

         <!-- Profile -->
            <div class="profile">
                <div class="thumbnail-box">
                  <img src="/assets/img/image-add.png" alt="프로필 썸네일">
                </div>

                <label>프로필 이미지 추가</label>

                <input
                        type="file"
                        id="profile-img"
                        accept="image/*"
                        style="display: none;"
                        name="profileImage"
                >
              </div>

          <!-- account 입력 -->
          <div class="input__block">
          <p>아이디를 입력해주세요</p>
          <span id="idChk"></span>
             <input id="user_id" class="form-control tooltipstered" type="text" name="account" maxlength="14" placeholder="Account" required />
          </div>

          <!-- 비밀번호 입력 -->
          <div class="input__block">
            <p>비밀번호를 입력해주세요</p>
            <span id="pwChk"></span>
             <input id="password" class="form-control tooltipstered" type="password" name="password" placeholder="Password"  required />
          </div>

          <!-- 비밀번호 2차 입력 -->
          <div class="input__block">
            <p>비밀번호를 재입력해주세요</p>
            <span id="idChk2"></span>
            <input id="password_check" class="form-control tooltipstered" type="password" name="password2" placeholder="Confirm Password"  required />
          </div>

          <!-- email 입력 -->
          <div class="input__block">
            <p>이메일을 입력해주세요</p>
            <span id="emailChk"></span>
            <input id="user_email" class="form-control tooltipstered" type="email" name="email" placeholder="Email" required />
          </div>

          <br>

          

          <!-- userName 입력 -->
          <div class="input__block">
            <p>이름을 입력해주세요(실명)</p>
            <span id="nameChk"></span>
              <input id="user_name" class="form-control tooltipstered" type="text" name="userName" placeholder="Real Name"  required />
            </div>

            <!-- gender 입력 -->
          <div class="input__block">
            <p>성별을 선택해주세요</p>
            <span id="genderChk"></span>
            <label><input id="user_gender" type="radio" name="gender" value="M" required /> Male</label>
            <label><input id="user_gender" type="radio" name="gender" value="F" required /> Female</label>
          </div>

            <!-- phoneNumber 입력 -->
          <div class="input__block">
            <p>연락처를 입력해주세요</p>
            <span id="phoneNumberChk"></span>
            <input id="user_phone" class="form-control tooltipstered" type="text" name="phoneNumber" placeholder="PhoneNumber"  required />
          </div>

          <!-- address 입력 -->
          <div class="input__block">
            <p>주소를 입력해주세요</p>
            <span id="addressChk"></span>
            <input id="user_address" class="form-control tooltipstered" type="text" name="address" placeholder="Address" required />
          </div>
          

          <!-- sign up button -->
          <button type="submit" id="signup-btn" class="form-controller">
            Sign Up
          </button>
        </form>
      </div>

      <footer>
        <p>
          Thank you for watching
          <i class="fa fa-heart"></i>
          <i class="fa fa-heart"></i>
          <i class="fa fa-heart"></i>
        </p>
      </footer>

      

      <script type="module" src="/assets/js/login/signUp.js"></script>
      <script type="module" src="/assets/js/login/proFileImg.js"></script>
</body>
</html>
