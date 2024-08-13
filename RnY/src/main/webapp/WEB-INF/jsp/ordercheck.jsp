<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String logNick = (String) session.getAttribute("logNick");
String logName = (String) session.getAttribute("logName");
%>

<%@ include file="/WEB-INF/layout/menu.jsp" %>


<!-- Bootstrap CSS -->
 <link href="css/yerim/ordercheck/ordercheck.css" rel="stylesheet">





<body>

	<div class="untree_co-section">
		<div class="container">
			<h1 class="h1 mb-3 text-black"><a href="cart.do"></a>${logNick}님의 주문상세</h1>
			<br>
			<h5>주문번호 :   번</h5>
			<h5>주문날짜 :   </h5>
			<a href="main.do" class="btn btn-primary btn-outline-primary">메인</a> 
					</div>
				</div>

					<!-- 주문상세영역 -->
					<div class="row mb-5">
						<div class="col-md-12">
							<h2 class="h3 mb-3 text-black">${orderNo}</h2>
							<div class="p-3 p-lg-5 border bg-white">
								<table class="table site-block-order-table mb-5">
									<thead>
										<th>상품명</th>
										<th>가격</th>
										<th>개수</th>
										<th>합계</th>
									</thead>
									<tbody>

										<c:set var="total" value="0" />
										<c:forEach var="od" items="${logCart}" varStatus="status">
											<tr>
												<td>${od.itemName}</td>
												<td>${od.itemPrice}원</td>
												<td>${od.cartCnt}</td>
												<td>${od.itemPrice * od.cartCnt}원</td>
											</tr>
											<c:set var="total"
												value="${total + (od.itemPrice * od.cartCnt)}" />
										</c:forEach>

										<tr>
											<td class="text-black font-weight-bold"><strong>총
													결제금액</strong></td>
											<td class="text-black font-weight-bold"><strong></strong></td>
											<td class="text-black font-weight-bold"><strong></strong></td>
											<td class="text-black font-weight-bold"><strong>${total}원</strong></td>
										</tr>
									</tbody>
								</table>

							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- </form> -->
		</div>
	</div>



<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="js/yerim/order/bootstrap.bundle.min.js"></script>
<script src="js/yerim/order/tiny-slider.js"></script>
<script src="js/yerim/order/custom.js"></script>
<script src="js/yerim/order/check.js"></script>

</body>

