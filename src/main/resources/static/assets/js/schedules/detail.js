import { callApi } from "./api.js";
import {timeFormat} from "./list.js";

let BASE_URL = 'http://localhost:8383/schedules/detail';

detailModalContent();
registerBtnHandler();
closeRegisterListModal();
closeDetailModal();
openUserListModal();
closeScheduleMemberModal();
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
            tag += `<h1 id="no-member">신청자가 없습니다.</h1>`
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
                            <i class="fi fi-ss-users-alt"></i>                           
                            <button class="schedule-member-btn">  <span>${schedule.scheduleCount}</span></button>
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

            const targetScheduleAt = schedule.scheduleAt;
            const at = timeFormat(targetScheduleAt);

            const targetCreatedAt = schedule.scheduleCreatedAt;
            const created = timeFormat(targetCreatedAt);

            tag += `
                    <h1 id="schedule_detail" data-sno="${schedule.scheduleNo}" data-cno="${schedule.clubNo}" hidden></h1>
                    <div class="detail-title">${schedule.scheduleTitle}</div>
                    <div class="detail-account"><i class="fi fi-rs-user"></i>_ ${schedule.account}</div>
                    <div class="detail-content">${schedule.scheduleContent}</div>                 
                    <div class="detail-a"><i class="fi fi-rr-calendar-clock"></i> ${at}</div>
                    <div class="detail-created"><i class="fi fi-rs-calendar"></i> ${created}</div>
                    <div class="detail-a"><i class="fi fi-rs-coins"></i> ${schedule.participationPoints}</div>`

            document.querySelector(".detail-modal-content").innerHTML = tag;

            applicationUserList();
            openUserListModal ();
        });
    }




function closeRegisterListModal () {
    const $registerListModal = document.getElementById("register-list-modal");
    $registerListModal.addEventListener('click', e => {
        if(e.target !== $registerListModal) return;

        $registerListModal.style.display = 'none';
    })
}

function closeDetailModal () {
    const $scheduleDetailModal = document.getElementById("detail-modal");
    $scheduleDetailModal.addEventListener('click', e => {
        if(e.target !== $scheduleDetailModal) return;

        $scheduleDetailModal.style.display = 'none';
    })
}

function closeScheduleMemberModal () {
    const $scheduleMemberModal = document.querySelector(".schedule-member-modal");
    $scheduleMemberModal.addEventListener('click', e => {
        if(e.target !== $scheduleMemberModal) return;

        $scheduleMemberModal.style.display = 'none';
    })
}

function openUserListModal () {
    const $scheduleMemberList = document.querySelector(".schedule_members");

    $scheduleMemberList?.addEventListener("click", async e => {
        document.querySelector(".schedule-member-modal").style.display = 'flex';

        fetchScheduleMember();
    });
}

async function fetchScheduleMember () {
    const scheduleNo = document.getElementById("schedule_detail").dataset.sno;

    const scheduleMembers = await callApi(`${BASE_URL}/member/${scheduleNo}`);

    let tag = '';
    for (const user of scheduleMembers) {
        tag +=  `
            <div class="member-list">
                <div class="member-info" data-account="${user.account}">
                    <span class="user-name">이름 : ${user.userName}</span>
                    <span class="user-temperature">유저 온도 : ${user.temperature}</span>
                </div>
                <div class="member-exile-btn">
                    <button class="exile-btn">추방</button>
                </div>
            </div>
            `
    }

    document.querySelector(".schedule-member-modal-content").innerHTML = tag;
    exileHandler();
}

function exileHandler () {
    let exileBtns = document.querySelectorAll(".member-exile-btn");

    for (const exileBtn of exileBtns) {
        exileBtn.addEventListener('click', async e=> {
            console.log("추방!!!!")
            const sno = document.getElementById("schedule_detail").dataset.sno;
            const cno = document.getElementById("schedule_detail").dataset.cno;
            let userAccount = e.target.closest(".member-list").firstElementChild.dataset.account;

            const payload = {
                clubNo : cno,
                scheduleNo : sno,
                account : userAccount,
            }
            const exileURL = BASE_URL + "/exile"
            await callApi(exileURL, 'POST', payload);
            await fetchScheduleMember();

        });
    }


}

