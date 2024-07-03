import { callApi } from "./api.js";

let BASE_URL = 'http://localhost:8383/schedules/detail';

applicationUserList();
openRegisterModal();
registerBtnHandler();

async function applicationUserList  () {

    const scheduleNo = document.getElementById("schedule_detail").dataset.sno;
    const cno = document.getElementById("schedule_detail").dataset.cno;

    const applicationUserListResponse = await callApi(`${BASE_URL}/${scheduleNo}`);

    console.log(applicationUserListResponse);
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

}

function openRegisterModal () {
    const $registerModalBtn = document.querySelector('.register-list');
    $registerModalBtn.addEventListener('click', e=>{
        document.getElementById('register-list-modal').style.display='flex';
    })
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