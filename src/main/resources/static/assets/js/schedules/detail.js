import { callApi } from "./api.js";

let BASE_URL = 'http://localhost:8383/schedules/detail';

applicationUserList();
openRegisterModal();

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