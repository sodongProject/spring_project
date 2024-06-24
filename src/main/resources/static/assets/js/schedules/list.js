import { callApi } from "./api.js";

const BASE_URL = 'http://localhost:8383/schedules/list';

const $addScheduleBtn = document.getElementById('add_schedule_button');

fetchScheduleList();
addScheduleBtnHandler();

function addScheduleBtnHandler() {
    $addScheduleBtn.addEventListener('click', async e => {
        e.preventDefault();

        const payload = {
            clubNo: document.getElementById('club_no').firstElementChild.value,
            scheduleTitle: document.getElementById('schedule_title').value,
            scheduleContent: document.getElementById('schedule_content').value,
            scheduleAt: document.getElementById('schedule_at').value,
        };

        await callApi(BASE_URL, 'POST', payload);
        await fetchScheduleList();
    });
}

export async function fetchScheduleList() {
    const clubNo = document.getElementById('club_no').firstElementChild.value;

    const scheduleResponse = await callApi(`${BASE_URL}/${clubNo}`);

    let schedule = '';

    console.log(scheduleResponse);

    if (scheduleResponse.length > 0) {
        for (const { scheduleNo, scheduleContent, scheduleTitle, scheduleViewCount, scheduleCount, scheduleAt } of scheduleResponse) {
            schedule += `
            <div class="card-wrapper">
                <div class="container" data-schedule_no="${scheduleNo}">
                    <div class="top-section">
                        <button class="del-btn" data-href="#">
                            <i class="fas fa-times"></i>
                        </button>
                        <i class='bx bxs-moon'></i>
                    </div>
                    <div class="middle-section">
                        <div class="view">
                            <i class="fas fa-eye"></i>
                            <span class="view-count">${scheduleViewCount}</span>
                        </div>
                        <h2>${scheduleTitle}</h2>
                        <p>${scheduleContent}</p>
                        <div class="social-media">
                            <i class='bx bxl-twitter'></i>
                            <i class='bx bxl-facebook'></i>
                            <i class='bx bxl-instagram'></i>
                        </div>
                        <div class="btnCenter">
                            <button type="button" class="btn" data-sno="${scheduleNo}">상세보기</button>
                            <button class="btn join-btn" data-href="#">가입하기</button>
                        </div>
                    </div>
                </div>
            </div>
            `;
        }
    } else {
        schedule = `<h1>스케줄이 존재하지 않습니다.</h1>`;
    }

    document.querySelector('.card-container').innerHTML = schedule;

    // 이벤트 핸들러를 추가하기 위해 detailEventHandler 호출
    detailEventHandler();
}

function detailEventHandler() {
    const detailButtons = document.querySelectorAll('.btnCenter .btn');
    detailButtons.forEach(button => {
        console.log('Adding event listener to button:', button); // 이벤트 리스너 추가 확인
        button.addEventListener('click', e => {
            e.preventDefault();
            console.log('Button clicked:', e.target.dataset.sno); // 버튼 클릭 확인
            window.location.href = `detail?scheduleNo=${e.target.dataset.sno}`;
        });
    });
}
