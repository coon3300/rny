<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<section class="categories categories-grid spad">
	<div class="categories__post">
		<div class="container">
			<div class="categories__grid__post">
				<div class="breadcrumb__option">
					<h2>
						<span>Q&A게시판</span>
					</h2>
					<a href="main.do">Home</a>
					<div class="row justify-content-center">
						<div style="text-align: center">
							<div class="col-lg-8 col-md-8 justify-content-center"></div>
							<div class="breadcrumb__text"></div>
							<c:forEach var="qna" items="${qnaPaging}">
								<div class="categories__list__post__item">
									<div class="row">
										<div class="col-lg-6 col-md-6">
											<div class="categories__post__item__pic set-bg"
												data-setbg="img/categories/categories-list/cl-1.jpg">
												<br> <img src="images/chan/${qna.qnaImage}" width="500"
													height="300" alt="qna image">
												<div class="post__meta"></div>
											</div>
										</div>
										<div class="col-lg-6 col-md-6">
											<div class="categories__post__item__text">
												<span class="post__label">${qna.qnaNum}</span>
												<h3>
													<a href="qna.do?qnaNum=${qna.qnaNum}">${qna.qnaTitle}</a>
												</h3>
												<ul class="post__widget">
													<li style="list-style-type: none">작성자 <span>${qna.userNo}</span></li>
													<li style="list-style-type: none">작성일자 <span><fmt:formatDate pattern="yyyy-MM-dd" value="${qna.qnaDate}"/></span></li>
													<!--  <li style="list-style-type: none">답변일자 <span><fmt:formatDate pattern="yyyy-MM-dd" value="${qna.qnaAnswerDate}"/></span></li-->
												</ul>
												<p>${qna.qnaContent}</p>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
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
