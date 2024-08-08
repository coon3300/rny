<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String logNick = (String) session.getAttribute("logNick");
%>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/yerim/order/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/yerim/order/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/yerim/order/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/yerim/order/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/yerim/order/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/yerim/order/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/yerim/order/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/yerim/order/style.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
           
            <div class="checkout__form">
                <h4>${logNick}님의 주문</h4>
                
                <form action="#">
                    <div class="row">
 										<c:forEach var="order" items="${order}" varStatus="status">
                    
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>받는사람<span>*</span></p>
                                        <input type="text" value="${order.userName}">
                                    </div>
                                </div>
                                <div class="checkout__input">
                                <p>주소<span>*</span></p>
                                <input type="text" placeholder="${order.userAdd}" class="checkout__input__add">
                                <div class="checkout__input__checkbox">
                                <label for="acc">
                                    선택사항) 다른 주소
                                    <input type="checkbox" id="acc">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                                <input type="text" placeholder="기본배송지 외 다른배송지 선택">
                            </div>
                                <div class="col-lg-12">
                                    <div class="checkout__input">
                                        <p>휴대전화<span>*</span></p>
                                        <input type="text" value="010" class="col-sm-3"> - 
                                        <input type="text" class="col-sm-3"> - 
                                        <input type="text" class="col-sm-3">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>이메일<span>*</span></p>
                                <input type="text">
                            </div>
                            <div class="checkout__input">
                                <p>메시지<span></span></p>
                                <input type="textarea">
                            </div>
                            
                            <h4><br/>주문상품</h4>
                            <ul>
                            <img src="images/${ivo.itemImage}.jpg" class="img-fluid rounded-4" alt="image">
                            <p>상품번호:${ivo.itemNo }</p>
                            <p>상품이름:${ivo.itemName }</p>
                            <p>상품가격:${ivo.itemPrice }원</p>
                            </ul>
                            <div class="checkout__input">
                                <p>Country/State<span>*</span></p>
                                <input type="text">
                            </div>
                            <div class="checkout__input">
                                <p>Postcode / ZIP<span>*</span></p>
                                <input type="text">
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input__checkbox">
                                <label for="acc">
                                    Create an account?
                                    <input type="checkbox" id="acc">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <p>Create an account by entering the information below. If you are a returning customer
                                please login at the top of the page</p>
                            <div class="checkout__input">
                                <p>Account Password<span>*</span></p>
                                <input type="text">
                            </div>
                            <div class="checkout__input__checkbox">
                                <label for="diff-acc">
                                    Ship to a different address?
                                    <input type="checkbox" id="diff-acc">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="checkout__input">
                                <p>Order notes<span>*</span></p>
                                <input type="text"
                                    placeholder="Notes about your order, e.g. special notes for delivery.">
                            </div>
                        </div>
                        </c:forEach>
                        
                        
                        
                        
                        
                        
                        
                        <!-- 주문총액 -->
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>${logNick}님의 주문</h4>
                                <div class="checkout__order__products">상품<span>총액</span></div>
                                <ul>
                               <!--  --> <c:forEach var="order" items="${ovo.orderList}" varStatus="status">
                                    <li> <span></span></li>
                                    <li>${ivo.itemName} <span>${ivo.itemPrice}</span></li>
                                    </c:forEach>
                                </ul>
                                <div class="checkout__order__subtotal">총액<span>${ovo.orderPrice}</span></div>
                                <div class="checkout__order__total">할인금액 <span>${ovo.orderPrice}</span></div>
                                <div class="checkout__input__checkbox">
                                    <label for="acc-or">
                                        Create an account?
                                        <input type="checkbox" id="acc-or">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adip elit, sed do eiusmod tempor incididunt
                                    ut labore et dolore magna aliqua.</p>
                                <div class="checkout__input__checkbox">
                                    <label for="payment">
                                        Check Payment
                                        <input type="checkbox" id="payment">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="checkout__input__checkbox">
                                    <label for="paypal">
                                        Paypal
                                        <input type="checkbox" id="paypal">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <button type="submit" class="site-btn">PLACE ORDER</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->



    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>

 

</body>

