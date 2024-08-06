<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="cart_area padding_top">
	<div class="container">
		<div class="cart_inner">
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">회원고유번호</th>
							<th scope="col">ID</th>
							<th scope="col">PW</th>
							<th scope="col">이름</th>
							<th scope="col">닉네임</th>
							<th scope="col">권한</th>
							<th scope="col">생년월일</th>
							<th scope="col">이메일</th>
							<th scope="col">폰번호</th>
							<th scope="col">주소</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div class="media">
									<div class="d-flex">
										<img src="img/product/single-product/cart-1.jpg" alt="" />
									</div>
									<div class="media-body">
									</div>
								</div>
							</td>
							<td>
								<h5>$360.00</h5>
							</td>
							<td>
								<div class="product_count">
									<span class="input-number-decrement"> <i
										class="ti-angle-down"></i></span> <input class="input-number"
										type="text" value="1" min="0" max="10"> <span
										class="input-number-increment"> <i class="ti-angle-up"></i></span>
								</div>
							</td>
							<td>
								<h5>$720.00</h5>
							</td>
						</tr>
						<tr>
							<td>
								<div class="media">
									<div class="d-flex">
										<img src="img/product/single-product/cart-1.jpg" alt="" />
									</div>
									<div class="media-body">
									</div>
								</div>
							</td>
							<td>
								<h5>$360.00</h5>
							</td>
							<td>
								<div class="product_count">
									<span class="input-number-decrement"> <i
										class="ti-angle-down"></i></span> <input class="input-number"
										type="text" value="1" min="0" max="10"> <span
										class="input-number-increment"> <i class="ti-angle-up"></i></span>
								</div>
							</td>
							<td>
								<h5>$720.00</h5>
							</td>
						</tr>
						<tr>
							<td>
								<div class="media">
									<div class="d-flex">
										<img src="img/product/single-product/cart-1.jpg" alt="" />
									</div>
									<div class="media-body">
										<p>Minimalistic shop for multipurpose use</p>
									</div>
								</div>
							</td>
							<td>
								<h5>$360.00</h5>
							</td>
							<td>
								<div class="product_count">
									<span class="input-number-decrement"> <i
										class="ti-angle-down"></i></span> <input class="input-number"
										type="text" value="1" min="0" max="10"> <span
										class="input-number-increment"> <i class="ti-angle-up"></i></span>
								</div>
							</td>
							<td>
								<h5>$720.00</h5>
							</td>
						</tr>
						<tr class="bottom_button">
							<td><a class="btn_1" href="#">Update Cart</a></td>
							<td></td>
							<td></td>
							<td>
								<div class="cupon_text float-right">
									<a class="btn_1" href="#">Close Coupon</a>
								</div>
							</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>
								<h5>Subtotal</h5>
							</td>
							<td>
								<h5>$2160.00</h5>
							</td>
						</tr>
						<tr class="shipping_area">
							<td></td>
							<td></td>
							<td>
								<h5>Shipping</h5>
							</td>
							<td>
								<div class="shipping_box">
									<ul class="list">
										<li><a href="#">Flat Rate: $5.00</a></li>
										<li><a href="#">Free Shipping</a></li>
										<li><a href="#">Flat Rate: $10.00</a></li>
										<li class="active"><a href="#">Local Delivery: $2.00</a>
										</li>
									</ul>
									<h6>
										Calculate Shipping <i class="fa fa-caret-down"
											aria-hidden="true"></i>
									</h6>
									<select class="shipping_select">
										<option value="1">Bangladesh</option>
										<option value="2">India</option>
										<option value="4">Pakistan</option>
									</select> <select class="shipping_select section_bg">
										<option value="1">Select a State</option>
										<option value="2">Select a State</option>
										<option value="4">Select a State</option>
									</select> <input type="text" placeholder="Postcode/Zipcode" /> <a
										class="btn_1" href="#">Update Details</a>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="checkout_btn_inner float-right">
				</div>
			</div>
		</div>
</section>