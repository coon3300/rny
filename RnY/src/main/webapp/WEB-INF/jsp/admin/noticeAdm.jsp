<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!-- Main Content -->

<div class="main-content">
	<div class="notice-title">
		<h1>NOTICE</h1>
		<h1>──────</h1>
	</div>
	<table class="notice-table">
		<thead>
			<tr>
				<th><input type="checkbox" id="selectAll"></th>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="notice" items="${noticeList}">
				<tr>
					<td><input type="checkbox" class="noticeCheckbox"></td>
					<td>${notice.noticeNum}</td>
					<td><a href="noticeAdmDetail.do?noticeNum=${notice.noticeNum}">${notice.noticeTitle}</a></td>
					<td>${notice.userId}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.noticeDate}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<p class="excert">
		<br>
		<button type="button" class="btn btn-outline-info" id="deleteNotice" style="float: right;">삭제</button>
		<button type="button" class="btn btn-outline-info" id="addNotice" >등록</button>
	</p>

	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<!-- PREV 페이지 존재 -->
			<c:if test="${paging.prev}">
				<li class="page-item"><a class="page-link" href="noticeAdm.do?page=${paging.page-1}" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span></a></li>
			</c:if>

			<!-- 페이지 갯수만큼 링크생성 -->
			<c:forEach var="p" begin="${paging.startPage }" end="${paging.endPage }">
				<c:choose>
					<c:when test="${paging.page == p }">
						<li class="page-item active" aria-current="page"><span class="page-link">${p }</span></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="noticeAdm.do?page=${p}">${p}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<!-- NEXT 페이지 존재 -->
			<c:if test="${paging.next}">
				<li class="page-item"><a class="page-link" href="noticeAdm.do?page=${paging.endPage + 1}" aria-label="Next">
					<span aria-hidden="true">&raquo;</span></a></li>
			</c:if>
		</ul>
	</nav>
</div>

<script>
	document.getElementById('selectAll').addEventListener('change', function() {
		const checkboxes = document.querySelectorAll('.noticeCheckbox');
		checkboxes.forEach(checkbox => {
			checkbox.checked = this.checked;
		});
	});
</script>