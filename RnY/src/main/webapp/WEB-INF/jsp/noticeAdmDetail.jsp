<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<section class="blog_area single-post-area padding_top">
	<div class="container ">
		<div class="row justify-content-center">

			<div class="col-lg-8 posts-list">
				<div class="single-post">
					<div class="feature-img">
						<img class="img-fluid" src="images/chan/${nvo.noticeImage}" alt="notice" style="float: center;">
					</div>
					<div class="blog_details">
						<h2>${nvo.noticeTitle}</h2>
						<ul class="blog-info-link mt-3 mb-4">
							<li><a href="#"> 글번호 : ${nvo.noticeNum}</a></li>
						    <li><a href="#"> 작성자 : ${nvo.userId}</a><br></li>
							<li><a href="#"> 작성일자 : <fmt:formatDate pattern="yyyy-MM-dd" value= "${nvo.noticeDate}"/></a></li>
						
						</ul>
						<p class="excert">${nvo.noticeContent}</p>
				

					</div>
				</div>
			</div>

		</div>
	</div>
</section>