<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<title>리뷰 작성</title>
<style>
/* 리뷰 작성 섹션 스타일 */
.review-container {
	text-align: center;
	margin: 50px auto;
	max-width: 600px;
	border: 1px solid #ddd;
	padding: 30px;
	border-radius: 10px;
	background-color: #f9f9f9;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.review-container h2 {
	font-size: 28px;
	font-weight: bold;
	margin-bottom: 20px;
}

.review-container input[type="text"], .review-container textarea {
	width: 100%;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
	box-sizing: border-box;
}

.review-container textarea {
	height: 150px;
	resize: none;
}

.review-container button {
	background-color: #007bff;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
	margin-top: 20px;
	display: inline-block;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.review-container button:hover {
	background-color: #0056b3;
}

.back-button-container {
	text-align: center;
	margin-top: 20px;
}

.back-button {
	background-color: #007bff;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
	margin-top: 20px;
	display: inline-block;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.back-button:hover {
	background-color: #0056b3;
}
</style>


	<div class="container review-container">
		<h2>리뷰 작성</h2>
		<form action="reviewList.do" method="post" enctype="multipart/form-data">
		<div>
			<input type="hidden" class="form-control" id=userNo name="userNo" value="${userNo}" readonly="readonly">
		</div>
			<input type="text" id="reviewTitle" name="reviewTitle" placeholder="리뷰 제목" required>
			<textarea id="reviewContent" name="reviewContent" placeholder="리뷰 내용을 입력하세요" required></textarea>
			<input type="file" id="reviewImage" name="reviewImage">
			<button type="submit">리뷰 등록</button>
		</form>
	</div>

	<!-- 뒤로가기 버튼 추가 -->
	<div class="back-button-container">
		<button class="back-button" onclick="goBackAndRefresh()">뒤로가기</button>
	</div>

	<script>
		function goBackAndRefresh() {
			window.history.back(); // 뒤로가기
			window.location.href = document.referrer; // 이전 페이지로 이동 후 새로고침
		}
	</script>


