<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="favicon.png">
<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap4" />

<link href="css/yerim/cart/cart.css" rel="stylesheet">
<title>장바구니</title>
</head>

<body>
	<div class="untree_co-section before-footer-section">
		<div class="container">
			<div class="row mb-5">
				<form class="col-md-12" method="post">
					<div class="site-blocks-table">
						<table class="table">
							<thead>
								<tr>
									<th class="product-thumbnail">상품사진</th>
									<th class="product-name">상품이름</th>
									<th class="product-price">가격</th>
									<th class="product-quantity">상품개수</th>
									<th class="product-total">합계</th>
									<th class="product-remove"></th>
								</tr>
							</thead>
							<tbody>
								<c:set var="grandTotal" value="0.0" />
								<c:forEach var="cart" items="${cartList}" varStatus="status">
									<tr>
										<td class="product-thumbnail"><img
											src="images/${cart.itemImage}" alt="Image" class="img-fluid">
										</td>
										<td class="product-name">
											<h2 class="h5 text-black">${cart.itemName}</h2>
										</td>
										<td>${cart.itemPrice}원</td>
										<td>
											<form action="updateCartQuantity.do" method="post"
												class="quantity-form">
												<input type="hidden" name="cartNo" value="${cart.cartNo}">
												<div
													class="input-group mb-3 d-flex align-items-center quantity-container">
													<div class="input-group-prepend">
														<button class="btn btn-outline-black decrease"
															type="button">&minus;</button>
													</div>
													<input type="text"
														class="form-control text-center quantity-amount"
														name="quantity" value="${cart.quantity}"
														aria-label="Example text with button addon"
														aria-describedby="button-addon1">
													<div class="input-group-append">
														<button class="btn btn-outline-black increase"
															type="button">&plus;</button>
													</div>
												</div>
											</form>
										</td>
										<td>${cart.itemPrice * cart.quantity}원</td>
										<td><a href="deleteCart.do?cno=${cart.cartNo}"
											class="btn btn-black btn-sm">X</a></td>
									</tr>
									<!-- Calculate the total for each item -->
									<c:set var="itemTotal"
										value="${cart.itemPrice * cart.quantity}" />
									<c:set var="grandTotal" value="${grandTotal + itemTotal}" />
								</c:forEach>
								<!-- Calculate the shipping cost -->
								<c:set var="shippingCost" value="3000" />
								<c:set var="totalAmount" value="${grandTotal + shippingCost}" />
							</tbody>
						</table>
					</div>
				</form>
			</div>

			<div class="row">
				<div class="col-md-6 pl-5">
					<div class="row justify-content-end">
						<div class="col-md-7">
							<div class="row">
								<div class="col-md-12 text-right border-bottom mb-5">
									<h3 class="text-black h4 text-uppercase">
										예상구매금액 : <span id="grandTotalDisplay" name="grandTotal">${grandTotal}</span>원
									</h3>
								</div>
							</div>
							<div class="row mb-3"></div>
							<div class="row mb-5"></div>
							<div class="row">
								<div class="col-md-12">
									<form id="cartForm" action="order.do" method="post">
										<input type="hidden" name="userNo" value=""> <input
											type="hidden" name="grandTotal" value=""> <input
											type="hidden" name="shippingCost" value=""> <input
											type="hidden" name="totalAmount" value=""> <input
											type="hidden" name="itemNo" value=""> <input
											type="hidden" name="itemName" value=""> <input
											type="hidden" name="itemPrice" value=""> <input
											type="hidden" name="quantity" value="">
										<button type="submit">주문하기</button>
									</form>


								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="js/yerim/cart/bootstrap.bundle.min.js"></script>
	<script src="js/yerim/cart/tiny-slider.js"></script>
	<script src="js/yerim/cart/custom.js"></script>
	<script src="js/yerim/cart/cart.js"></script>
</body>
</html>