
        const $cardContainer = document.querySelector('.card-container');

        //================= 삭제버튼 스크립트 =================//
        const modal = document.getElementById('modal'); // 모달창 얻기
        const confirmDelete = document.getElementById('confirmDelete'); // 모달 삭제 확인버튼
        const cancelDelete = document.getElementById('cancelDelete'); // 모달 삭제 취소 버튼

        $cardContainer.addEventListener('click', e => {
          // 삭제 버튼을 눌렀다면~
          if (e.target.matches('.card-btn-group *')) {
            console.log('삭제버튼 클릭');
            modal.style.display = 'flex'; // 모달 창 띄움

            const $delBtn = e.target.closest('.del-btn');
            // 삭제 링크주소 얻기
            const deleteLocation = $delBtn.dataset.href;
            console.log(deleteLocation);

            // 확인 버튼 이벤트
            confirmDelete.onclick = e => {
              // 삭제 처리 로직
              window.location.href = deleteLocation;

              modal.style.display = 'none'; // 모달 창 닫기
            };


            // 취소 버튼 이벤트
            cancelDelete.onclick = e => {
              modal.style.display = 'none'; // 모달 창 닫기
            };
          } else { // 삭제 버튼 제외한 부분은 글 상세조회 요청

            // section태그에 붙은 글번호 읽기
            const bno = e.target.closest('section.card').dataset.bno;
            // 요청 보내기
            window.location.href = '/freeBoard/detail?bno=' + bno;
          }
        });

        // 전역 이벤트로 모달창 닫기
        window.addEventListener('click', e => {
          if (e.target === modal) {
            modal.style.display = 'none';
          }
        });

        //========== 게시물 목록 스크립트 ============//

        function removeDown(e) {
          if (!e.target.matches('.card-container *')) return;
          const $targetCard = e.target.closest('.card-wrapper');
          $targetCard?.removeAttribute('id', 'card-down');
        }

        function removeHover(e) {
          if (!e.target.matches('.card-container *')) return;
          const $targetCard = e.target.closest('.card');
          $targetCard?.classList.remove('card-hover');

          const $delBtn = e.target.closest('.card-wrapper')?.querySelector('.del-btn');
          $delBtn.style.opacity = '0';
        }



        $cardContainer.onmouseover = e => {

          if (!e.target.matches('.card-container *')) return;

          const $targetCard = e.target.closest('.card');
          $targetCard?.classList.add('card-hover');

          const $delBtn = e.target.closest('.card-wrapper')?.querySelector('.del-btn');
          $delBtn.style.opacity = '1';
        }

        $cardContainer.onmousedown = e => {

          if (e.target.matches('.card-container .card-btn-group *')) return;

          const $targetCard = e.target.closest('.card-wrapper');
          $targetCard?.setAttribute('id', 'card-down');
        };

        $cardContainer.onmouseup = removeDown;

        $cardContainer.addEventListener('mouseout', removeDown);
        $cardContainer.addEventListener('mouseout', removeHover);

        // write button event
        document.querySelector('.add-btn').onclick = e => {
          window.location.href = '/freeBoard/write';
        };



