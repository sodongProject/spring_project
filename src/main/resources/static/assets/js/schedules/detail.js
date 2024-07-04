import { callApi } from "./api.js";

let BASE_URL = 'http://localhost:8383/schedules/detail';

detailModalContent();

// openRegisterModal();
// registerBtnHandler();
//
async function applicationUserList  () {
    const $registerModalBtn = document.querySelector('.register-list');
    $registerModalBtn.addEventListener('click', async e=>{
        document.getElementById('register-list-modal').style.display='flex';

        const scheduleNo = document.getElementById("schedule_detail").dataset.sno;
        const cno = document.getElementById("schedule_detail").dataset.cno;

        const applicationUserListResponse = await callApi(`${BASE_URL}/${scheduleNo}/participationUsers`);

        console.log("ㅂㅈㄷㅂㅈㄷㅂㅈㄷ", applicationUserListResponse);
        let tag = '';
        if(applicationUserListResponse.length > 0) {
            for (const user of applicationUserListResponse) {
                tag +=
                    `<div class="application-user-info" data-account="${user.account}">
                <div class="user-info">
                    <span class="user-name">신청인 : ${user.userName}</span>
                    <span class="user-temperature">유저 온도 : ${user.temperature}</span>
                </div>
                <div class="register-btn">
                    <button class="accept-btn">수락</button>
                    <button class="refuse-btn">거절</button>
                </div>
            </div>`;
            }
        } else {
            tag += `<h1>신청자가 없습니다.</h1>`
        }

        const $userListContainer = document.querySelector('.register-modal-content');

        $userListContainer.innerHTML=tag;
        console.log('tag추가는 되는듯?')
    });
}


function registerBtnHandler() {
    document.querySelector(`.register-modal-content`).addEventListener('click', async e => {
        e.preventDefault();

        let isBtn = false;
        let isAccpet = false;

        const $acceptBtn = document.querySelectorAll('.accept-btn');

        for (const $aBtn of $acceptBtn) {
            if(e.target === $aBtn) {
                isBtn = true;
                isAccpet = true;
            }
        }

        const $refuseBtn = document.querySelectorAll('.refuse-btn');

        for (const $rBtn of $refuseBtn) {
            if(e.target === $rBtn) {
                isBtn = true;
            }
        }

        if(!isBtn) return;

        const payload = {
            accept: isAccpet,
            scheduleNo: document.getElementById('schedule_detail').dataset.sno,
            clubNo: document.getElementById('schedule_detail').dataset.cno,
            account: e.target.closest('.application-user-info').dataset.account,
        }

        console.log(payload);

        await callApi(BASE_URL, 'POST', payload);
        applicationUserList();

    });
}

    function detailModalContent() {
        document.querySelector(".card-container").addEventListener('click', async e => {
            e.preventDefault();

            const $detailBtns = document.querySelectorAll(".detail-btn");

            let isDetailBtn = false;
            for (const $detailBtn of $detailBtns) {
                if(e.target === $detailBtn) isDetailBtn = true;
            }

            if(!isDetailBtn) return;

            const scheduleNo = e.target.dataset.sno;

            const scheduleDetailResponse = await callApi(`${BASE_URL}/${scheduleNo}`);

            console.log("1111111111111111111", scheduleDetailResponse);

            const {loginUserInfoDto, schedule} = scheduleDetailResponse;

            console.log(scheduleDetailResponse.loginUserInfoDto)

            let tag = '';

            if(loginUserInfoDto.userScheduleRole === 'ADMIN') {
                tag += `<div class="register-list">
                            <button>신청관리</button>
                        </div>`
            }

            tag += `<h1>${loginUserInfoDto.userScheduleRole}</h1>
                    <h1 id="schedule_detail" data-sno="${schedule.scheduleNo}" data-cno="${schedule.clubNo}">스케줄 상세보기</h1>
                    <div>제목${schedule.scheduleTitle}</div>
                    <div>스케줄 생성 시간 ${schedule.scheduleContent}</div>
                    <div>스케줄 조회수 ${schedule.scheduleViewCount}</div>
                    <div>스케줄 주최자 ${schedule.account}</div>
                    <div>스케줄 일자 ${schedule.scheduleAt}</div>
                    <div>스케줄 참여 인원 ${schedule.scheduleCount}</div>
                    <div>회비 ${schedule.participationPoints}</div>`

            document.querySelector(".detail-modal-content").innerHTML = tag;

            applicationUserList();
        });
    }
