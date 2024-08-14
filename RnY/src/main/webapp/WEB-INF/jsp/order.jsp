<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String logNick = (String) session.getAttribute("logNick");
String logName = (String) session.getAttribute("logName");
String userNo = (String) session.getAttribute("userNo");
%>

<%@ include file="/WEB-INF/layout/menu.jsp" %>


<!-- Bootstrap CSS -->
<link href="css/yerim/order/order.css" rel="stylesheet">







<body>

	<div class="untree_co-section">
		<div class="container">
			<h1 class="h1 mb-3 text-black"><a href="cart.do"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-arrow-left-square-fill" viewBox="0 0 16 16">
  <path d="M16 14a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2zm-4.5-6.5H5.707l2.147-2.146a.5.5 0 1 0-.708-.708l-3 3a.5.5 0 0 0 0 .708l3 3a.5.5 0 0 0 .708-.708L5.707 8.5H11.5a.5.5 0 0 0 0-1"/>
</svg></a> ${logNick}님의 주문페이지</h1>
			<br>
			<div class="row">
				<div class="col-md-6 mb-5 mb-md-0">
					<h2 class="h3 mb-3 text-black">주문</h2>
					<div class="p-3 p-lg-5 border bg-white">

						<div class="form-group row">
							<div class="col-md-12">
								<label for="c_companyname" class="text-black">받는사람<span
									class="text-danger">*</span></label> <input type="text"
									class="form-control" id="orderName" name="orderName" placeholder="${logName}">
							</div>
						</div>
						<br>


						<div class="form-group row">
							<div class="col-md-12">
								<label for="c_companyname" class="text-black">주소<span
									class="text-danger">*</span></label>
								<input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호 찾기" onclick="sample6_execDaumPostcode()" >
								<input type="text" class="form-control" id="sample6_address"	name="orderAdd" placeholder="주소">
								<!-- <input type="text" class="form-control" id="sample6_detailAddress" name="userAdd3" placeholder="상세주소">  -->
								<input type="text" class="form-control" id="sample6_extraAddress" name="orderAdd" placeholder="상세주소">
								<br>
							</div>
						</div>

						<div class="form-group row">
							<div class="col-md-12">
								<label for="c_address" class="text-black">전화번호<span
									class="text-danger" style="color:red;">*</span></label> <input type="number"
									class="form-control" id="orderPhone" name="orderPhone"
									placeholder="번호만 입력하세요." onkeypress="return checkNumber(event)">
							</div>
						</div>
						<br>

						<div class="form-group row">
							<div class="col-md-12">
								<label for="c_address" class="text-black">이메일<span
									class="text-danger">*</span></label> <input type="text"
									class="form-control" id="orderEmail" name="orderEmail">
							</div>
						</div>

						<div class="form-group">
							<select class="form-control" id="orderEmail" name="orderEmail">
								<option value="1">--이메일 선택--</option>
								<option value="2">@naver.com</option>
								<option value="3">@daum.net</option>
								<option value="4">@gamil.com</option>
								<option value="5">@hanmail.com</option>
								<option value="6">@nate.com</option>
							</select>
						</div>
						<br>


						<div class="form-group row">
							<div class="col-md-12">
								<label for="c_address" class="text-black">배송메시지<span
									class="text-danger">*</span></label>
							</div>
						</div>

						<div class="form-group">
							<select id="orderMessage" name="orderMessage" class="form-control">
								<option value="1">--메시지 선택 (선택사항)--</option>
								<option value="2">문 앞에 놔주세요</option>
								<option value="3">경비실에 맡겨주세요</option>
								<option value="4">택배함에 넣어주세요</option>
								<option value="5">배송 전에 연락 주세요</option>
							</select>
						</div>

						<div class="form-group">
							<label for="c_order_notes" class="text-black">직접입력</label>
							<textarea name="orderMessage" id="orderMessage" cols="30"
								rows="5" class="form-control" placeholder="메시지를 입력하세요."></textarea>
						</div>















						<!-- 시작)여기 필요없는데 지우면 스타일 이상해짐 지우지 말기!! -->


						<div class="form-group">
							<!-- 폼시작 -->
							<div class="collapse" id="ship_different_address">
								<div class="py-2">

									<div class="form-group">
										<label for="c_diff_country" class="text-black">Country
											<span class="text-danger">*</span>
										</label> <select id="c_diff_country" class="form-control">
											<option value="1">Select a country</option>
											<option value="2">bangladesh</option>
											<option value="3">Algeria</option>
											<option value="4">Afghanistan</option>
											<option value="5">Ghana</option>
											<option value="6">Albania</option>
											<option value="7">Bahrain</option>
											<option value="8">Colombia</option>
											<option value="9">Dominican Republic</option>
										</select>
									</div>


									<div class="form-group row">
										<div class="col-md-6">
											<label for="c_diff_fname" class="text-black">First
												Name <span class="text-danger">*</span>
											</label> <input type="text" class="form-control" id="c_diff_fname"
												name="c_diff_fname">
										</div>
										<div class="col-md-6">
											<label for="c_diff_lname" class="text-black">Last
												Name <span class="text-danger">*</span>
											</label> <input type="text" class="form-control" id="c_diff_lname"
												name="c_diff_lname">
										</div>
									</div>

									<div class="form-group row">
										<div class="col-md-12">
											<label for="c_diff_companyname" class="text-black">Company
												Name </label> <input type="text" class="form-control"
												id="c_diff_companyname" name="c_diff_companyname">
										</div>
									</div>

									<div class="form-group row  mb-3">
										<div class="col-md-12">
											<label for="c_diff_address" class="text-black">Address
												<span class="text-danger">*</span>
											</label> <input type="text" class="form-control" id="c_diff_address"
												name="c_diff_address" placeholder="Street address">
										</div>
									</div>

									<div class="form-group">
										<input type="text" class="form-control"
											placeholder="Apartment, suite, unit etc. (optional)">
									</div>

									<div class="form-group row">
										<div class="col-md-6">
											<label for="c_diff_state_country" class="text-black">State
												/ Country <span class="text-danger">*</span>
											</label> <input type="text" class="form-control"
												id="c_diff_state_country" name="c_diff_state_country">
										</div>
										<div class="col-md-6">
											<label for="c_diff_postal_zip" class="text-black">Posta
												/ Zip <span class="text-danger">*</span>
											</label> <input type="text" class="form-control"
												id="c_diff_postal_zip" name="c_diff_postal_zip">
										</div>
									</div>

									<div class="form-group row mb-5">
										<div class="col-md-6">
											<label for="c_diff_email_address" class="text-black">Email
												Address <span class="text-danger">*</span>
											</label> <input type="text" class="form-control"
												id="c_diff_email_address" name="c_diff_email_address">
										</div>
										<div class="col-md-6">
											<label for="c_diff_phone" class="text-black">Phone <span
												class="text-danger">*</span></label> <input type="text"
												class="form-control" id="c_diff_phone" name="c_diff_phone"
												placeholder="Phone Number">
										</div>
									</div>

								</div>

							</div>
						</div>
						<!-- 폼시작 -->

						<div class="form-group"></div>

					</div>
				</div>
				<!-- 끝)여기 필요없는데 지우면 스타일 이상해짐 지우지 말기!! -->






				<!-- 쿠폰영역 -->
				<div class="col-md-6">

					<div class="row mb-5">
						<div class="col-md-12">
							<h2 class="h3 mb-3 text-black">쿠폰 입력하기</h2>
							<div class="p-3 p-lg-5 border bg-white">

								<label for="c_code" class="text-black mb-3">쿠폰번호를 입력하세요.</label>
								<div class="input-group w-75 couponcode-wrap">
									<input type="text" class="form-control me-2" id="c_code"
										placeholder="숫자 8자리" aria-label="Coupon Code"
										aria-describedby="button-addon2">
									<div class="input-group-append">
										<button class="btn btn-black btn-sm" type="button"
											id="button-addon2">등록</button>
									</div>
								</div>

							</div>
						</div>
					</div>
					<!-- 쿠폰영역 -->




					<!-- 주문상세영역 -->
					<div class="row mb-5">
						<div class="col-md-12">
							<h2 class="h3 mb-3 text-black">주문내용</h2>
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

								<div class="border p-3 mb-3">
									<h3 class="h6 mb-0">
										<a class="d-block" data-bs-toggle="collapse"
											href="#collapsebank" role="button" aria-expanded="false"
											aria-controls="collapsebank">결제안내</a>
									</h3>

									<div class="collapse" id="collapsebank">
										<div class="py-2">
											<p class="mb-0">주문하기 버튼을 누르고 나오는 계좌로 입금해주세요.</p>
										</div>
									</div>
								</div>





								<div class="form-group">
								<c:forEach var="od" items="${logOrder}" varStatus="status">
								<p>주문번호: ${order.orderNo}</p> 
								<p>상품이름: ${order.itemName}</p>
								</c:forEach>
								
								
								
								
									<a href="pay.do?userNo=${userNo}&itemNo=${itemNo}&cartNo=${cartNo}&
									orderName=${orderName}&orderAdd=${orderAdd}&orderPhone=${orderPhone}
									&orderEmanil=${orderEmail}&orderMessage=${orderMessage}"><button
											 class="btn btn-black btn-lg py-3 btn-block" >주문하기</button></a>
								</div>

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
<Script src='js/addmember2.js'></Script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
//숫자 넘버타입만 출력
function checkNumber(event) {
  if(event.key === '.' 
     || event.key === '-'
     || event.key >= 0 && event.key <= 9) {
    return true;
  }
  
  return false;
  return alert('숫자만 입력하세요!');
}
	
</script>
</body>

