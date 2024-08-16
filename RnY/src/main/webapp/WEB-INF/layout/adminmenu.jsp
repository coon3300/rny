<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.cart_area {
    margin-left: 250px; /* 사이드바의 너비에 따라 조정 */
    padding-top: 20px;  /* 기존 패딩 유지 */
}

.container {
    display: flex;
}

.sidebar {
    width: 250px; /* 사이드바의 너비 */
}

.cart_area {
    flex-grow: 1; /* 남은 공간을 차지하도록 설정 */
    padding-top: 20px;
}
</style>
<!-- Sidebar -->
<div class="sidebar">
	<div class="logo">
		<img src="images/logoDog.png" alt="logo" class="img-fluid">

	</div>
	<nav>
		<ul>
			<li><a href="noticeAdm.do">공지사항</a></li>
			<li><a href="#">이벤트</a></li>
			<li><a href="#">팝업</a></li>
			<li><a href="memberList.do">정보수정</a></li>
		</ul>
	</nav>
	<div class="logout">
		<a href="main.do">로그아웃</a>
	</div>
</div>