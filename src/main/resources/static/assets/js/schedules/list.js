import { callApi } from "./api.js";

const BASE_URL = 'http://localhost:8383/schedules/list';

const $addScheduleBtn = document.getElementById('add_schedule_button');

fetchScheduleList();
addScheduleBtnHandler();
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

function pageBtnHandler() {
    document.getElementById('page-btn-box').addEventListener('click', e => {
        e.preventDefault();
        const $pageBtn = document.querySelectorAll('.page-link');
        for (const $pageBtnElement of $pageBtn) {
            if(e.target === $pageBtnElement) {
                const pageNo = e.target.dataset.page;
                console.log(pageNo);
                console.log(typeof pageNo);
                fetchScheduleList(pageNo);
            }
        }

    })
}

function renderPage({ begin, end, pageInfo, prev, next }) {
    let tag = '';

    const clubNo = document.getElementById('club_no').firstElementChild.value;
    // prev 만들기
    if (prev)
        tag += `<li class='page-item'><a class='page-link page-active' href='${
            begin - 1
        }'>이전</a></li>`;

    // 페이지 번호 태그 만들기
    for (let i = begin; i <= end; i++) {
        let active = '';
        if (pageInfo.pageNo === i) active = 'p-active';

        tag += `
      <li class='page-item ${active}'>
        <a class='page-link page-custom' href="${i}" data-page="${i}">${i}</a>
      </li>`;
    }

    return tag;
}

export async function fetchScheduleList(pageNo = 1) {
    const clubNo = document.getElementById('club_no').firstElementChild.value;

    const scheduleResponse = await callApi(`${BASE_URL}/${clubNo}/page/${pageNo}`);
    const scheduleList = scheduleResponse.scheduleList;
    console.log(scheduleList);
    let schedule = '';

    console.log(scheduleResponse);

    if (scheduleList.length > 0) {
        for (let i = 3*pageNo - 3; i < 3*(pageNo) && i < scheduleList.length; i++) {
            schedule += `<div class="card-wrapper">
                    <div class="container" data-schedule_no="${scheduleList[i].scheduleNo}">
                        <div class="top-section">
                            <button class="del-btn" data-href="#">
                                <i class="fas fa-times"></i>
                            </button>
                            <i class='bx bxs-moon'></i>
                        </div>
                        <div class="middle-section">
                            <div class="view">
                                <i class="fas fa-eye"></i>
                                <span class="view-count">${scheduleList[i].scheduleViewCount}</span>
                            </div>
                            <h2>${scheduleList[i].scheduleTitle}</h2>
                            <p>${scheduleList[i].scheduleContent}</p>
                            <p>참가비 : ${scheduleList[i].participationPoints}</p>
                            <div class="social-media">
                                <i class='bx bxl-twitter'></i>
                                <i class='bx bxl-facebook'></i>
                                <i class='bx bxl-instagram'></i>
                            </div>
                            <div class="btnCenter">
                                <button type="button" class="btn" data-sno="${scheduleList[i].scheduleNo}">상세보기</button>
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

    const buttonTag = renderPage(scheduleResponse.pageInfo);
    document.getElementById('page-btn').innerHTML = buttonTag;

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
