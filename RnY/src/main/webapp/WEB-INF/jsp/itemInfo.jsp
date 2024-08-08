<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- ProductVO pvo = (ProductVO) request.getAttribute("pvo"); --%>
    
<!-- 상품상세. -->
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="images/${ivo.getItemImage() }" /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">애견용품</div>
                        <h1 class="display-5 fw-bolder">${ivo.getItemName() }</h1>
                        <div class="fs-5 mb-5">
                            <span class="text-decoration-line-through">100,000원</span>
                            <span>${ivo.getItemPrice() }원</span>
                        </div>
                        <p class="lead">
													배송비	3,000원 (50,000원 이상 구매 시 무료)
                        </p>
                        <p class="lead"> 
													적립금	${Math.round(ivo.itemPrice * 0.1)}원 (10%)
                        </p>
                        <div class="d-flex">
                            <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                장바구니 담기
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Related items section-->
