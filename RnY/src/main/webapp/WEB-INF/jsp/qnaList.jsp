<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f9f9f9;
	margin: 0;
	padding: 20px;
}

.qa-container {
	width: 80%;
	margin: 0 auto;
	background-color: white;
	padding: 20px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}

h2 {
	text-align: center;
	font-size: 24px;
	margin-bottom: 5px;
}

p {
	text-align: center;
	font-size: 16px;
	color: #777;
}

hr {
	width: 50px;
	border: 1px solid #ddd;
	margin: 20px auto;
}

.qa-table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px 0;
	font-size: 14px;
}

.qa-table th, .qa-table td {
	padding: 12px 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

.qa-table th {
	background-color: #f2f2f2;
	font-weight: bold;
}

.qa-table td {
	vertical-align: middle;
}

/* 이미지 크기를 조절하기 위한 스타일 */
.qa-table img {
	max-width: 50px;
	max-height: 50px;
	object-fit: cover;
	border-radius: 5px;
}

.qa-footer {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 20px;
}

.qa-footer .btn {
	background-color: #333;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	text-align: center;
	font-size: 14px;
}

.qa-footer .btn:hover {
	background-color: #555;
}

.pagination {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.pagination li {
	display: inline;
}

.pagination li a, .pagination li span {
	display: block;
	padding: 8px 12px;
	margin: 0 3px;
	color: #007bff;
	text-decoration: none;
	border-radius: 5px;
	border: 1px solid #dee2e6;
}

.pagination li a:hover {
	background-color: #007bff;
	color: white;
}

.pagination li.active span {
	background-color: #007bff;
	color: white;
	border-color: #007bff;
}
</style>

<body>

	<div class="qa-container">
		<h2>Q & A</h2>
		<p>상품 Q&A입니다.</p>
		<hr>

		<!-- Q&A 테이블 -->
		<table class="qa-table">
			<thead>
				<tr>
					<th>번호</th>
					<th>문의유형</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="qna" items="${qnaPaging}">
					<tr>
						<td><a href="qna.do?qnaNum=${qna.qnaNum}">${qna.qnaNum}</a></td>
						<td>${qna.qnaType}</td>
						<td><a href="qna.do?qnaNum=${qna.qnaNum}"> <!-- 이미지가 있는 경우에만 표시 -->
								<c:if test="${!empty qna.qnaImage}">
									<img src="images/chan/${qna.qnaImage}" alt="qna image">
								</c:if> ${qna.qnaTitle}
						</a></td>
						<td>${qna.userId}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${qna.qnaDate}" /></td>
					</tr>
					<!-- 답글 표시 -->
					<c:forEach var="reply" items="${qnaReplies[qna.qnaNum]}">
						<tr class="reply-row">
							<td></td>
							<!-- 답글이므로 번호 칸을 비워둠 -->
							<td colspan="4">
								<div class="reply-content">
									<strong>답글:</strong> ${reply.qreplyContent} <br> <small>작성자:
										${reply.userId} | 작성일: <fmt:formatDate pattern="yyyy-MM-dd"
											value="${reply.qreplyDate}" />
									</small>
								</div>
							</td>
						</tr>
					</c:forEach>
				</c:forEach>
			</tbody>
		</table>

		<!-- Footer 버튼들 -->
		<div class="qa-footer">
			<button class="btn">쇼핑하기</button>
			<button class="btn">글쓰기</button>
		</div>
	</div>

	<!-- Pagination -->
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<!-- PREV 페이지 존재 -->
			<c:if test="${page.prev}">
				<li class="page-item"><a class="page-link"
					href="qnaList.do?page=${page.page-1}" aria-label="Previous"> <span
						aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>

			<!-- 페이지 갯수만큼 링크 생성 -->
			<c:forEach var="p" begin="${page.startPage }" end="${page.endPage }">
				<c:choose>
					<c:when test="${page.page == p }">
						<li class="page-item active" aria-current="page"><span
							class="page-link">${p }</span></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="qnaList.do?page=${p}">${p}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<!-- NEXT 페이지 존재 -->
			<c:if test="${page.next}">
				<li class="page-item"><a class="page-link"
					href="qnaList.do?page=${page.endPage + 1}" aria-label="Next"> <span
						aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
		</ul>
	</nav>