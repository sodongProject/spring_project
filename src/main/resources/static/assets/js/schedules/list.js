import {callApi} from "./api.js";

const BASE_URL = 'http://localhost:8383/schedules/list'

const $addScheduleBtn = document.getElementById('add_schedule_button');

fetchScheduleList();
addScheduleBtnHandler();

function addScheduleBtnHandler () {
    $addScheduleBtn.addEventListener('click',  async e=> {
        e.preventDefault();

        const payload = {
            clubNo:document.getElementById('club_no').firstElementChild.value,
            scheduleTitle:document.getElementById('schedule_title').value,
            scheduleContent:document.getElementById('schedule_content').value,
            scheduleAt:document.getElementById('schedule_at').value,
        }

        await callApi(BASE_URL, 'POST', payload);





        await fetchScheduleList();
    });
}


export async function fetchScheduleList() {
    const clubNo = document.getElementById('club_no').firstElementChild.value;

    const scheduleResponse
        = await callApi(`${BASE_URL}/${clubNo}`)

    let schedule= ''

    console.log(scheduleResponse);

    const schedules = {scheduleResponse};
    console.log(schedules);

    if(schedules) {
        for (const {scheduleNo, scheduleTitle, scheduleViewCount, scheduleCount, scheduleAt} of scheduleResponse) {
            schedule += `
            <div id="aaa">
            <p class="schedule_list_title">스케줄 제목 : ${scheduleTitle}</p>
            <p class="schedule_list_writer">스케줄 번호 : ${scheduleNo}</p>
            <p class="schedule_list_content">스케줄 내용 : ${scheduleCount}</p>
            <p class="schedule_list_at">스케줄 모임 날짜/시간 : ${scheduleAt}</p>
            <p class="schedule_list_count">참여자 수 : ${scheduleCount}</p>
            <button type="button" id="detail_btn">상세보기</button>
            </div>
            
            `
        }
    } else {
        schedule = `
        <h1>스케줄이 존재하지 않습니다.</h1>
        `
    }

    document.getElementById('schedule_box').innerHTML = schedule;
}



