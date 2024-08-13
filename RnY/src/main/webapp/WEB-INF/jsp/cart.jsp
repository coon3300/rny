<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- /*
* Bootstrap 5
* Template Name: Furni
* Template Author: Untree.co
* Template URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="author" content="Untree.co">
  <link rel="shortcut icon" href="favicon.png">

  <meta name="description" content="" />
  <meta name="keywords" content="bootstrap, bootstrap4" />



		<!-- Bootstrap CSS -->
		
		<link href="css/yerim/cart/cart.css" rel="stylesheet">
		<title>Furni Free Bootstrap 5 Template for Furniture and Interior Design Websites by Untree.co </title>
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
                          <th class="product-remove">X</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:set var="total" value="0" />
                      <c:forEach var="cart" items="${logCart}" varStatus="status">
                        <tr>
                          <td class="product-thumbnail">
                            <img src="images/${cart.itemImage}" alt="Image" class="img-fluid">
                          </td>
                          <td class="product-name">
                            <h2 class="h5 text-black">${cart.itemName}</h2>
                          </td>
                          <td>${cart.itemPrice}원</td>
                          <td>
                            <div class="input-group mb-3 d-flex align-items-center quantity-container" style="max-width: 120px;">
                              <div class="input-group-prepend">
                                <button class="btn btn-outline-black decrease" type="button">&minus;</button>
                              </div>
                              <input type="text" class="form-control text-center quantity-amount" value="${cart.cartCnt}" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
                              <div class="input-group-append">
                                <button class="btn btn-outline-black increase" type="button">&plus;</button>
                              </div>
                            </div>
        
                          </td>
                          <td>${cart.itemPrice * cart.cartCnt}원</td>
                          <td><a href="deleteCart.do?cno=${cart.cartNo}" class="btn btn-black btn-sm">X</a></td>
                        </tr>
                        <c:set var= "total" value="${total + (cart.itemPrice * cart.cartCnt)}"/>
                        </c:forEach>
        
                        
                      </tbody>
                    </table>
                  </div>
                </form>
              </div>
        
              <div class="row">
                <div class="col-md-6">
                  <div class="row">
                    <div class="col-md-12">
                      <label class="text-black h4" for="coupon"><h2>쿠폰</h2></label>
                      <p>쿠폰을 입력하고 할인된 가격으로 구매하세요!</p>
                    </div>
                    <div class="col-md-8 mb-3 mb-md-0">
                      <input type="text" class="form-control py-3" id="coupon" placeholder="숫자만 입력하세요.">
                    </div>
                    <div class="col-md-4">
                      <button class="btn btn-black" ><h5>등록</h5></button>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 pl-5">
                  <div class="row justify-content-end">
                    <div class="col-md-7">
                      <div class="row">
                        <div class="col-md-12 text-right border-bottom mb-5">
                          <h3 class="text-black h4 text-uppercase">예상구매금액 : ${total}원</h3>
                        </div>
                      </div>
                      <div class="row mb-3">
                      </div>
                      <div class="row mb-5">
                      </div>
        
                      <div class="row">
                        <div class="col-md-12">
                        <a href="order.do">
                          <button class="btn btn-black btn-lg py-3 btn-block" style="width: 300px; height: 70px;">주문하기</button></a>
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
	</body>

</html>
