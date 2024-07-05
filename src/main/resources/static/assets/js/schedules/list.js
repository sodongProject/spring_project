import { callApi } from "./api.js";

const BASE_URL = 'http://localhost:8383/schedules/list';
const BASE_URL2 = 'http://localhost:8383/schedules/delete';
const BASE_URL3 = 'http://localhost:8383/schedules/register';

const $addScheduleBtn = document.getElementById('add_schedule_button');
const $deleteScheduleBtn = document.querySelector('.card-container');
fetchScheduleList();
addScheduleBtnHandler();
deleteScheduleBtnHandler();
registerModalHandler();
registerBtnHandler();
pageBtnHandler();

function addScheduleBtnHandler() {
    $addScheduleBtn.addEventListener('click', async e => {
        e.preventDefault();

        const payload = {
            clubNo: document.getElementById('club_no').firstElementChild.value,
            scheduleTitle: document.getElementById('schedule_title').value,
            scheduleContent: document.getElementById('schedule_content').value,
            scheduleAt: document.getElementById('schedule_at').value,
            participationPoints: document.getElementById('participation_points').value,
        };

        await callApi(BASE_URL, 'POST', payload);
        await fetchScheduleList();
    });
}

function deleteScheduleBtnHandler() {
   const $deleteBtn = document.querySelector(".card-container");
   $deleteBtn.addEventListener('click', async e => {
       // 페이지 새로고침 막기
       e.preventDefault();



       const $btn = document.querySelectorAll(".del-btn i");

       // 삭제버튼 아닐시 이벤트 활성화 X
       let isDeleteBtn = false

       for (const $btnElement of $btn) {
           if(e.target === $btnElement) {
               isDeleteBtn = true;
           }
       }

       if(!isDeleteBtn) return;

        // 삭제 요청을 위한 스케줄번호 받아오기
       const scheduleNumber = e.target.closest(".container").dataset.schedule_no;

       // 삭제시 페이지 유지를 위한 현재 페이지번호 받아오기
       const $nowPage = document.querySelector('.p-active a');
       let pageNo = 1;
       if($nowPage !== null) {
           pageNo = $nowPage.dataset.page;
       }



       if(pageNo !== null) pageNo = parseInt(pageNo);

       // 삭제버튼 클릭시 삭제요청 보내기 위한 payload
       const payload = {
            scheduleNo: scheduleNumber,
       }

       await callApi(BASE_URL2, 'POST', payload);
       await fetchScheduleList(pageNo);
   })
}

function pageBtnHandler() {
    document.getElementById('page-btn-box').addEventListener('click', e => {
        e.preventDefault();
        const $pageBtn = document.querySelectorAll('.page-link');
        for (const $pageBtnElement of $pageBtn) {
            if(e.target === $pageBtnElement) {
                let pageNo = e.target.dataset.page;

                if (pageNo !== null) pageNo = parseInt(pageNo)

                fetchScheduleList(pageNo);
            }
        }

    })
}

// schedule 가입하기 모달창 여는 이벤트 핸들러
function registerModalHandler() {
    const $registerModalBtn = document.querySelector(".card-container");

    $registerModalBtn.addEventListener('click', async e => {
        // 페이지 새로고침 막기
        e.preventDefault();

        const $btn = document.querySelectorAll(".join-btn");

        // 모달오픈버튼 아닐시 이벤트 활성화 X
        let isRegisterModalBtn = false

        for (const $btnElement of $btn) {
            if(e.target === $btnElement) {
                isRegisterModalBtn = true;
            }
        }

        if(!isRegisterModalBtn) return;

        const $registerModal = document.getElementById("register-modal");
        const $registerModalH1 = document.querySelector(".register-content");
        const $registerModalP = document.querySelector(".participation_point");

        $registerModal.dataset.sno = e.target.closest(".btnCenter").dataset.sno;
        $registerModal.style.display = 'flex';
        $registerModalH1.innerHTML = e.target.dataset.stitle + "에 가입하시겠습니까?";
        $registerModalP.innerHTML = "참가비 : "+ e.target.dataset.point;

    });
}

function registerBtnHandler() {
    const $registerBtn = document.querySelector('.accept-btn');
    $registerBtn.addEventListener('click', async e => {

        const $registerModal = document.getElementById("register-modal");

        const payload = {
            clubNo:document.getElementById('club_no').firstElementChild.value,
            scheduleNo:$registerModal.dataset.sno,
        }

        // 가입신청시 페이지 유지를 위한 현재 페이지번호 받아오기
        let pageNo = document.querySelector('.p-active a').dataset.page;

        if(pageNo !== null) pageNo = parseInt(pageNo);

        $registerModal.style.display = 'none';

        await callApi(BASE_URL3, 'POST', payload);
        await fetchScheduleList(pageNo);

    })
}


function renderPage({ begin, end, pageInfo }, pageNo=1) {
    let tag = '';

    const clubNo = document.getElementById('club_no').firstElementChild.value;
    // prev 만들기
    if (pageNo !== begin)
        tag += `<li class='page-item'>
            <a class='page-link' href='${begin - 1}' data-page="${pageNo - 1}">이전</a>
            </li>`;

    // 페이지 번호 태그 만들기
    for (let i = begin; i <= end; i++) {
        let active = '';
        if (pageInfo.pageNo === i) active = 'p-active';

        tag += `
      <li class='page-item ${active}'>
        <a class='page-link page-custom' href="${i}" data-page="${i}">${i}</a>
      </li>`;
    }

    console.log("begin" + begin);
    // prev 만들기
    if (pageNo !== end && end !== 0)
        tag += `<li class='page-item'>
            <a class='page-link' href='${pageNo + 1}' data-page="${pageNo + 1}">다음</a>
            </li>`;

    return tag;
}

export async function fetchScheduleList(pageNo = 1) {
    const clubNo = document.getElementById('club_no').firstElementChild.value;

    const scheduleResponse = await callApi(`${BASE_URL}/${clubNo}/page/${pageNo}`);

    const scheduleList = scheduleResponse.scheduleList;
    const userInfoList = scheduleResponse.scheduleLoginUserInfoList;

    let schedule = '';


    if (scheduleList !== null && scheduleList.length > 0) {
        for (let i = 3*pageNo - 3; i < 3*(pageNo) && i < scheduleList.length; i++) {
            schedule += `<div class="card-wrapper">
                    <div class="container" data-schedule_no="${scheduleList[i].scheduleNo}">
                        <div class="top-section">`;
            // 관리자가 아니면 삭제 버튼이 안보이도록 설정
            if(userInfoList.length > 0) {
                for(const user of userInfoList) {
                    if(user.scheduleNo === scheduleList[i].scheduleNo && user.userScheduleRole === 'ADMIN') {
                        schedule += `<button class="del-btn" data-href="#">
                                <i class="fas fa-times">X</i>
                            </button>`;
                    }
                }
            }
            schedule +=   `<i class='bx bxs-moon'></i>
                        </div>
                        <div class="middle-section">
                            <div class="view">
                                <i class="fas fa-eye"></i>
                                <span class="view-count">${scheduleList[i].scheduleCount}</span>
                            </div>
                            <h2>${scheduleList[i].scheduleTitle}</h2>
                            <p>${scheduleList[i].scheduleContent}</p>
                            <p>참가비 : ${scheduleList[i].participationPoints}</p>
                            <p class="account">주최자 : ${scheduleList[i].account}</p>
                            <div class="social-media">
                                <i class='bx bxl-twitter'></i>
                                <i class='bx bxl-facebook'></i>
                                <i class='bx bxl-instagram'></i>
                            </div>
                            <div class="btnCenter" data-sno="${scheduleList[i].scheduleNo}">
                                <button type="button" class="btn detail-btn" data-sno="${scheduleList[i].scheduleNo}">상세보기</button>
                                `;

            // 이 스케줄에 가입중이거나 신청 이력이 있으면 신청하기 버튼이 안보이도록
            let isUserInSchedule = false
            if(userInfoList.length > 0) {
                for(const user of userInfoList) {
                    if(user.scheduleNo === scheduleList[i].scheduleNo) {
                        isUserInSchedule = true
                    }
                }
            }
            if(!isUserInSchedule){
                schedule += `<button class="btn join-btn" data-stitle="${scheduleList[i].scheduleTitle}"
                                data-point="${scheduleList[i].participationPoints}">가입하기</button>`
            }

            schedule +=    `</div>
                        </div>
                    </div>
                </div>
                    `;
        }
    } else {
        schedule += `<div id="no-schedule">
                        <h1 id="no-schedule">스케줄이 존재하지 않습니다.</h1>
                     </div>
                        `;
    }


    let buttonTag = renderPage(scheduleResponse.pageInfo, pageNo);
    document.getElementById('page-btn').innerHTML = buttonTag;


    document.querySelector('.card-container').innerHTML = schedule;

    // 이벤트 핸들러를 추가하기 위해 detailEventHandler 호출
    detailEventHandler();
}

function detailEventHandler() {
    const detailButtons = document.querySelectorAll('.btnCenter .detail-btn');
    detailButtons.forEach(button => {

        button.addEventListener('click', e => {
            e.preventDefault();

            document.getElementById('detail-modal').style.display='flex';
        });
    });
}
