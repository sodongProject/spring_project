//  //서버에서 전송된 로그인 검증 메시지
//  const result = '${result}';
//  console.log('result: ', result);


//  if(result==='NO_ACC'){
//      alert('아이디가 존재하지 않습니다.');
//  }else if(result === 'NO_PW'){
//      alert('비밀번호가 일치하지 않습니다.');
//  }

//  // 비회원인 상태로 접근제한 페이지에 들어갔다 온 경우
//  // 이 경우에는 쿼리스트링(?어쩌구)에 message파라미터가 붙어있다  ?message=login-required
//  const params = new URLSearchParams(window.location.search);
//  const message = params.get('message');

//  if(message === 'login-required'){
//      alert('로그인이 필요한 서비스입니다.');
//  }


//  // 새로고침하면 alert창 계속 뜸=======

//  // 쿼리 파라미터를 제거한 새로운 URL 생성
//      // window.location.origin -> http://localhost:8383
//      // window.location.pathname -> /members/sign-in
//      const newUrl = window.location.origin + window.location.pathname;

//      // history.replaceState(state, title, url) : 브라우저 조작
//      history.replaceState(null, null, newUrl);
