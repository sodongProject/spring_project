import { callApi } from "./api.js";

const BASE_URL = 'http://localhost:8383/schedules/list';
const BASE_URL2 = 'http://localhost:8383/schedules/delete';
const BASE_URL3 = 'http://localhost:8383/schedules/register';

const $addScheduleBtn = document.getElementById('add_schedule_button');
const $deleteScheduleBtn = document.querySelector('.card-container');
fetchScheduleList();
addScheduleBtnHandler();
openDeleteScheduleModal();
registerModalHandler();
registerBtnHandler();
pageBtnHandler();

function addScheduleBtnHandler() {
    $addScheduleBtn.addEventListener('click', async e => {
        e.preventDefault();

        let at = document.getElementById('schedule_at').value;

        let fixAt = at.replace("T", " ");

        console.log(fixAt)

        const payload = {
            clubNo: document.getElementById('club_no').firstElementChild.value,
            scheduleTitle: document.getElementById('schedule_title').value,
            scheduleContent: document.getElementById('schedule_content').value,
            scheduleAt: fixAt,
            participationPoints: document.getElementById('participation_points').value,
        };

        await callApi(BASE_URL, 'POST', payload);
        await fetchScheduleList();
    });
}

function openDeleteScheduleModal() {
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

       const scheduleTitle = e.target.closest(".top-section").dataset.title;
       const scheduleNumber = parseInt(e.target.closest(".container").dataset.schedule_no);
       const tag = `
            <h1 class="delete-content" data-sno="${scheduleNumber}">${scheduleTitle}을(를) 삭제하시겠습니까?</h1>
            <div class="schedule-delete-btn">
                <button class="delete-btn">삭제</button>
                <button class="not-delete-btn">취소</button>
            </div>`


       document.querySelector(".delete-modal-content").innerHTML = tag;

       document.querySelector(".schedule-delete-modal").style.display="flex";

       deleteHandler();
   })
}

function deleteHandler() {

    document.querySelector(".delete-btn").addEventListener('click', async e => {
        const pageNo = document.querySelector('.prev').dataset.pno;


        // 삭제버튼 클릭시 삭제요청 보내기 위한 payload
        const payload = {
            scheduleNo: document.querySelector(".delete-content").dataset.sno,
        }

        await callApi(BASE_URL2, 'POST', payload);
        await fetchScheduleList(pageNo);

        document.querySelector(".schedule-delete-modal").style.display="none";
    });

    document.querySelector(".not-delete-btn").addEventListener("click", e => {
        document.querySelector(".schedule-delete-modal").style.display="none";
    })

}

function pageBtnHandler() {
    document.getElementById('wrap').addEventListener('click', e => {
        e.preventDefault();

        const $pagePrevBtn = document.querySelector('.prev');
        const $pageNextBtn = document.querySelector('.next');

        if(e.target !== $pageNextBtn && e.target !== $pagePrevBtn) return;

        const lastPage = $pageNextBtn.dataset.end;


        if(e.target === $pagePrevBtn) {

            if($pagePrevBtn.dataset.pno !== '1') {

                $pagePrevBtn.dataset.pno=(parseInt($pagePrevBtn.dataset.pno) - 1).toString();
                console.log($pagePrevBtn.dataset.pno)
            }
        } else if (e.target === $pageNextBtn) {
            if($pagePrevBtn.dataset.pno !== lastPage) {

                $pagePrevBtn.dataset.pno=(parseInt($pagePrevBtn.dataset.pno) + 1).toString();
                console.log($pagePrevBtn.dataset.pno)
            }
        }



        fetchScheduleList($pagePrevBtn.dataset.pno);

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
        const pageNo = document.querySelector('.prev').dataset.pno;

        $registerModal.style.display = 'none';

        await callApi(BASE_URL3, 'POST', payload);
        await fetchScheduleList(pageNo);

    })
}




export async function fetchScheduleList(pageNo = '1') {
    const clubNo = document.getElementById('club_no').firstElementChild.value;

    const scheduleResponse = await callApi(`${BASE_URL}/${clubNo}/page/${pageNo}`);


    const pageInfo = scheduleResponse.pageInfo;

    const scheduleList = scheduleResponse.scheduleList;
    const userInfoList = scheduleResponse.scheduleLoginUserInfoList;

    let schedule = '';

    if (scheduleList !== null && scheduleList.length > 0) {
        for (let i = 3*pageNo - 3; i < 3*(pageNo) && i < scheduleList.length; i++) {
            schedule += `
                  <div class="card-wrapper" data-no="${i}">
                    <div class="container" data-schedule_no="${scheduleList[i].scheduleNo}">
                        <div class="top-section" data-title="${scheduleList[i].scheduleTitle}">
                     `;
            // 관리자가 아니면 삭제 버튼이 안보이도록 설정
            if(userInfoList.length > 0) {
                for(const user of userInfoList) {
                    if(user.scheduleNo === scheduleList[i].scheduleNo && user.userScheduleRole === 'ADMIN') {
                        schedule += `
                                        <button class="del-btn a${i}" data-no="${i}">
                                            <i class="fi fi-rr-cross-circle"></i>
                                        </button>`;
                    }
                }
            }

            const scheduleAt = `${scheduleList[i].scheduleAt}`;
            const at = timeFormat(scheduleAt);

            schedule +=   `
                        </div>
                        <div class="middle-section">
                            <div class="view">
                                <i class="fi fi-ss-users-alt"></i> 
                                <span class="view-count">${scheduleList[i].scheduleCount}</span>
                            </div>
                            <div class="schedule-mini-content">
                                <h2>${scheduleList[i].scheduleTitle}</h2>
                                <p class="sContent">${scheduleList[i].scheduleContent}</p>
                                <p><i class="fi fi-rr-calendar-clock"></i> : <span>${at}</span></p>
                                <p><i class="fi fi-rs-coins"></i> : <span>${scheduleList[i].participationPoints}P</span></p>
                                <p class="account"><i class="fi fi-rs-user"></i>_ ${scheduleList[i].account}</p>
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

    const totalPage = pageInfo.end;





    document.querySelector(".next").dataset.end=pageInfo.end


    // document.getElementById('page-btn').innerHTML = buttonTag;


    document.querySelector('.card-container').innerHTML = schedule;


    // 이벤트 핸들러를 추가하기 위해 detailEventHandler 호출
    detailEventHandler();
}

function timeFormat(scheduleAt) {
    const aaa = scheduleAt.replace("T", " ");

    const fixAt = aaa.slice(0,16);


    const at = `${fixAt.slice(0,4)}` + "년 " + `${fixAt.slice(5, 7)}` + "월 " + `${fixAt.slice(8, 10)}` + "일 "
        + `${fixAt.slice(11, 13)}` + "시 " + `${fixAt.slice(14)}` + "분";
    console.log(at)
    return at;
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




