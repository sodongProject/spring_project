// 서버 api 호출을 수행하는 함수
export const callApi = async (url, method='GET', payload=null) => {

    console.log('call api!: ', url)
    const requestInfo = {
        method,
    };

    if (payload) {
        requestInfo.headers = {'content-type': 'application/json'};
        requestInfo.body = JSON.stringify(payload);
    }

    const res = await fetch(url, requestInfo);

    if (res.status === 403) {
        alert('접근 권한이 없습니다.');
        window.location.href='/schedules/index';
        return null;
    }

    let resData = res.json();
    if (resData) return await resData;
    return null;
};