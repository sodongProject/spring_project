

// 유효성 검증 함수들을 import
// validateInput
import { validateInput } from '../login/validate.js';
import { debounce } from '../login/util.js';

// 폼과 회원가입 버튼 요소를 가져옴
// const form = document.getElementById('signUpForm');
// const signupButton = document.getElementById('signup-btn');


// 각 필드에 대한 정보 배열 (id, 유효성 검증 함수, 에러 메시지 표시 요소, 초기 유효 상태)
const fields = [
  // { id: 'user_id', validator: validateInput.account, errorElement: 'idChk', valid: false },
  // { id: 'password', validator: validateInput.password, errorElement: 'pwChk', valid: false },
  // { id: 'password_check', validator: (value) => validateInput.passwordCheck(value, document.getElementById('password').value), errorElement: 'pwChk2', valid: false },
  { id: 'emailModifyInput', validator: validateInput.email, errorElement: 'emailChk', valid: false },
  // { id: 'user_name', validator: validateInput.name, errorElement: 'nameChk', valid: false },
  // { id: 'user_profile', validator: null, errorElement: null, valid: true }, // 프로필 사진
  // { id: 'user_gender', validator: null, errorElement: 'genderChk', valid: false }, // 성별
  // { id: 'user_phone', validator: validateInput.phoneNumber, errorElement: 'phoneNumberChk', valid: false }, // 연락처
  { id: 'addressModifyInput', validator: validateInput.address, errorElement: 'addressChk', valid: false } // 주소
];


// 버튼 상태를 업데이트하는 함수
const updateButtonState = () => {
  // 모든 valid가 true인지 확인
  const isFormValid = fields.every(field => field.valid);

  if (isFormValid) {
    //signupButton.disabled = false; // 버튼 활성화
    //signupButton.style.backgroundColor = 'orangered'; // 활성화된 버튼 배경색
  } else {
    //signupButton.disabled = true; // 버튼 비활성화
    //signupButton.style.backgroundColor = 'lightgray'; // 비활성화된 버튼 배경색
  }
};


// 입력 필드의 유효성을 검사하고 에러 메시지를 업데이트하는 함수
const validateField = async (field) => {
  const $input = document.getElementById(field.id);
  const $errorSpan = document.getElementById(field.errorElement);
  const isValid = await field.validator($input.value);
  console.log(isValid);

  if (isValid.valid) {
    // $idChk.style.color = 'skyblue';
    $errorSpan.innerHTML = '<b class="success">[사용가능합니다.]</b>';
    field.valid = true;
    console.log(isValid);
  } else {
    // $idChk.style.color = 'salmon';
    $errorSpan.innerHTML = isValid.message;
    field.valid = false;
    console.log(field);
  }
  updateButtonState();
};


fields.forEach(field => {
  const $input = document.getElementById(field.id); // 입력 요소 가져오기
  $input.addEventListener('keyup', debounce(async (e) => { // 키보드 입력 시마다 유효성 검증
    const isValid = await field.validator($input.value); // 유효성 검증 함수 호출
    const $errorSpan = document.getElementById(field.errorElement); // 에러 메시지 표시 요소 가져오기
    console.log(isValid);
    if (isValid.valid) { // 유효한 경우
      $input.style.color = '#0d0d0d'; // 입력 요소의 테두리 색 변경
      $errorSpan.innerHTML = '<b class="success">[ 사용가능합니다 ]</b>'; // 성공 메시지 표시
      field.valid = true; // 필드의 유효 상태를 true로 설정
    } else { // 유효하지 않은 경우
      $input.style.color = '#e02323'; // 입력 요소의 테두리 색 변경
      $errorSpan.innerHTML = `<b class="warning">[${isValid.message}]</b>`; // 에러 메시지 표시
      field.valid = false; // 필드의 유효 상태를 false로 설정
    }
    updateButtonState(); // 각 입력 유효성 검사 후 버튼 상태 업데이트
  }, 500)); 
});

// 회원가입 버튼 클릭 이벤트 리스너 추가
signupButton.addEventListener('click', (e) => {
  // 모든 필드가 유효한지 확인
  const isFormValid = fields.every(result => result.valid);

  if (isFormValid) { // 모든 필드가 유효한 경우
    form.submit(); // 폼 제출
  } else { // 유효하지 않은 필드가 있는 경우
    alert('입력란을 다시 확인하세요!'); // 경고 메시지 표시
  }
});


// 페이지 로드 시 초기 버튼 상태 업데이트
updateButtonState();