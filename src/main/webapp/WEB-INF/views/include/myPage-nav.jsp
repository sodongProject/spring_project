<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="myPage_nav">
  <div class="menu-wrap">
    <h2 class="menu-tit"><a href="/myPage/view">회원정보</a></h2>
    <ul class="menu-list">
      <li class="menu-list-link view">
        <a href="/myPage/view">회원 정보 조회</a>
      </li>
      <li class="menu-list-link modify">
        <a href="/myPage/modifyInformations">회원 정보 수정</a>
      </li>
    </ul>
  </div>
  <div class="menu-wrap">
    <h2 class="menu-tit menu-list-link point">
      <a href="/myPage/viewPoint">포인트</a>
    </h2>
  </div>
  <div class="menu-wrap">
    <h2 class="menu-tit menu-list-link withdrawal">
      <a href="#">회원탈퇴</a>
    </h2>
  </div>
</nav>
<script>
  window.addEventListener("DOMContentLoaded", () => {
    const $navLinks = document.querySelectorAll(".menu-list-link");
    let className = "";
    const activeLink = (className) => {
      $navLinks.forEach(($navLink) => {
        if ($navLink.classList.contains(className)) {
          $navLink.querySelector("a").classList.add("is-active");
          $navLink.closest(".menu-wrap").classList.add("is-active");
        }
      });
    };
    if (window.location.pathname === "/myPage/view") {
      // 페이지가 "/myPage/view"일 때 실행할 코드를 여기에 작성하세요.
      className = "view";
      activeLink(className);
    } else if (window.location.pathname === "/myPage/modifyInformations") {
      className = "modify";
      activeLink(className);
    } else if (window.location.pathname === "/myPage/viewPoint") {
      className = "point";
      activeLink(className);
    } else if (window.location.pathname === "/myPage/withdrawal") {
      className = "withdrawal";
      activeLink(className);
    }
  });
</script>
