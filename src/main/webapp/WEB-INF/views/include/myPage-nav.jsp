<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="myPage_nav">
  <div class="menu-wrap">
    <h2 class="menu-tit is-active"><a href="/myPage/view">회원정보</a></h2>
    <ul class="menu-list">
      <li>
        <a href="/myPage/view" class="is-active">회원 정보 조회</a>
      </li>
      <li>
        <a href="/myPage/modifyInformations">회원 정보 수정</a>
      </li>
    </ul>
  </div>
  <div class="menu-wrap">
    <h2 class="menu-tit">
      <a href="/myPage/viewPoint">포인트</a>
    </h2>
  </div>
  <div class="menu-wrap">
    <h2 class="menu-tit">
      <a href="#">회원탈퇴</a>
    </h2>
  </div>
</nav>