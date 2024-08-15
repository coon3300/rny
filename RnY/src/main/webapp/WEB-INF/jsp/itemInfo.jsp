<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 상품상세. -->
<!-- Product section-->
<section class="py-5 bg-light">
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="col-md-6">
				<img class="card-img-top mb-5 mb-md-0"
					src="images/${ivo.getItemImage() }" />
			</div>
			<div class="col-md-6">
				<div class="fs-5 mb-5">${ivo.getItemDesc() }</div>
				<h1 class="display-5 fw-bolder">${ivo.getItemName() }</h1>
				<div class="fs-5 mb-5">
					<span class="text-decoration-line-through">100,000원</span> <span><fmt:formatNumber value="${ivo.getItemPrice()}" pattern="#,###" />원</span>
				</div>
				<p class="lead">배송비 3,000원 (50,000원 이상 구매 시 무료)</p>
				
				<p class="lead">적립금 <fmt:formatNumber value="${Math.round(ivo.itemPrice * 0.1)}" pattern="#,###" />원 (10%)</p>
				<div class="d-flex">
					<input class="form-control text-center me-3" id="inputQuantity"
						type="num" value="1" style="max-width: 3rem" />
					<button class="btn btn-outline-dark flex-shrink-0" type="button">
						<i class="bi-cart-fill me-1"></i> 장바구니 담기
					</button>
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
                            	<img class="card-img-top" src="images/${item.itemImage}" alt="..." />
                            </a>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <a href="itemInfo.do?itemNo=${item.itemNo }">
                                    	<h5 class="fw-bolder">${item.itemName}</h5>
                                   	</a>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
																		<c:forEach begin="1" end="${item.itemNo * 7 % 5 + 1}">
                                        <div class="bi-star-fill"></div>
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
