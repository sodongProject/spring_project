<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header -->
 <header>
  <div class="h-inner">
    <p class="h-logo">
      <a href="/">
        <img src="/assets/img/common/h-logo.png" alt="홈 화면 바로가기">
      </a>
    </p>
    <nav class="h-s_navi">
      <ul>
        <li><a href="#sodongSection">Community</a></li>
        <li><a href="#commuSection">Company</a></li>
      </ul>
    </nav>
    <button class="h-hambuger_btn">
      <span></span>
      <span></span>
    </button>

    <div class="h-side_menu">
      <nav>
        <ul>
          <li>
            <a href="#">소동 리스트</a>
          </li>
          <li>
            <a href="/myPage/view">마이페이지</a>
          </li>
          <li>
            <a href="#">공지사항</a>
          </li>
        </ul>
        <ul class="bot">
          <!-- 로그인시 활성화 -->
          <!-- <li class="mySondong">
            <a href="#">내 소동 바로가기</a>
          </li> -->
          <li class="login">
            <a href="#">로그인</a>
          </li>
          <li>
            <a href="#">회원가입</a>
          </li>
        </ul>
      </nav>
    </div>
  </div>
</header> 
<!-- //header -->

<script>
  $hamburger = document.querySelector('.h-hambuger_btn')
  $sideMenu = document.querySelector('.h-side_menu')
  $hamburger.addEventListener('click',()=>{
    $hamburger.classList.toggle('is-active')
    $sideMenu.classList.toggle('is-active')
  })
</script>