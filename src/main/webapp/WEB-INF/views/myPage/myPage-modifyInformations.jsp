<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="../include/static-head.jsp" %>
    <link href="/assets/css/myPage/myPage.css" rel="stylesheet" />

    <script src="/assets/js/login/validate.js" defer></script>
  </head>
  <body>
    <div class="myPage_wrap">
      <%@ include file="../include/myPage-nav.jsp" %>
      <div class="myPage_inner">
        비밀번호 검증 결과 ${result}

        <h3>아이디: ${dto.account}</h3>
        <h3>이메일: ${dto.email}</h3>
        <form action="/myPage/modifyPhNum" method="post">
          <h3>전화번호: ${dto.phoneNumber}</h3>
          <select name="phoneNumFront">
            <option>010</option>
            <option>011</option>
            <option>070</option>
          </select>
          <input type="number" name="phoneNumMid" />
          <input type="number" name="phoneNumLast" />
          <button type="submit">수정</button>
        </form>

        <form action="/myPage/modifyAddress" method="post">
          <h3>주소: ${dto.address}</h3>
          <!-- 주소지 선택 -->
          <input
            type="text"
            name="newAddress"
            onchange="validateInput.address(e)"
          />

          <button type="submit">수정</button>
        </form>
        <script></script>

        <form action="/myPage/modifyPassword" method="post">
          <h3>비밀번호: ${dto.password}</h3>
          <input
            type="password"
            id="newPassword"
            name="newPassword"
            min="3"
            max="20"
          />
          <input
            type="password"
            id="newPasswordConfirm"
            name="newPasswordConfirm"
            min="3"
            max="20"
          />
          <button type="submit" id="modifySubmitBtn">수정</button>
        </form>
        <script>
          const pwInput = document.getElementById("newPassword");
          const pwInputConfirm = document.getElementById("newPasswordConfirm");

          let newPwValue;
          let newPwValueConfirm;

          pwInput.addEventListener("keyup", (e) => {
            newPwValue = e.target.value;
            console.log(newPwValue);
          });
          pwInputConfirm.addEventListener("keyup", (e) => {
            newPwValueConfirm = e.target.value;
            console.log(newPwValueConfirm);
          });

          const modifySubmitBtn = document.getElementById("modifySubmitBtn");

          modifySubmitBtn.addEventListener("click", (e) => {
            console.log(newPwValue);
            console.log(pwInputConfirm);
            if (newPwValue !== newPwValueConfirm) {
              e.preventDefault();
            }
          });
        </script>

        <form action="/myPage/modifyProfile" method="post">
          <h3>프로필이미지: ${dto.profileImage}</h3>
          <button type="submit">수정</button>
        </form>

        <form action="/myPage/modifyProfile" method="post"></form>
        <h3>이름: ${dto.name}</h3>
        <h3>성별: ${dto.gender}</h3>
        <h3>온도: ${dto.temperature}</h3>

        <!-- <form action="/myPage/withdrawal" method="post">
      <button type="submit">회원 탈퇴</button>
    </form> -->
      </div>
    </div>
  </body>
</html>
