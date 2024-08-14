<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- body 파일. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 바디영역 -->
<!--blog start -->
<section id="blog" class="blog">
	<div class="container">
		<div class="section-header">
			<h2>공지사항</h2>
		</div>
		<div class="blog-content">
			<div class="row">
				<c:forEach var="notice" items="${noticeList}">
					<div class="col-sm-4">
						<div class="single-blog">
							<div class="single-blog-img">
								<img src="images/${notice.noticeImage}" alt="notice image">
								<div class="single-blog-img-overlay"></div>
							</div>
							<div class="single-blog-txt">
								<h2>
									<a href="notice.do?noticeNum=${notice.noticeNum}">${notice.noticeTitle}</a>
								</h2>
								<h4>
									작성자 : <a href="notice.do?noticeNum=${notice.noticeNum}">${notice.userId}</a><br>
									작성일자 : <a href="notice.do?noticeNum=${notice.noticeNum}"><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.noticeDate}"/> </a>
								</h4>
								<p>${notice.noticeContent}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</section>
<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<!-- PREV 페이지 존재 -->
			<c:if test="${page.prev}">
				<li class="page-item"><a class="page-link"
					href="noticeList.do?page=${page.page-1}>" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>

			<!-- 페이지 갯수만큼 링크생성 -->
			<c:forEach var="p" begin="${page.startPage }" end="${page.endPage }">
				<c:choose>
					<c:when test="${page.page == p }">
						<li class="page-item active" aria-current="page">
						<span class="page-link">${p }</span></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="noticeList.do?page=${p}">${p}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<!-- NEXT 페이지 존재 -->
			<c:if test="${page.next}">
				<li class="page-item"><a class="page-link"
					href="noticeList.do?page=${page.endPage + 1}" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
		</ul>
	</nav>
	<!-- 페이징 -->