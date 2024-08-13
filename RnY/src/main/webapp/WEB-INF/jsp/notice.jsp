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
						<img class="img-fluid" src="images/chan/${nvo.noticeImage}" alt="notice">
					</div>
					<div class="blog_details">
						<h2>${nvo.noticeTitle}</h2>
						<ul class="blog-info-link mt-3 mb-4">
						
							<p><a href="#"> 글번호 : ${nvo.noticeNum}</a><br>
						    <a href="#"> 작성자 : ${nvo.userNo}</a><br>
							<a href="#"> 작성일자 : <fmt:formatDate pattern="yyyy-MM-dd" value= "${nvo.noticeDate}"/></a><br></p>
						
						</ul>
						<p class="excert">${nvo.noticeContent}</p>
						<p>나는 이승엽 나보다 잘생긴 사람은 이세상에 존재할 수 없지 훗</p>
						
						<p>MCSE boot camps have its supporters and its detractors.
							Some people do not understand why you should have to spend money
							on boot camp when you can get the MCSE study materials yourself
							at a fraction of the camp price. However, who has the willpower</p>
						<p>MCSE boot camps have its supporters and its detractors.
							Some people do not understand why you should have to spend money
							on boot camp when you can get the MCSE study materials yourself
							at a fraction of the camp price. However, who has the willpower
							to actually sit through a self-imposed MCSE training. who has the
							willpower to actually</p>
					</div>
				</div>
			</div>

		</div>
	</div>
</section>