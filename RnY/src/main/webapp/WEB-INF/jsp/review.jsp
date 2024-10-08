<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
/* 리뷰 섹션 스타일 */
.review-container {
	text-align: center;
	margin: 20px auto;
	max-width: 600px;
	border: 1px solid #ddd;
	padding: 20px;
	border-radius: 10px;
	background-color: #f9f9f9;
}

.review-container img {
	max-width: 100%;
	height: auto;
	border-radius: 10px;
	margin-bottom: 15px;
}

.review-title {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 10px;
}

.review-meta {
	font-size: 14px;
	color: #777;
	margin-bottom: 20px;
	line-height: 1.5;
}

.review-content {
	font-size: 16px;
	margin-bottom: 20px;
	text-align: left; /* 내용은 왼쪽 정렬 */
}

.review-like {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 16px;
	color: #333;
}

.review-like i {
	margin-right: 5px;
	color: #ff6b6b;
}

.review-like span {
	font-weight: bold;
}

/* 뒤로가기 버튼 스타일 */
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
	margin-top: 20px; /* 상단 네모 영역과의 간격 */
	display: inline-block; /* 버튼을 인라인 블록으로 설정 */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* 버튼에 그림자 추가 */
}

.back-button:hover {
	background-color: #0056b3;
}
</style>

<section class="blog_area single-post-area padding_top">
	<div class="container review-container">
		<div class="row justify-content-center">
			<div class="col-lg-8 posts-list">
				<div class="single-post">
					<div class="feature-img">
						<img class="img-fluid" src="images/chan/${rvo.reviewImage}" alt="review">
					</div>
					<div class="blog_details">
						<h2 class="review-title">${rvo.reviewTitle}</h2>
						<ul class="blog-info-link mt-3 mb-4 review-meta">
							<p>
								<a href="#">글번호 : ${rvo.reviewNum}</a><br>
								<a href="#">작성자 : ${rvo.userId}</a><br>
								<a href="#">작성일자 : <fmt:formatDate pattern="yyyy-MM-dd" value="${rvo.reviewDate}" /></a><br>
							</p>
						</ul>
						<p class="excert review-content">${rvo.reviewContent}</p>
						<div class="review-like">
							<span class="addLike" onclick="likeReview(${rvo.reviewNum})">
								<i class="bi bi-hand-thumbs-up"></i> 좋아요
							</span> 
							<span class="likeCount"> ${rvo.reviewLike} </span> 
							<input type="hidden" id="reviewNum=${rvo.reviewNum}" value="${rvo.reviewNum}" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 뒤로가기 버튼 추가 -->
	<div class="back-button-container">
		<button class="back-button" onclick="goBackAndRefresh()">뒤로가기</button>
	</div>
</section>

<script src="js/chan/like.js"></script>

<script>
	function goBackAndRefresh() {
		window.history.back(); // 뒤로가기
		window.location.href = document.referrer; // 이전 페이지로 이동 후 새로고침
	}
</script>
