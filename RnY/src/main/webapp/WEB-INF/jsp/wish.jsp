<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
String logNick = (String) session.getAttribute("logNick");
%>



<section id="banner" style="background: #F9F3EC;">
	<div class="container">
		<div class="swiper main-swiper">
			<div class="swiper-wrapper"></div>
		</div>
	</div>
</section>

<section id="clothing" class="my-5 overflow-hidden">
	<div class="container pb-5">
		<div
			class="section-header d-md-flex justify-content-between align-items-center mb-3">
			<h2 class="display-3 fw-normal">${logNick}님의WISHLIST</h2>
			<p></p>
		</div>





		





			<section id="clothing" class="my-5 overflow-hidden">
				<div class="container pb-5">



					<div class="products-carousel swiper">
						<div class="swiper-wrapper">

							<div class="swiper-slide">

								<div class="card position-relative">
									<c:forEach var="wish" items="${logWish}" varStatus="status">
										<a href="single-product.html"><img
											src="images/${wish.itemImage}" class="img-fluid rounded-4"
											alt="image"></a>
										<div class="card-body p-0">
											<a href="single-product.html">
												<h3 class="card-title pt-4 m-0">${wish.itemName}</h3>
											</a>

											<div class="card-text">
												<span class="rating secondary-font"> <iconify-icon
														icon="clarity:star-solid" class="text-primary"></iconify-icon>

												</span>

												<h3 class="secondary-font text-primary">${wish.itemPrice}</h3>

												<div class="d-flex flex-wrap mt-3">
													<a href="#" class="btn-cart me-3 px-4 pt-3 pb-3">
														<h5 class="text-uppercase m-0">장바구니 넣기</h5>
													</a> <a href="#" class="btn-wishlist px-4 pt-3 "> <iconify-icon
															icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
													</a>
												</div>


											</div>
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="swiper-slide"></div>
						</div>
					</div>
				</div>
			</section>
	</div>
</section>


























<section id="service">
	<div class="container py-5 my-5">
		<div class="row g-md-5 pt-4">
			<div class="col-md-3 my-3">
				<div class="card">
					<div>
						<iconify-icon class="service-icon text-primary"
							icon="la:shopping-cart"></iconify-icon>
					</div>
					<h3 class="card-title py-2 m-0">무료 배송</h3>
					<div class="card-text">
						<p class="blog-paragraph fs-6">도서산간지역의 경우 추가배송비가 발생합니다.</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 my-3">
				<div class="card">
					<div>
						<iconify-icon class="service-icon text-primary"
							icon="la:user-check"></iconify-icon>
					</div>
					<h3 class="card-title py-2 m-0">100% 포인트 결제 가능</h3>
					<div class="card-text">
						<p class="blog-paragraph fs-6">단, 네이버페이에 한함.</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 my-3">
				<div class="card">
					<div>
						<iconify-icon class="service-icon text-primary" icon="la:tag"></iconify-icon>
					</div>
					<h3 class="card-title py-2 m-0">오늘의 Pick!</h3>
					<div class="card-text">
						<p class="blog-paragraph fs-6">고민은 배송만 늦출 뿐.</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 my-3">
				<div class="card">
					<div>
						<iconify-icon class="service-icon text-primary" icon="la:award"></iconify-icon>
					</div>
					<h3 class="card-title py-2 m-0">품질 보증</h3>
					<div class="card-text">
						<p class="blog-paragraph fs-6">교환/환불은 1주일 이내.</p>
					</div>
				</div>
			</div>

		</div>
	</div>
</section>

<section id="insta" class="my-5">
	<div class="row g-0 py-5">
		<div class="col instagram-item  text-center position-relative">
			<div
				class="icon-overlay d-flex justify-content-center position-absolute">
				<iconify-icon class="text-white" icon="la:instagram"></iconify-icon>
			</div>
			<a href="#"> <img src="images/insta1.jpg" alt="insta-img"
				class="img-fluid rounded-3">
			</a>
		</div>
		<div class="col instagram-item  text-center position-relative">
			<div
				class="icon-overlay d-flex justify-content-center position-absolute">
				<iconify-icon class="text-white" icon="la:instagram"></iconify-icon>
			</div>
			<a href="#"> <img src="images/insta2.jpg" alt="insta-img"
				class="img-fluid rounded-3">
			</a>
		</div>
		<div class="col instagram-item  text-center position-relative">
			<div
				class="icon-overlay d-flex justify-content-center position-absolute">
				<iconify-icon class="text-white" icon="la:instagram"></iconify-icon>
			</div>
			<a href="#"> <img src="images/insta3.jpg" alt="insta-img"
				class="img-fluid rounded-3">
			</a>
		</div>
		<div class="col instagram-item  text-center position-relative">
			<div
				class="icon-overlay d-flex justify-content-center position-absolute">
				<iconify-icon class="text-white" icon="la:instagram"></iconify-icon>
			</div>
			<a href="#"> <img src="images/insta4.jpg" alt="insta-img"
				class="img-fluid rounded-3">
			</a>
		</div>
		<div class="col instagram-item  text-center position-relative">
			<div
				class="icon-overlay d-flex justify-content-center position-absolute">
				<iconify-icon class="text-white" icon="la:instagram"></iconify-icon>
			</div>
			<a href="#"> <img src="images/insta5.jpg" alt="insta-img"
				class="img-fluid rounded-3">
			</a>
		</div>
		<div class="col instagram-item  text-center position-relative">
			<div
				class="icon-overlay d-flex justify-content-center position-absolute">
				<iconify-icon class="text-white" icon="la:instagram"></iconify-icon>
			</div>
			<a href="#"> <img src="images/insta6.jpg" alt="insta-img"
				class="img-fluid rounded-3">
			</a>
		</div>
	</div>
</section>
