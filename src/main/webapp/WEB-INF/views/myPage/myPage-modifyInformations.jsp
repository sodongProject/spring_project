<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
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

    <form action="/myPage/modifyAdress" method="post">
      <h3>주소: ${dto.adress}</h3>
      <!-- 주소지 선택 -->
      <select name="city">
        <option>서울시</option>
        <option>경기도</option>
        <option>강원도</option>
        <option>충청도</option>
        <option>경상북도</option>
        <option>경상남도</option>
        <option>전라북도</option>
        <option>전라남도</option>
      </select>
      <select name="town">
        <option>강동구</option>
        <option>강서구</option>
        <option>강북구</option>
        <option>강남구</option>
        <option>관악구</option>
        <option>광진구</option>
        <option>구로구</option>
        <option>노원구</option>
        <option>성북구</option>
        <option>송파구</option>
        <option>용산구</option>
      </select>
      <button type="submit">수정</button>
    </form>

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
      <h3>프로필이미지: ${dto.imgAdress}</h3>
      <button type="submit">수정</button>
    </form>

    <form action="/myPage/modifyProfile" method="post"></form>
    <h3>이름: ${dto.name}</h3>
    <h3>성별: ${dto.gender}</h3>
    <h3>온도: ${dto.temperature}</h3>

    <!-- <form action="/myPage/withdrawal" method="post">
      <button type="submit">회원 탈퇴</button>
    </form> -->
  </body>
</html>
