 //서버에서 전송된 로그인 검증 메시지
        const result = '${result}';
        console.log('result: ', result);


        if(result === 'NO_ACC'){
            alert('아이디가 존재하지 않습니다.');
        }else if(result === 'NO_PW'){
            alert('비밀번호가 일치하지 않습니다.');
        }