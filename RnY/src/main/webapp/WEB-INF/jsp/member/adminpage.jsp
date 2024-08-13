<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: Arial, sans-serif;
}

/* Layout */
body {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  background-color: #f8f8f8;
}

/* Sidebar */
.sidebar {
  width: 250px;
  background-color: #e6e6e6;
  padding: 20px;
  position: fixed;
  left: 0;
  top: 0;
  bottom: 0;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

/* Main Content */
.main-content {
  flex-grow: 1;
  margin-left: 250px; /* 사이드바의 너비만큼 왼쪽 여백 */
  padding: 40px;
  background-color: #fff;
}

/* Table & Pagination */
.notice-title {
  text-align: center;
  font-size: 24px;
  color: #555;
  margin-bottom: 40px;
}

.notice-table {
  width: 100%;
  border-collapse: collapse;
}

.notice-table th,
.notice-table td {
  padding: 15px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

.notice-table th {
  background-color: #f2f2f2;
  color: #333;
}

.notice-table tr:hover {
  background-color: #f9f9f9;
}

.notice-table tr td {
  color: #666;
}

.pagination {
  text-align: center;
  margin-top: 20px;
}

.pagination a {
  margin: 0 5px;
  text-decoration: none;
  color: #333;
  padding: 10px 15px;
  border: 1px solid #ddd;
  border-radius: 5px;
}

.pagination a:hover {
  background-color: #ddd;
}

.pagination .active {
  background-color: #33aaff;
  color: #fff;
  border: 1px solid #33aaff;
}

header, footer {
  display: none;
}
#footer-bottom{
display: none;
}
</style>

    <title>admin</title>

<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <div class="logo">
            <img src="images/logoDog.png" alt="logo" class="img-fluid">
            
        </div>
        <nav>
            <ul>
                <li><a href="#">공지사항</a></li>
                <li><a href="#">이벤트</a></li>
                <li><a href="#">팝업</a></li>
                <li><a href="#">정보수정</a></li>
            </ul>
        </nav>
        <div class="logout">
            <a href="#">로그아웃</a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="notice-title">
            <h1>NOTICE</h1>
            <p>공지사항입니다.</p>
        </div>
        <table class="notice-table">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>4</td>
                    <td>2023 휴무일 안내</td>
                    <td>관리자</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>서비스 업데이트 공지</td>
                    <td>관리자</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>새로운 기능 추가 안내</td>
                    <td>관리자</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>할인 이벤트 안내</td>
                    <td>관리자</td>
                </tr>
            </tbody>
        </table>

        <div class="pagination">
            <a href="#">&laquo;</a>
            <a href="#">1</a>
            <a class="active" href="#">2</a>
            <a href="#">3</a>
            <a href="#">&raquo;</a>
        </div>
    </div>


</body>
