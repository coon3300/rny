<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<section class="blog_area single-post-area padding_top">
	<div class="container ">
		<div class="row justify-content-center">

			<div class="col-lg-8 posts-list">
				<div class="single-post">
					<div class="feature-img">
						<img class="img-fluid" src="images/chan/${rvo.reviewImage}" alt="review">
					</div>
					<div class="blog_details">
						<h2>${rvo.reviewTitle}</h2>
						<ul class="blog-info-link mt-3 mb-4">
						
							<p><a href="#"> 글번호 : ${rvo.reviewNum}</a><br>
						    <a href="#"> 작성자 : ${rvo.userId}</a><br>
							<a href="#"> 작성일자 : <fmt:formatDate pattern="yyyy-MM-dd" value= "${rvo.reviewDate}"/></a><br></p>
						
						</ul>
						<p class="excert">${rvo.reviewContent}</p>
					</div>
				</div>
			</div>

		</div>
	</div>
</section>