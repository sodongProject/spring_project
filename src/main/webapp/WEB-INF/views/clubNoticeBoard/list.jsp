<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <title>공지사항</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            width: 800px;
            margin: 20px auto;
        }

        .notice {
            margin-bottom: 20px;
            padding: 20px;
            border: 1px solid #ccc;
        }

        .notice-header {
            margin-bottom: 20px;
        }

        .notice-title {
            font-size: 24px;
            color: #333;
        }

        .notice-info {
            font-size: 14px;
            color: #666;
        }

        .notice-content {
            font-size: 16px;
            color: #444;
        }

        .new-notice-button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-align: center;
            display: block;
            margin: 20px auto;
            width: 200px;
            cursor: pointer;
            text-decoration: none;
        }

        /* 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            z-index: 9999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            align-items: center;
            justify-content: center;
            padding: 50px;
        }

        .modal-content {
            position: relative;
            background-color: #fff;
            width: 300px;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
        }

        .modal-content p {
            font-size: 24px;
            margin-bottom: 15px;
        }

        .modal-buttons button {
            padding: 5px 15px;
            font-size: 20px;
        }

        .modal-buttons .confirm {
            color: black;
            border-radius: 4px;
        }

        .modal-buttons .cancel {
            color: black;
            border-radius: 4px;
        }

        .del-btn {
            background: none;
            border: none;
            color: black;
            cursor: pointer;
            font-size: 1.2em;
        }

    </style>
</head>

<body>
<div class="container">
    <a href="/clubNoticeBoard/write?clubNo=${clubNo}" class="new-notice-button">새 공지사항 작성</a>

    <c:forEach var="b" items="${CNBList}">
        <div class="notice" data-bno="${b.clubNoticeNo}">
            <div class="top-section">
                <button class="del-btn" data-href="/clubNoticeBoard/delete?clubNoticeNo=${b.clubNoticeNo}">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div class="notice-header">
                <div class="notice-title">제목: ${b.shortTitle}</div>
                <div class="notice-info">작성자: ${b.account}</div>
                <div class="notice-date">작성일: ${b.date}</div>
                <div class="view">
                    <i class="fas fa-eye"></i>
                    <span class="view-count">${b.view}</span>
                </div>
            </div>
            <div class="notice-content">
                    ${b.shortContent}
            </div>
        </div>
    </c:forEach>
</div>

<div class="modal" id="modal">
    <div class="modal-content">
        <p>정말로 삭제할까요?</p>
        <div class="modal-buttons">
            <button class="confirm" id="confirmDelete"><i class="fas fa-check"></i> 예</button>
            <button class="cancel" id="cancelDelete"><i class="fas fa-times"></i> 아니오</button>
        </div>
    </div>
</div>

<script>
    const $cardContainer = document.querySelector('.container');
    const modal = document.getElementById('modal');
    const confirmDelete = document.getElementById('confirmDelete');
    const cancelDelete = document.getElementById('cancelDelete');

    $cardContainer.addEventListener('click', e => {
        if (e.target.closest('.del-btn')) {
            e.preventDefault();
            modal.style.display = 'flex';
            const deleteLocation = e.target.closest('.del-btn').dataset.href;
            confirmDelete.onclick = () => {
                window.location.href = deleteLocation;
                modal.style.display = 'none';
            };
            cancelDelete.onclick = () => {
                modal.style.display = 'none';
            };
        } else if (e.target.closest('.notice')) {
            const bno = e.target.closest('.notice').dataset.bno;
            window.location.href = '/clubNoticeBoard/detail?clubNoticeNo=' + bno;
        }
    });

    window.addEventListener('click', e => {
        if (e.target === modal) {
            modal.style.display = 'none';
        }
    });
</script>
</body>
</html>
