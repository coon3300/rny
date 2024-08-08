<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Footwear - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700"
	rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet" href="css/yerim/cart/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/yerim/cart/icomoon.css">
<!-- Ion Icon Fonts-->
<link rel="stylesheet" href="css/yerim/cart/ionicons.min.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/yerim/cart/bootstrap.min.css">
<!-- Magnific Popup -->
<link rel="stylesheet" href="css/yerim/cart/magnific-popup.css">
<!-- Flexslider  -->
<link rel="stylesheet" href="css/yerim/cart/flexslider.css">
<!-- Owl Carousel -->
<link rel="stylesheet" href="css/yerim/cart/owl.carousel.min.css">
<link rel="stylesheet" href="css/yerim/cart/owl.theme.default.min.css">
<!-- Date Picker -->
<link rel="stylesheet" href="css/yerim/cart/bootstrap-datepicker.css">
<!-- Flaticons  -->
<!-- <link rel="stylesheet" href="fonts/yerim/cart/flaticon/font/flaticon.css"> -->
<!-- Theme style  -->
<link rel="stylesheet" href="css/yerim/cart/style.css">

</head>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<br/><br/><br/>
<div class="col-md-12">
						<div class="product-name d-flex">
					
  <c:forEach var="cart" items="${cartList}" varStatus="status">
							<div class="one-forth text-left px-4">
								<span>상품내용</span>
							</div>
							<div class="one-eight text-center">
								<span>가격</span>
							</div>
							<div class="one-eight text-center">
								<span>개수</span>
							</div>
							<div class="one-eight text-center">
								<span>금액</span>
							</div>
							<div class="one-eight text-center px-4">
								<span>삭제</span>
							</div>
						</div>
						<div class="product-cart d-flex">
							<div class="one-forth">
								<div class="product-img" style="background-image: url(images/item-6.jpg);">
								</div>
								<div class="display-tc">
									<h3>${ivo.itemName}</h3>
									<p>${cart.cartNo}</p>
								</div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<span class="price">${ivo.itemPrice}</span>
								</div>
							</div>
							
							</c:forEach>
							
							<div class="col-md-12">
					<button type="button" class="btn btn-info">주문하기</button>
							</div>
			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
						</div>
						</div>
						
						


<!-- jQuery -->
<script src="js/yerim/cart/jquery.min.js"></script>
<!-- popper -->
<script src="js/yerim/cart/popper.min.js"></script>
<!-- bootstrap 4.1 -->
<script src="js/yerim/cart/bootstrap.min.js"></script>
<!-- jQuery easing -->
<script src="js/yerim/cart/jquery.easing.1.3.js"></script>
<!-- Waypoints -->
<script src="js/yerim/cart/jquery.waypoints.min.js"></script>
<!-- Flexslider -->
<script src="js/yerim/cart/jquery.flexslider-min.js"></script>
<!-- Owl carousel -->
<script src="js/yerim/cart/owl.carousel.min.js"></script>
<!-- Magnific Popup -->
<script src="js/yerim/cart/jquery.magnific-popup.min.js"></script>
<script src="js/yerim/cart/magnific-popup-options.js"></script>
<!-- Date Picker -->
<script src="js/yerim/cart/bootstrap-datepicker.js"></script>
<!-- Stellar Parallax -->
<script src="js/yerim/cart/jquery.stellar.min.js"></script>
<!-- Main -->
<script src="js/yerim/cart/main.js"></script>

</body>
</html>