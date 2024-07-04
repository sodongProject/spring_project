<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>클럽 만들기</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <link rel="stylesheet" href="/assets/css/club/write.css">
    <script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>

</head>
<body>
<div id="wrap" class="form-container">
    <h1>소동 만들기</h1>
    <form action="/club/write" method="post" enctype="multipart/form-data" name="write">
        <div class="profile">
            <div class="thumbnail-box">
                <img
                        src="/assets/img/club/image-add.png"
                        alt="프로필 썸네일"
                />
            </div>

            <label>프로필 이미지 추가</label>

            <input
                    type="file"
                    id="profile-img"
                    accept="image/*"
                    style="display: none"
                    name="clubProfile"
            />
        </div>
        <label for="writer">작성자</label>
        <input type="text" id="writer" name="writer" value="${login.account}" readonly>
        <label for="title">제목</label>
        <input type="text" id="title" name="title" required>
        <label for="content">내용</label>
        <textarea id="content" name="content" required></textarea>
        <label for="clubCompetition">대회 참여 여부</label>
        <input type="checkbox" id="clubCompetition" name="clubCompetition" value="true">
        <div class="buttons">
            <button class="list-btn" type="button" onclick="window.location.href='/club/list'">목록</button>
            <button type="submit">글쓰기</button>
        </div>
    </form>
</div>
<script>
    CKEDITOR.replace('content');

    // 프로필 사진 동그라미 썸네일 부분
    const $profile = document.querySelector('.profile');
    // 실제 프로필사진이 첨부될 input
    const $fileInput = document.getElementById('profile-img');

    $profile.addEventListener('click', e => {
        $fileInput.click();
    });

    // 프로필 사진 선택시 썸네일 보여주기
    $fileInput.addEventListener('change', e => {
        console.log('file changed!');
        // 사용자가 첨부한 파일 데이터 읽기
        const fileData = $fileInput.files[0];
        // console.log(fileData);

        // 첨부파일 이미지의 로우데이터(바이트)를 읽는 객체 생성
        const reader = new FileReader();

        // 파일의 데이터를 읽어서 img 태그에 src 속성에 넣기 위해
        // 파일을 URL 형태로 변경
        reader.readAsDataURL(fileData);

        // 첨부파일이 등록되는 순간 img 태그에 이미지를 세팅
        reader.onloadend = e => {
            const $img = document.querySelector('.thumbnail-box img');
            $img.src = reader.result;
        };

    });



</script>
</body>
</html>
