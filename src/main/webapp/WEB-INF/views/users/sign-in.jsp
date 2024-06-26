<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="/assets/css/login.css">
</head>
<body>
    
    <div class="container">
        <!-- Heading -->
        <h1>SIGN IN</h1>
        
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
        <form  action="/users/sign-in" name="sign-in" method="post" id="signInForm">

          <!-- account input -->
          <div class="first-input input__block first-input__block">
             <input type="text" name="account" id="signInId" class="input" maxlength="10" required="required" placeholder="Id"/>
          </div>

          <!-- password input -->
          <div class="input__block">
             <input type="password" size="17" maxlength="20"  placeholder="Password" class="input" id="signInPw" name="password" required="required"/>
          </div>

          <!-- sign in button -->
          <input type="submit" value="로그인" id="signIn-btn" class="signin__btn">
            Sign in
          </input>

          <!-- auto login -->
          <label class="auto-label" for="auto-login">
            <span><i class="fas fa-sign-in-alt"></i>자동 로그인</span>
            <input type="checkbox" id="auto-login" name="autoLogin">
        </label>

        </form>

        <!-- separator -->
        <div class="separator">
          <p>OR</p>
        </div>
        <!-- kakao button -->
        <button class="kakao__btn">
          <i class="fa fa-kakao"></i>
          Sign in with kakao
        </button>
        <!-- google button -->
        <button class="google__btn">
          <i class="fa fa-github"></i>
          Sign in with Google
        </button>
      </div>
      
      <footer>
        <p>
          Thank you for watching
          <i class="fa fa-heart"></i> 
          <i class="fa fa-heart"></i> 
          <i class="fa fa-heart"></i> 
        </p>
        
      </footer>

      <!-- <script src="/assets/js/signIn.js"></script> -->

      <script>
        //서버에서 전송된 로그인 검증 메시지
        const result = '${result}';
        console.log('result: ', result);


        if(result === 'NO_ACC'){
            alert('아이디가 존재하지 않습니다.');
        }else if(result === 'NO_PW'){
            alert('비밀번호가 일치하지 않습니다.');
        }

      </script>

</body>
</html>