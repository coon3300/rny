<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
body {
	font-family: 'Arial', sans-serif;
	text-align: center;
}

.review-section {
	width: 70%;
	margin: 0 auto;
}

h2 {
	font-size: 24px;
}

p {
	color: #999;
}

hr {
	width: 50px;
	border: 1px solid #000;
	margin: 10px auto;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

table tr {
	border-bottom: 1px solid #ddd;
}

table td {
	padding: 10px;
	text-align: left;
	vertical-align: middle;
}

table img {
	width: 50px;
	height: 50px;
	object-fit: cover;
	margin-right: 10px;
}

table .rating {
	text-align: center;
	font-size: 18px;
}

.navigation {
	margin-top: 20px;
}

.navigation button {
	padding: 10px 20px;
	margin: 5px;
	border: none;
	background-color: #333;
	color: #fff;
	cursor: pointer;
}

.navigation button:hover {
	background-color: #555;
}
</style>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰 페이지</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
	<section id="blog" class="blog">
		<div class="container">
			<div class="section-header">
				<h2>REVIEW</h2>
				<p>상품 사용후기입니다.</p>
				<hr>
			</div>
			<div class="blog-content">
				<table class="table table-striped">
					<tbody>
						<c:forEach var="review" items="${reviewList}">
							<tr>
								<td style="width: 50px;"><img
									src="images/chan/${review.reviewImage}" alt="review image"
									style="width: 50px; height: 50px; object-fit: cover;"></td>
								<td><a href="review.do?reviewNum=${review.reviewNum}">
										${review.reviewTitle} </a> <br> <small> 작성자:
										${review.userId} | 상품코드: ${review.itemNo} | 작성일자: <fmt:formatDate
											pattern="yyyy-MM-dd" value="${review.reviewDate}" />
								</small></td>
								<td><span class="addLike"
									onclick="likeReview(${review.reviewNum})"> <i
										class="bi bi-hand-thumbs-up"></i> 좋아요
								</span> <span class="likeCount" id="likeCount=${review.reviewNum}">${review.reviewLike}</span>
									<input type="hidden" id="reviewNum=${review.reviewNum}"
									value="${review.reviewNum}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</section>

	<!-- 페이징 -->
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<!-- PREV 페이지 존재 -->
			<c:if test="${page.prev}">
				<li class="page-item"><a class="page-link"
					href="reviewList.do?page=${page.page-1}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>

			<!-- 페이지 갯수만큼 링크생성 -->
			<c:forEach var="p" begin="${page.startPage}" end="${page.endPage}">
				<c:choose>
					<c:when test="${page.page == p}">
						<li class="page-item active" aria-current="page"><span
							class="page-link">${p}</span></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="reviewList.do?page=${p}">${p}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<!-- NEXT 페이지 존재 -->
			<c:if test="${page.next}">
				<li class="page-item"><a class="page-link"
					href="reviewList.do?page=${page.endPage + 1}" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
		</ul>
	</nav>
</body>
<script src="js/chan/reviewLike.js"></script>
</html>