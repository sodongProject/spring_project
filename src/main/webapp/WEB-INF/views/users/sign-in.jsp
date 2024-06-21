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
            <a href="#" id="signin">SIGN IN</a>
          </li>
          <li>
            <a href="#" id="signup">SIGN UP</a>
          </li>
        </ul>
        
        <!-- Form -->
        <form  action="" method="post">
          <!-- email input -->
          <div class="first-input input__block first-input__block">
             <input type="email" placeholder="Email" class="input" id="email"   />
          </div>
          <!-- password input -->
          <div class="input__block">
             <input type="password" placeholder="Password" class="input" id="password"    />
          </div>
          <!-- repeat password input -->
          <div class="input__block">
             <input type="password" placeholder="Repeat password" class="input repeat__password" id="repeat__password"    />
          </div>
          <!-- sign in button -->
          <button class="signin__btn">
            Sign in
          </button>
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



      <script src="/assets/js/login.js"></script>
</body>
</html>