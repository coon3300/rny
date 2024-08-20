<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
	<h1 class="text-center text-white display-6">주문 상세</h1>
	<ol class="breadcrumb justify-content-center mb-0">
		<li class="breadcrumb-item"><a href="#">홈</a></li>
		<li class="breadcrumb-item"><a href="#">페이지</a></li>
		<li class="breadcrumb-item active text-white">주문 상세</li>
	</ol>
</div>
<!-- Single Page Header End -->
<link rel="stylesheet" href="css/yerim/ordercheck/ordercheck2.css" type="text/css">

<div class="container-fluid py-5">
	<div class="container py-5">
		<h1 class="mb-4">${logNick}님의 주문상세 페이지입니다.</h1>
		<form action="main.do" method="post">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">주문번호</th>
						<th scope="col">주문금액</th>
						<th scope="col">배송지</th>
						<th scope="col">주문일시</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${orderList}">
						<tr>
							<td>${order.orderNo}</td>
							<td>${order.orderPrice}원</td>
							<td>${order.addressNo}번</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${order.orderDate}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class="row g-4 text-center align-items-center justify-content-center pt-4" style="text-align: center;">
				<!-- Add additional content here if needed -->
			</div>
		</form>
	</div>
</div>
