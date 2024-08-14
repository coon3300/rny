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
}

.qa-table th, .qa-table td {
    padding: 15px;
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

.qa-footer button:first-child {
    margin-right: auto;
}
</style>

<body>

	<div class="qa-container">
		<h2>Q & A</h2>
		<p>상품 Q&A입니다.</p>
		<hr>

		<!-- 드롭다운 메뉴 -->
		<select name="qna_type" class="form-control">
			<option value="상품문의">상품문의</option>
			<option value="배송문의">배송문의</option>
			<option value="기타문의">기타문의</option>
			<option value="환불문의">환불문의</option>
			<option value="교환문의">교환문의</option>
		</select>

		<!-- Q&A 테이블 -->
		<table class="qa-table">
			<thead>
				<tr>
					<th>번호</th>
					<th>문의유형</th>
					<th>이미지</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일자</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="qna" items="${qnaPaging}">
					<tr>
						<td><a href="qna.do?qnaNum=${qna.qnaNum}">${qna.qnaNum}</a></td>
						<td><a href="qna.do?qnaNum=${qna.qnaNum}">${qna.qnaType}</a></td>
						<td><img src="images/chan/${qna.qnaImage}" alt="qna image">
						<td><a href="qna.do?qnaNum=${qna.qnaNum}">${qna.qnaTitle}</a></td>
						<td><a href="qna.do?qnaNum=${qna.qnaNum}">${qna.userId}</a></td>
						<td><a href="qna.do?qnaNum=${qna.qnaNum}"><fmt:formatDate
									pattern="yyyy-MM-dd" value="${qna.qnaDate}" /></a></td>
						<td><a href="qna.do?qnaNum=${qna.qnaNum}">${qna.qnaContent}</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- Footer 버튼들 -->
		<div class="qa-footer">
			<button class="btn">쇼핑하기</button>
			<button class="btn">글쓰기</button>
		</div>
	</div>
	<br>
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<!-- PREV 페이지 존재 -->
			<c:if test="${page.prev}">
				<li class="page-item"><a class="page-link"
					href="qnaList.do?page=${page.page-1}>" aria-label="Previous"> <span
						aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>

			<!-- 페이지 갯수만큼 링크생성 -->
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
	<!-- 페이징 -->