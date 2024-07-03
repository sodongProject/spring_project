<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="../include/static-head.jsp" %>
    <link href="/assets/css/myPage/myPage.css" rel="stylesheet" />

    <script type="module" src="/assets/js/myPage/modify.js" defer></script>
  </head>
  <body>
    <div class="myPage_wrap modify">
      <%@ include file="../include/myPage-nav.jsp" %>
      <div class="myPage_inner">
        <h1>회원 정보 수정</h1>
        <!-- 비밀번호 검증 결과 ${result} -->
        <div class="main_profile modify">
          <!-- 아이디 수정 form - disable -->
          <div>
            <h2>아이디:</h2>
            <input
              type="text"
              class="text short"
              value="${dto.account}"
              disabled
            />
          </div>
          <!-- 이메일 수정 form  -->
          <div>
            <form action="/myPage/modifyEmail" method="post">
              <h2>이메일:</h2>
              <div class="input_wrap">
                <p class="input_box">
                  <input
                    name="newEmail"
                    id="emailModifyInput"
                    type="text"
                    class="text"
                    value="${dto.email}"
                  />
                  <span id="emailChk" class="message-error"></span>
                </p>
                <button type="submit" onclick="validateInput.email(e)">
                  이메일 수정
                </button>
              </div>
            </form>
          </div>
          <!-- 전화번호 수정 form -->
          <div>
            <form action="/myPage/modifyPhNum" method="post">
              <h2>전화번호: ${dto.phoneNumber}</h2>
              <div class="input_wrap">
                <p class="input_box">
                  <select
                    class="text phone_number"
                    id="phoneNumFrontSelect"
                    name="phoneNumFront"
                    required
                  >
                    <option>010</option>
                    <option>011</option>
                    <option>070</option>
                  </select>
                  <script>
                    const phNumFront = "<c:out value='${phNum.phoneNumFront}' />";

                    $frontPhNumSelect =
                      document.getElementById("phoneNumFrontSelect");
                    $frontPhNumOptions = $frontPhNumSelect.querySelectorAll('option');
                    

                    console.log(phNumFront);
                    console.log($frontPhNumOptions);
                    if (phNumFront === "010") {

                      $frontPhNumOptions[0].selected = true;
                    } else if (phNumFront === "011") {
                      $frontPhNumOptions[1].selected = true;
                    } else if (phNumFront === "070") {
                      $frontPhNumOptions[2].selected = true;
                    }
                  </script>

                  <span class="bar"></span>
                  
                  <input
                    type="number"
                    class="text phone_number"
                    name="phoneNumMid"
                    id="phoneNumMid"
                    value="${phNum.phoneNumMid}"
                    required
                  />
                  <span class="bar"></span>

                  <input
                    type="number"
                    class="text phone_number"
                    name="phoneNumLast"
                    id="phoneNumLast"
                    value="${phNum.phoneNumLast}"
                    required
                  />
                  <span class="message-error phNum"></span>
                </p>
               
                <button type="submit" id="phNumSubmitBtn">전화번호 수정</button>
                <script>
                 const $phNumMid = document.getElementById('phoneNumMid')
                 const $phNumLast = document.getElementById('phoneNumLast')
                 const $phNumSubmitBtn = document.getElementById('phNumSubmitBtn')
                 const $phErrorMessage = document.querySelector('.message-error.phNum')
                  $phNumSubmitBtn.addEventListener('click',function(e){
                  

                    if($phNumMid.value.length === 4 && $phNumLast.value.length === 4 ){
                      $phNumSubmitBtn.submit()
                    } else{
                      e.preventDefault();
                      $phErrorMessage.textContent = "[전화번호 형식을 지켜주세요.]"
                    }

                  })
                </script>
              </div>
            </form>
          </div>
          <!-- 주소 수정 form -->
          <div>
            <form action="/myPage/modifyAddress" method="post">
              <h2>주소:</h2>
              <div class="input_wrap">
                <p class="input_box">
                  <input
                    type="text"
                    class="text"
                    name="newAddress"
                    id="addressModifyInput"
                    value="${dto.address}"
                    onchange="validateInput.address(e)"
                  />
                  <span id="addressChk" class="message-error"></span>

                </p>

                <button type="submit" id="addressModiBtn">주소 수정</button>
                <script>
                  const $addressModiBtn = document.getElementById("addressModiBtn");
                  $addressModiBtn.addEventListener("click",()=>{
                     const  addressVal = document.getElementById("addressModifyInput").value;
                     
                     if(validateInput.address(addressVal)){

                     } else{
                      e.preventDefault();
                     }
ㅌ                  })
                </script>
              </div>
            </form>
          </div>
          <!-- 비밀번호 수정 form -->
          <div>
            <form action="/myPage/modifyPassword" method="post">
              <h2>비밀번호:</h2>
              <div class="input_wrap password">
                <p class="input_box">
                  <input
                    type="password"
                    class="text short"
                    id="newPassword"
                    name="newPassword"
                    min="3"
                    max="20"
                    placeholder="새 비밀 번호"
                  />
                </p>
              </div>
              <div class="input_wrap password">
                <p class="input_box">
                  <input
                    type="password"
                    class="text short"
                    id="newPasswordConfirm"
                    name="newPasswordConfirm"
                    min="3"
                    max="20"
                    placeholder="비밀번호"
                  />
                </p>
                <button type="submit" id="modifySubmitBtn">
                  비밀번호 수정
                </button>
              </div>
            </form>
            <script>
              const pwInput = document.getElementById("newPassword");
              const pwInputConfirm =
                document.getElementById("newPasswordConfirm");

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

              const modifySubmitBtn =
                document.getElementById("modifySubmitBtn");

              modifySubmitBtn.addEventListener("click", (e) => {
                console.log(newPwValue);
                console.log(pwInputConfirm);
                if (newPwValue !== newPwValueConfirm) {
                  e.preventDefault();
                }
              });
            </script>
          </div>

          <!--  -->

          <div>
            <form action="/myPage/modifyProfile" method="post">
              <h2>프로필이미지:</h2>
              <div class="input_wrap">
                <p class="input_box text short file">
                  <input type="file" id="fileUploader" />
                </p>
                <button type="submit">프로필 수정</button>
              </div>
            </form>
          </div>

          <div class="short_box">
            <h2>이름:</h2>
            <input
              type="text"
              class="text short"
              value="${dto.name}"
              disabled
            />
          </div>
          <div class="short_box">
            <h2>성별:</h2>
            <input
              type="text"
              class="text short"
              value="${dto.gender}"
              id="genderInput"
              disabled
            />
            <script>
              const $genderInput = document.getElementById("genderInput");
              if ($genderInput.value === "F") {
                $genderInput.value = "여성";
              } else if ($genderInput.value === "M") {
                $genderInput.value = "남성";
              }
            </script>
          </div>
          <div class="short_box">
            <h2>온도:</h2>
            <div class="temper_wrap">
              <p class="temper_range">
                <span class="temper"> </span>
              </p>
              <p class="temper_num">${dto.temperature}</p>
            </div>

            <!-- <input
              type="range"
              class="range"
              value="${dto.temperature}"
              min="0"
              max="100"
              disabled
            /> -->
          </div>
        </div>
        <script>
          const temper = "<c:out value='${dto.temperature}' />";
          const $temperRange = document.querySelector(".temper");
          $temperRange.style.width = temper + "%";
          // $temperRange.dataset.temperature = temper;
        </script>
        <!-- <form action="/myPage/withdrawal" method="post">
      <button type="submit">회원 탈퇴</button>
    </form> -->
      </div>
    </div>
  </body>
</html>
