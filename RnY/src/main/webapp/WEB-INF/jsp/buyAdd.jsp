<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String logNick = (String) session.getAttribute("logNick");
String logName = (String) session.getAttribute("logName");
%>



<title>Order Complete | Shopping Mall</title>
<link href="css/yerim/pay/pay.css" rel="stylesheet">

<body>

	<div class="colorlib-loader2"></div>

	<div id="page">
		<nav class="colorlib-nav" role="navigation">
			<div class="container">
				<h1>${logNick}님 주문완료!</h1>
			</div>
		</nav>

		<div class="breadcrumbs">
			<div class="container">
				<p class="bread">
					<span><a href="index.html">RnY</a></span> / <span>주문완료</span>
				</p>
			</div>
		</div>

		<div class="colorlib-product">
			<div class="container">
				<div class="row row-pb-lg">
					<div class="col-sm-10 offset-md-1">
						<div class="process-wrap">
							<div class="process text-center active">
								<p>
									<!--  <span>01</span>-->
									<span>01</span>
								</p>
								<h3>장바구니</h3>
							</div>
							<div class="process text-center active">
								<p>
									<span>02</span>
								</p>
								<h3>주문</h3>
							</div>
							<div class="process text-center active">
								<p>
									<span>03</span>
								</p>
								<h3>주문완료</h3>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-10 offset-sm-1 text-center">
						<p class="icon-addcart">
							<span><i class="icon-check"></i></span>
						</p>
						<h2 class="mb-4">${logNick}님 아래 계좌로 입금부탁드립니다.</h2>
						<h4 class="mb-4">카카오뱅크 123-1234-1234-12</h4>
						<p>
							<a href="main.do" class="btn btn-primary btn-outline-primary">메인</a>
							<a href="buyList.do" class="btn btn-primary btn-outline-primary"><i
								class="icon-shopping-cart"></i> 주문상세</a>
						</p>
					</div>
				</div>
			</div>
		</div>

		<div class="gototop js-top">
			<a href="#" class="js-gotop"><i class="ion-ios-arrow-up"></i></a>
		</div>
	</div>

</body>
