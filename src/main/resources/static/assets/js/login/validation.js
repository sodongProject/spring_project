// 회원가입 입력 검증 처리

// 계정 중복검사 결과를 저장할 변수
let idFlag = false;

// 계정 중복검사 비동기 요청 보내기
async function fetchDuplicateCheck(idValue) {
  try {
    const res = await fetch(`http://localhost:8383/users/check?type=account&keyword=${idValue}`);
    
    if (!res.ok) {
      throw new Error(`HTTP error! status: ${res.status}`);
    }

    const flag = await res.json();
    console.log('서버 응답 데이터:', flag);
    idFlag = flag; // idFlag 업데이트
    
  } catch (error) {
    console.error('Error fetching duplicate check:', error);
  }
}

// 계정 입력 검증
const $idInput = document.getElementById('user_id');
const $idChk = document.getElementById('idChk');

$idInput.addEventListener('keyup', async e => {
  // id 검사 정규표현식(영문 대소문자와 숫자, 4~14글자)
  const accountPattern = /^[a-zA-Z0-9]{4,14}$/;

  // 입력값 읽어오기
  const $idChk = document.getElementById('idChk');
  const idValue = $idInput.value;

  
  // 검증 메시지 입력
  if (idValue.trim() === '') {
    $idChk.innerHTML = '<b class="warning"> [ 아이디는 필수값입니다 ]</b>';
    $idChk.style.color = 'red';
  } else if (!accountPattern.test(idValue)) {
    $idChk.innerHTML = '<b class="warning"> [ 아이디는 4~14글자 사이 영문, 숫자로 입력하세요 ]</b>';
    $idChk.style.color = 'red';
  } else {
    // 아이디 중복검사
    await fetchDuplicateCheck(idValue);
    
    //console.log('중복 검사 결과:', idFlag);

    if (idFlag) {
      $idChk.innerHTML = '<b class="warning"> [ 이미 등록된 아이디가 있습니다 ]</b>';
      $idChk.style.color = 'red';
    } else {
      $idChk.innerHTML = '<b class="success"> [ 사용 가능한 아이디입니다 ]</b>';
      $idChk.style.color = 'skyblue';
    }
  }
});
