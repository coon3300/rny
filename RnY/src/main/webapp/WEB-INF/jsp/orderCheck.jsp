<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
	<h1 class="text-center text-white display-6">주문 확인</h1>
	<ol class="breadcrumb justify-content-center mb-0">
		<li class="breadcrumb-item"><a href="#">홈</a></li>
		<li class="breadcrumb-item"><a href="#">페이지</a></li>
		<li class="breadcrumb-item active text-white">주문 확인</li>
	</ol>
</div>
<!-- Single Page Header End -->
<link rel="stylesheet" href="css/yerim/ordercheck/ordercheck2.css" type="text/css">


<div class="container-fluid py-5">
	<div class="container py-5">
		<h1 class="mb-4">주문 정보 확인</h1>
		<form action="main.do" method="post">
		<input type="hidden" name="userId" value="${member.userId}">
			<div class="row g-5">
				<div class="col-md-12 col-lg-6 col-xl-7">
					<div class="form-item w-100">
						<label class="form-label my-3">이름</label> <p>${fullName}</p>
						<label class="form-label my-3">휴대전화</label> <p>${phone}</p>
						<label class="form-label my-3">주소</label> <p>${address}</p>
						<label class="form-label my-3">상세주소</label> <p>${detailAddress}</p>
						<label class="form-label my-3">요청사항</label> <p>${orderMemo}</p>
						
						
					</div>
					
					<hr>
				</div>
				<div class="col-md-12 col-lg-6 col-xl-5">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">제품</th>
									<th scope="col">이름</th>
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
										<th scope="row">
											<div class="d-flex align-items-center mt-2">
												<img src="images/${fn:split(itemImages, '/')[i]}"
													class="img-fluid me-5 rounded-circle"
													style="width: 80px; height: 80px;" alt="">
											</div>
										</th>
										<td class="py-5"><c:choose>
												<c:when
													test="${fn:length(fn:split(itemNames, '/')[i]) > 5}">
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
						</div>
					</div> -->
				</div>

			</div>
			<div class="row g-4 text-center align-items-center justify-content-center pt-4" style="text-align: center;">
			<h1>${logNick}님 ${subtotal +  3000 }원 주문완료되었습니다!</h1>
			<p>카카오뱅크 : 123-1234-1234-12 (예금주 : 예담)<br>
			위 계좌로 이체해주세요. 24시간 내에 결제하시지 않으면 주문은 취소됩니다.</p>
			</div>
			<div
				class="row g-4 text-center align-items-center justify-content-center pt-4">
				<input type="hidden" name="userId" value="${member.userId}">
				<button type="submit"
					class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">메인으로</button>
			</div>
			<c:set var="totalAmount" value="${subtotal + 3000}" />
			<c:set var="sessionTotalAmount" value="${totalAmount}" scope="session" />
		</form>
	</div>
</div>
