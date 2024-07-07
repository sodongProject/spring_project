import { callApi } from "./api.js";

let BASE_URL = 'http://localhost:8383/schedules/detail';

detailModalContent();
registerBtnHandler();
// openRegisterModal();
// registerBtnHandler();
//
async function applicationUserList  () {

    openRegisterModalHandler();

        const scheduleNo = document.getElementById("schedule_detail").dataset.sno;
        const cno = document.getElementById("schedule_detail").dataset.cno;

        const applicationUserListResponse = await callApi(`${BASE_URL}/${scheduleNo}/participationUsers`);

        let tag = '';
        if(applicationUserListResponse.length > 0) {
            for (const user of applicationUserListResponse) {
                tag +=
                    `<div class="application-user-info" data-account="${user.account}">
                <div class="user-info">
                    <span class="user-name">신청인 : ${user.userName}</span>
                    <span class="user-temperature">유저 온도 : ${user.temperature}</span>
                </div>
                <div class="register-list-btn">
                    <button class="accept-btn">수락</button>
                    <button class="refuse-btn">거절</button>
                </div>
            </div>`;
            }
        } else {
            tag += `<h1>신청자가 없습니다.</h1>`
        }

        const $userListContainer = document.querySelector('.register-list-modal-content');

        $userListContainer.innerHTML=tag;

}

function openRegisterModalHandler() {
    const $registerModalBtn = document.querySelector('.register-list');
    if($registerModalBtn === null) return;
    $registerModalBtn.addEventListener('click', async e=>{
        document.getElementById('register-list-modal').style.display='flex';
});
};


function registerBtnHandler() {
    document.querySelector(`.register-list-modal-content`).addEventListener('click', async e => {
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


        await callApi(BASE_URL, 'POST', payload);
        await applicationUserList();

    });
}

    function detailModalContent() {
        document.querySelector(".card-container").addEventListener('click', async e => {
            e.preventDefault();

            const $detailBtns = document.querySelectorAll(".detail-btn");
            let scheduleNo = 0;

            let isDetailBtn = false;
            for (const $detailBtn of $detailBtns) {
                if(e.target === $detailBtn) {
                    isDetailBtn = true;
                    scheduleNo = e.target.dataset.sno;
                }
            }

            if(!isDetailBtn) return;

            const scheduleDetailResponse = await callApi(`${BASE_URL}/${scheduleNo}`);

            const {loginUserInfoDto, schedule} = scheduleDetailResponse;

            console.log(loginUserInfoDto);
            let tag = '';
            if(loginUserInfoDto !== null) {
                if(loginUserInfoDto.userScheduleRole !== null) {
                    if(loginUserInfoDto.userScheduleRole === 'ADMIN') {
                        tag += `<div class="register-list">
                            <button class="register-admin-btn">신청관리</button>
                        </div>
                        <div class="schedule_members">
                            <button class="schedule-member-btn">참가자 조회</button>
                        </div>
                        
                        `
                    } else if (loginUserInfoDto.userScheduleRole === 'MEMBER') {
                        tag += `
                        <div class="out-schedule">
                            <button class="out-schedule-btn">소모임 탈퇴</button>
                        </div>
                        `
                    }
                }
            }

            tag += `
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
