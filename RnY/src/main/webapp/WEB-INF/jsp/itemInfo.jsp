<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<!-- Bootstrap icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="css/main/styles.css" rel="stylesheet" />
	<link href="css/styles.css" rel="stylesheet" />
<style>
#buttons {
    padding: 0 !important;
}
</style>
	
	
</head>


<!-- 상품상세. -->
<!-- Product section-->
<section class="py-5 bg-light">
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="col-md-6">
				<img class="card-img-top mb-5 mb-md-0"
					src="images/line/${ivo.getLineNo() }a.jpg" />
			</div>
			<div class="col-md-6">
				<ul style="list-style-type: none; margin: 0; padding: 0;">
					<li>
						<h1>${ivo.getItemName() }</h1>
					</li>
				</ul>
				<ul style="list-style-type: none; margin: 0; padding: 0;">
					<li>
						<h6>&nbsp;</h6>
					</li>
				</ul>				
				<ul style="list-style-type: none; margin: 0; padding: 0;">
					<li>
						<h3><fmt:formatNumber value="${ivo.getItemPrice()}" pattern="#,###" />원</h3>
					</li>
				</ul>
				<ul style="list-style-type: none; margin: 0; padding: 0;">
					<li>
						<h6>&nbsp;</h6>
					</li>
				</ul>				
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel"
						aria-labelledby="home-tab">
					<div class="table-responsive">
						<table class="table"> 
							<tbody>
								<tr>
									<td>
										<h5>쿠폰적용가</h5>
									</td>
									<td>
										<h5><fmt:formatNumber value="${ivo.getItemPrice() - 1000}" pattern="#,###" />원(1,000원 할인)
										    <select class="form-select d-inline-block w-auto" style="margin-left: 10px;">
	                        <option value="1000">1,000원 할인</option>
                    		</select>
										</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>배송비</h5>
									</td>
									<td>
										<h5>3,000원 (50,000원 이상 구매 시 무료)</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>적립금 </h5>
									</td>
									<td>
										<h5><fmt:formatNumber value="${ivo.getItemPrice() * 0.01}" pattern="#,###" />원(1%)</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>상품코드</h5>
									</td>
									<td>
										<h5>L-${ivo.getLineNo() }I-${ivo.getItemNo() }</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>제조사</h5>
									</td>
									<td>
										<h5>(주)R&Y Pet</h5>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<h6>주문 수량 안내 : 최수 주문 수량 1개 이상</h6>
										<h6>수량을 선택해주세요.</h6>
									</td>
								</tr>
							</tbody>
						</table>
						
						<div id="buttons" class="card-footer p-4 pt-0 border-top-0 bg-transparent d-flex justify-content-between list-unstyled m-0" style="margin: 0; padding: 0;">
						    <div class="text-center flex-grow-1"><a class="btn btn-outline-primary w-100 mt-auto" href="#">주문하기</a></div>
						    <div class="text-center flex-grow-1 mx-2"><a class="btn btn-outline-dark w-100 mt-auto" href="#"><i class="bi bi-cart2"></i></a></div>
						    <div class="text-center flex-grow-1"><a class="btn btn-outline-success w-100 mt-auto" href="#"><i class="bi bi-heart"></i></a></div>
						</div>

					</div>
				</div>
			</div>
			</div>		
		</div>
	</div>
	
  </section>
  <section class="bg-dark p-2" style="--bs-bg-opacity: .05;">
	
	<div class="container px-4 px-lg-5 my-5">
	
		<div class="row gx-4 gx-lg-5 align-items-center">
		
			<div class="col-md-6">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link" id="profile-tab"
						data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile" aria-selected="true">상품 정보</a></li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel"
						aria-labelledby="home-tab">
					<div class="table-responsive">
						<table class="table"> 
							<tbody>
								<tr>
									<td>
										<h5>상품번호</h5>
									</td>
									<td>
										<h5>L${ivo.getLineNo() }I${ivo.getItemNo() } </h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>색상</h5>
									</td>
									<td>
										<h5>화이트</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>가로</h5>
									</td>
									<td>
										<h5>128mm</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>세로</h5>
									</td>
									<td>
										<h5>508mm</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>깊이</h5>
									</td>
									<td>
										<h5>85mm</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>무게</h5>
									</td>
									<td>
										<h5>5kg</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>제조사</h5>
									</td>
									<td>
										<h5>(주)R&Y Pet</h5>
									</td>
								</tr>


								<tr>
									<td>
										<h5>원산지</h5>
									</td>
									<td>
										<h5>대구 중구 동성로</h5>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			</div>		
		
		
			<div class="col-md-6">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link" id="profile-tab"
						data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile" aria-selected="true">상품 설명</a></li>
				</ul>
				<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					<div class="table-responsive">
						<table class="table">
							<tbody>
								<tr>
									<td colspan="2">
										<h5>${ivo.getItemDesc() }</h5>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<h5>전 연령 및 전 품종 사용 가능합니다.</h5>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<h5>&nbsp;</h5>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<h5>&nbsp;</h5>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<h5>&nbsp;</h5>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<h5>&nbsp;</h5>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<h5>&nbsp;</h5>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<h5>&nbsp;</h5>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>



		</div>
	</div>
</section>
<!--================End Product Description Area =================-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5 ">
            	<div class="row justify-content-center">
			        	<img  class="fit-picture"  src="images/line/${ivo.getLineNo() }b.jpg"  alt="..." />
			        </div>
		        </div>
        </section>
        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">관련 상품</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <c:forEach var="item" items="${itemList }">
                
                    <div class="col mb-5">
                    
                    
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <!-- 
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">할인</div>
                             -->
                            <!-- Product image-->
                            <a href="itemInfo.do?itemNo=${item.itemNo }">
                            	<img class="card-img-top" src="images/line/${item.lineNo}a.jpg" alt="..." />
                            </a>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <a href="itemInfo.do?itemNo=${item.itemNo }" style="text-decoration:none">
                                    	<h5 class="fw-bolder">${item.itemName}</h5>
                                   	</a>
                                    <!-- Product reviews-->
                                    <!-- 
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                     -->
                                    <div class="d-flex justify-content-center small text-primary mb-2" style="color: yellow;">
																		<c:forEach begin="1" end="${item.itemNo * 7 % 5 + 1}">
																				<!-- 
                                        <div class="bi-star-fill"></div>
																				 -->
																				 <i class="bi bi-star-fill"></i>
																		</c:forEach>
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through"><fmt:formatNumber value="100000" pattern="#,###" />원</span>
                                    
                                    <fmt:formatNumber value="${item.itemPrice}" pattern="#,###" />원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">장바구니 담기</a></div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </section>
