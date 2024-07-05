 const contentTextarea = document.getElementById('content');
        const charCountDiv = document.getElementById('charCount');

        contentTextarea.addEventListener('input', () => {
            const currentLength = contentTextarea.value.length;
            charCountDiv.textContent = `${currentLength} / 200`;
        });

        // write button event
                document.querySelector('.list-btn').onclick = e => {
                  window.location.href = '/freeBoard/list';
                };


   //프로필 사진 동그라미 썸네일 부분
       const $profile = document.querySelector('.SnsProfile');
       //실제 프로필 사진이 첨부될 input
       const $fileInput = document.getElementById('photo');

       $profile.addEventListener('click', e => {
         $fileInput.click();
       });


       //프로필 사진 선택 시 썸네일 보여주기
       $fileInput.addEventListener('change', e => {
         console.log('file changed!');

         //사용자가 첨부한 파일 데이터 읽어오기
         const fileData = $fileInput.files[0];
         //console.log(fileData);

         //첨부파일 이미지의 로우데이터(바이트)를 읽는 객체 생성
         const reader = new FileReader();

         //파일의 데이터를 읽어서 img태그에 src속성에 넣기 위해
         //파일을 URL형태로 변경
         reader.readAsDataURL(fileData);

         //첨부 파일이 등록되는 순간 img태그에 이미지를 세팅
         reader.onloadend = e => {
           const $img = document.querySelector('.sns-box img');
           $img.src = reader.result;
         }

       });
