<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="favicon.png">
<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap4" />

<link href="css/yerim/cart/cart.css" rel="stylesheet">
<title>Cart</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
    <div class="untree_co-section before-footer-section">
        <div class="container">
            <div class="row mb-5">
                <form class="col-md-12" method="post" action="order.do">
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
                                            <div class="input-group mb-3 d-flex align-items-center quantity-container">
                                                <div class="input-group-prepend">
                                                    <button class="btn btn-outline-primary decrease" type="button" data-id="${cart.cartNo}">&minus;</button>
                                                </div>
                                                <input type="number"
                                                    class="form-control text-center quantity-amount"
                                                    name="cartCount"
                                                    data-price="${cart.itemPrice}"
                                                    value="${cart.cartCnt}"
                                                    min="1"
                                                    aria-label="Quantity"
                                                    aria-describedby="button-addon1">
                                                <div class="input-group-append">
                                                    <button class="btn btn-outline-primary increase" type="button" data-id="${cart.cartNo}">&plus;</button>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="item-total">${cart.itemPrice * cart.cartCnt}원</td>
                                        <td>
                                            <a href="deleteCart.do?cno=${cart.cartNo}" class="btn btn-danger btn-sm">X</a>
                                        </td>
                                    </tr>
                                    <c:set var="itemTotal" value="${cart.itemPrice * cart.cartCnt}" />
                                    <c:set var="grandTotal" value="${grandTotal + itemTotal}" />
                                </c:forEach>
                                <c:set var="shippingCost" value="3000" />
                                <c:set var="totalAmount" value="${grandTotal + shippingCost}" />
                            </tbody>
                        </table>
                    </div>

                    <div class="row">
                        <div class="col-md-12 text-right border-bottom mb-4">
                        <br>
                            <p>* 배송비는 3000원으로 구매금액에서 자동으로 추가됩니다.</p>
                            <h3 class="text-black h4 text-uppercase">
                                예상구매금액 : <span id="totalAmount">${totalAmount}</span>원
                            </h3>
                        </div>
                    </div>

                    <input type="hidden" name="grandTotal" value="${grandTotal}">
                    <input type="hidden" name="shippingCost" value="${shippingCost}">
                    <input type="hidden" name="totalAmount" value="${totalAmount}">

                    <div class="row justify-content-center mb-4">
                        <div class="col-md-8 text-center">
                           <a href="order.do?cartNo=${cartNo}">
                            <button class="btn btn-primary btn-lg" type="submit" style="width: 100%; max-width: 400px; height: 60px;">
                                <h4>주문하기</h4>
                            </button>
                            </div>
                        </div>
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
                            <button class="btn btn-primary btn-lg"><h5>등록</h5></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
    $(document).ready(function() {
        function updateTotals() {
            let grandTotal = 0;
            $('.quantity-amount').each(function() {
                let qty = parseInt($(this).val());
                let price = parseInt($(this).data('price'));
                let itemTotal = qty * price;
                $(this).closest('tr').find('.item-total').text(itemTotal);
                grandTotal += itemTotal;
            });
            let shippingCost = 3000;
            let totalAmount = grandTotal + shippingCost;
            $('#totalAmount').text(totalAmount);
            $('input[name="grandTotal"]').val(grandTotal);
            $('input[name="totalAmount"]').val(totalAmount);
        }

        $('.increase').click(function() {
            var $input = $(this).closest('.input-group').find('.quantity-amount');
            var currentVal = parseInt($input.val());
            $input.val(currentVal + 1);
            updateTotals();
        });

        $('.decrease').click(function() {
            var $input = $(this).closest('.input-group').find('.quantity-amount');
            var currentVal = parseInt($input.val());
            if (currentVal > 1) {
                $input.val(currentVal - 1);
                updateTotals();
            }
        });

        // Initialize totals
        updateTotals();
    });
    </script>
</body>
</html>
