<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Sodong</title>
    <style>
      body {
        font-family: Arial, sans-serif;
      }
      .header {
        background-color: #007bff;
        color: white;
        padding: 10px;
      }
      .container {
        width: 80%;
        margin: 0 auto;
      }
      table {
        width: 100%;
        border-collapse: collapse;
      }
      table,
      th,
      td {
        border: 1px solid #dddddd;
      }
      th,
      td {
        padding: 8px;
        text-align: center;
      }
      th {
        background-color: #f2f2f2;
      }
      .pagination {
        text-align: center;
        margin-top: 10px;
      }
    </style>
  </head>
  <body>
    <div class="header">
      <h1>Sodong</h1>
    </div>
    <div class="container">
      <h2>Sodong 공지사항</h2>
      <p>공지사항을 만나 공지사항을 확인합니다.</p>
      <form>
        <input type="date" name="start_date" />
        <input type="date" name="end_date" />
        <button type="submit">검색</button>
      </form>
      <table>
        <tr>
          <th>번호</th>
          <th>제목</th>
          <th>작성자</th>
          <th>작성일자</th>
          <th>조회수</th>
        </tr>
        <c:if test="${list.size() > 0}">
          <c:forEach var="b" items="${list}">
            <tr>
              <td>${b.mainNoticeNo}</td>
              <td>${b.mainNoticeTitle}</td>
              <td>관리자</td>
              <td>${b.mainNoticeCreatedAt}</td>
              <td>${b.mainNoticeViewCount}</td>
            </tr>
          </c:forEach>
        </c:if>
      </table>
      <div class="pagination">
        <button>&lt;</button>
        <button>1</button>
        <button>2</button>
        <button>3</button>
        <button>&gt;</button>
      </div>
    </div>
  </body>
</html>
