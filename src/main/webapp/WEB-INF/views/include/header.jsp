<%@ page contentType="text/html; charset=UTF-8" language="java" %> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header -->
<header>
  <div class="h-inner">
    <p class="h-logo">
      <a href="/">
        <img src="/assets/img/common/h-logo.png" alt="홈 화면 바로가기" />
      </a>
    </p>
    <c:if test="${login==null}">
      <nav class="h-s_navi">
        <ul>
          <li><a href="#sodongSection">Community</a></li>
          <li><a href="#commuSection">Company</a></li>
        </ul>
      </nav>
    </c:if>
   
    <button class="h-hambuger_btn">
      <span></span>
      <span></span>
    </button>

    <div class="h-side_menu">
      <nav>
        <ul>
          <li>
            <a href="/club/list">소동 리스트</a>
          </li>
          <li>
            <a href="/myPage/view">마이페이지</a>
          </li>
          <li>
            <a href="/main-notice/list">공지사항</a>
          </li>
        </ul>
        <ul class="bot">
          <!-- 로그인시 활성화 -->

          <c:if test="${login!=null}">
            <li class="mySondong">
              <a href="#">내 소동 바로가기</a>
            </li>
            <li class="logout">
              <a href="/users/sign-out">로그아웃</a>
            </li>
          </c:if>
          <c:if test="${login==null}">
            <li class="login">
              <a href="/users/sign-in">로그인</a>
            </li>
            <li>
              <a href="/users/sign-up">회원가입</a>
            </li>
         
          </c:if>
        </ul>
      </nav>
    </div>
  </div>
</header>
<!-- //header -->

<script>
  $hamburger = document.querySelector(".h-hambuger_btn");
  $sideMenu = document.querySelector(".h-side_menu");
  $hamburger.addEventListener("click", () => {
    $hamburger.classList.toggle("is-active");
    $sideMenu.classList.toggle("is-active");
  });
</script>
