<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- body 파일. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
									작성자 : <a href="notice.do?noticeNum=${notice.noticeNum}">${notice.userNo }</a><br>
									작성일자 : <a href="notice.do?noticeNum=${notice.noticeNum}">${notice.noticeDate}</a> 
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