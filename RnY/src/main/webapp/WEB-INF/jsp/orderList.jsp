<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
	<h1 class="text-center text-white display-6">결제</h1>
	<ol class="breadcrumb justify-content-center mb-0">
		<li class="breadcrumb-item"><a href="#">홈</a></li>
		<li class="breadcrumb-item"><a href="#">페이지</a></li>
		<li class="breadcrumb-item active text-white">결제</li>
	</ol>
</div>
<!-- Single Page Header End -->
<link rel="stylesheet" href="css/yerim/order/order2.css" type="text/css">

<div class="container-fluid py-5">
	<div class="container py-5">
		<h1 class="mb-4">주문 정보</h1>
		<form action="order.do" method="post" id="orderInfo">
			<div class="row g-5">
				<div class="col-md-12 col-lg-6 col-xl-7">
					<div class="row">

						<div class="col-md-12 col-lg-6">
							<div class="form-item w-100">
								<label class="form-label my-3">이름<sup>*</sup></label> <input
									type="text" class="form-control" name="fullName" required>
							</div>
						</div>
					</div>
					<div class="form-item">
						<label class="form-label my-3">휴대폰<sup>*</sup></label> <input
							type="tel" class="form-control" name="phone" required>
					</div>
					<div class="form-item">
						<label class="form-label my-3">주소<sup>*</sup></label> <input
							type="text" class="form-control" name="address"
							placeholder="시/도, 동/면/읍/리/군" required>
					</div>
					<div class="form-item">
						<label class="form-label my-3">상세주소<sup>*</sup></label> <input
							type="text" class="form-control" name="detailAdress"
							placeholder="번지 및 건물명, 동수, 호수" required>
					</div>
					<hr>
					<div class="form-item">
						<textarea name="orderMemo" class="form-control" spellcheck="false"
							cols="30" rows="11" placeholder="주문 메모 (선택 사항)"></textarea>
					</div>
				</div>
				<div class="col-md-12 col-lg-6 col-xl-5">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">제품</th>
									<!-- <th scope="col">이름</th> -->
									<th scope="col">가격</th>
									<th scope="col">수량</th>
									<th scope="col">합계</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="subtotal" value="0" />
								<!-- Subtotal 초기화 -->
								<c:forEach var="i" begin="0"
									end="${fn:length(fn:split(itemNos, '/'))-1}">
									<tr>
										 <%-- <th scope="row">
											<div class="d-flex align-items-center mt-2">
												<img src="images/${fn:split(itemImages, '/')[i]}"
													class="img-fluid me-5 rounded-circle"
													style="width: 80px; height: 80px;" alt="">
											</div>
											
										</th>  --%>
										
										
										
										<td class="py-5"><c:choose>
												<c:when test="${fn:length(fn:split(itemNames, '/')[i]) > 5}">
           									 ${fn:substring(fn:split(itemNames, '/')[i], 0, 5)}...
       									 </c:when>
												<c:otherwise>
           									 ${fn:split(itemNames, '/')[i]}
       										 </c:otherwise>
											</c:choose></td>

										<td class="py-5">${fn:split(itemPrices, '/')[i]}원</td>
										<td class="py-5">${fn:split(quantities, '/')[i]}</td>
										<td class="py-5"><c:set var="price"
												value="${fn:split(itemPrices, '/')[i]}" /> <c:set
												var="quantity" value="${fn:split(quantities, '/')[i]}" /> <c:set
												var="total" value="${price * quantity}" /> ${total}원 <c:set
												var="subtotal" value="${subtotal + total}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>


						<div id="pay">
							<p>* 소계 : ${subtotal}원</p>
							<p>* 배송비 : 3000원</p>
							<h4>총 ${subtotal +  3000 }원</h4>
						</div>




					</div>
					<!-- <div
						class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
						<div class="col-12">
							<div class="form-check text-start my-3">
								<input type="checkbox"
									class="form-check-input bg-primary border-0" id="Transfer-1"
									name="Transfer" value="Transfer" checked> <label
									class="form-check-label" for="Transfer-1">직접 은행 이체</label>
							</div>
							<p class="text-start text-dark">주문 ID를 결제 참조로 사용해 저희 은행 계좌로
								직접 결제해 주세요. 자금이 계좌에 입금된 후에만 주문이 발송됩니다.</p>
							입금계좌 : 61870104241940 국민은행 (예금주 : 이성철)
						</div>
					</div> -->
				</div>
			</div>
		</form>
		<form action="orderCheck.do" method="post" id="checkForm">
			<input type="hidden" name="send_fullName"> <input
				type="hidden" name="send_phone"> <input type="hidden"
				name="send_address"> <input type="hidden"
				name="send_detailAdress"> <input type="hidden"
				name="send_orderMemo"> <input type="hidden"
				name="grandTotal" value="${grandTotal}"> <input
				type="hidden" name="shippingCost" value="${shippingCost}"> <input
				type="hidden" name="totalAmount" value="${totalAmount}"> <input
				type="hidden" name="itemImages" value="${itemImages}"> <input
				type="hidden" name="cartNos" value="${cartNos}"> <input
				type="hidden" name="itemNos" value="${itemNos}"> <input
				type="hidden" name="itemNames" value="${itemNames}"> <input
				type="hidden" name="itemPrices" value="${itemPrices}"> <input
				type="hidden" name="quantities" value="${quantities}">
			<div
				class="row g-4 text-center align-items-center justify-content-center pt-4">
				<a href="orderCheck.do">
					<button type="submit"
						class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">다음</button>
				</a>
			</div>
		</form>
	</div>
</div>
<script src="js/yerim/cart/CartList.js"></script>