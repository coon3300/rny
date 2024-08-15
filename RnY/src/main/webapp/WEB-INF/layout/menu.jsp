<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>R&Y 스토어</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<style>
/* 드롭다운 메뉴 기본 스타일 */
.dropdown-menu {
	display: none;
	position: absolute;
	top: 100%;
	left: 0;
	z-index: 1000;
}

/* 마우스 오버 시 드롭다운 메뉴 표시 */
.nav-item:hover>.dropdown-menu {
	display: block;
}

/* 서브메뉴 포지셔닝 */
.dropdown-submenu {
	position: relative;
}

/* 서브메뉴의 드롭다운 메뉴 위치 조정 */
.dropdown-submenu>.dropdown-menu {
	top: 0;
	left: 100%;
	margin-top: -6px;
}

/* 마우스 오버 시 서브메뉴의 드롭다운 메뉴 표시 */
.dropdown-submenu:hover>.dropdown-menu {
	display: block;
}

/* 드롭다운 토글 화살표 제거 */
.dropdown-toggle::after {
	display: none;
}

.nav-link {
	color: #000;
}

/* 폰트 변경 */
body, h1, h2, h3, h4, h5, h6, p, a, span, div, li, td, th, input, button, select, textarea {
/*
    font-family: 'Noto Sans KR', sans-serif !important;
*/
    font-family: 'Poppins', sans-serif !important;
}

</style>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<!--
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
-->

<link rel="stylesheet" type="text/css" href="css/vendor.css">
<link rel="stylesheet" type="text/css" href="css/main/style.css">
<!-- 
<link href="https://webfontworld.github.io/cookierun/CookieRun.css"
	rel="stylesheet">
 -->
 
<!-- Noto Sans KR 폰트
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">	
 -->

<!-- 폰트 변경 Poppins -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

</head>

<body>

	<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
				<defs>
					<symbol xmlns="http://www.w3.org/2000/svg" id="link"
			viewBox="0 0 24 24">
						<path fill="currentColor"
			d="M12 19a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm5 0a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm0-4a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm-5 0a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm7-12h-1V2a1 1 0 0 0-2 0v1H8V2a1 1 0 0 0-2 0v1H5a3 3 0 0 0-3 3v14a3 3 0 0 0 3 3h14a3 3 0 0 0 3-3V6a3 3 0 0 0-3-3Zm1 17a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-9h16Zm0-11H4V6a1 1 0 0 1 1-1h1v1a1 1 0 0 0 2 0V5h8v1a1 1 0 0 0 2 0V5h1a1 1 0 0 1 1 1ZM7 15a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm0 4a1 1 0 1 0-1-1a1 1 0 0 0 1 1Z" />
					</symbol>
					<symbol xmlns="http://www.w3.org/2000/svg" id="arrow-right"
			viewBox="0 0 24 24">
						<path fill="currentColor"
			d="M17.92 11.62a1 1 0 0 0-.21-.33l-5-5a1 1 0 0 0-1.42 1.42l3.3 3.29H7a1 1 0 0 0 0 2h7.59l-3.3 3.29a1 1 0 0 0 0 1.42a1 1 0 0 0 1.42 0l5-5a1 1 0 0 0 .21-.33a1 1 0 0 0 0-.76Z" />
					</symbol>
					<symbol xmlns="http://www.w3.org/2000/svg" id="category"
			viewBox="0 0 24 24">
						<path fill="currentColor"
			d="M19 5.5h-6.28l-.32-1a3 3 0 0 0-2.84-2H5a3 3 0 0 0-3 3v13a3 3 0 0 0 3 3h14a3 3 0 0 0 3-3v-10a3 3 0 0 0-3-3Zm1 13a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-13a1 1 0 0 1 1-1h4.56a1 1 0 0 1 .95.68l.54 1.64a1 1 0 0 0 .95.68h7a1 1 0 0 1 1 1Z" />
					</symbol>
					<symbol xmlns="http://www.w3.org/2000/svg" id="calendar"
			viewBox="0 0 24 24">
						<path fill="currentColor"
			d="M19 4h-2V3a1 1 0 0 0-2 0v1H9V3a1 1 0 0 0-2 0v1H5a3 3 0 0 0-3 3v12a3 3 0 0 0 3 3h14a3 3 0 0 0 3-3V7a3 3 0 0 0-3-3Zm1 15a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-7h16Zm0-9H4V7a1 1 0 0 1 1-1h2v1a1 1 0 0 0 2 0V6h6v1a1 1 0 0 0 2 0V6h2a1 1 0 0 1 1 1Z" />
					</symbol>
					<symbol xmlns="http://www.w3.org/2000/svg" id="heart"
			viewBox="0 0 24 24">
						<path fill="currentColor"
			d="M20.16 4.61A6.27 6.27 0 0 0 12 4a6.27 6.27 0 0 0-8.16 9.48l7.45 7.45a1 1 0 0 0 1.42 0l7.45-7.45a6.27 6.27 0 0 0 0-8.87Zm-1.41 7.46L12 18.81l-6.75-6.74a4.28 4.28 0 0 1 3-7.3a4.25 4.25 0 0 1 3 1.25a1 1 0 0 0 1.42 0a4.27 4.27 0 0 1 6 6.05Z" />
					</symbol>
					<symbol xmlns="http://www.w3.org/2000/svg" id="plus"
			viewBox="0 0 24 24">
						<path fill="currentColor"
			d="M19 11h-6V5a1 1 0 0 0-2 0v6H5a1 1 0 0 0 0 2h6v6a1 1 0 0 0 2 0v-6h6a1 1 0 0 0 0-2Z" />
					</symbol>
					<symbol xmlns="http://www.w3.org/2000/svg" id="minus"
			viewBox="0 0 24 24">
						<path fill="currentColor"
			d="M19 11H5a1 1 0 0 0 0 2h14a1 1 0 0 0 0-2Z" />
					</symbol>
					<symbol xmlns="http://www.w3.org/2000/svg" id="cart"
			viewBox="0 0 24 24">
						<path fill="currentColor"
			d="M8.5 19a1.5 1.5 0 1 0 1.5 1.5A1.5 1.5 0 0 0 8.5 19ZM19 16H7a1 1 0 0 1 0-2h8.491a3.013 3.013 0 0 0 2.885-2.176l1.585-5.55A1 1 0 0 0 19 5H6.74a3.007 3.007 0 0 0-2.82-2H3a1 1 0 0 0 0 2h.921a1.005 1.005 0 0 1 .962.725l.155.545v.005l1.641 5.742A3 3 0 0 0 7 18h12a1 1 0 0 0 0-2Zm-1.326-9l-1.22 4.274a1.005 1.005 0 0 1-.963.726H8.754l-.255-.892L7.326 7ZM16.5 19a1.5 1.5 0 1 0 1.5 1.5a1.5 1.5 0 0 0-1.5-1.5Z" />
					</symbol>
					<symbol xmlns="http://www.w3.org/2000/svg" id="check"
			viewBox="0 0 24 24">
						<path fill="currentColor"
			d="M18.71 7.21a1 1 0 0 0-1.42 0l-7.45 7.46l-3.13-3.14A1 1 0 1 0 5.29 13l3.84 3.84a1 1 0 0 0 1.42 0l8.16-8.16a1 1 0 0 0 0-1.47Z" />
					</symbol>
					<symbol xmlns="http://www.w3.org/2000/svg" id="trash"
			viewBox="0 0 24 24">
						<path fill="currentColor"
			d="M10 18a1 1 0 0 0 1-1v-6a1 1 0 0 0-2 0v6a1 1 0 0 0 1 1ZM20 6h-4V5a3 3 0 0 0-3-3h-2a3 3 0 0 0-3 3v1H4a1 1 0 0 0 0 2h1v11a3 3 0 0 0 3 3h8a3 3 0 0 0 3-3V8h1a1 1 0 0 0 0-2ZM10 5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v1h-4Zm7 14a1 1 0 0 1-1 1H8a1 1 0 0 1-1-1V8h10Zm-3-1a1 1 0 0 0 1-1v-6a1 1 0 0 0-2 0v6a1 1 0 0 0 1 1Z" />
					</symbol>
					<symbol xmlns="http://www.w3.org/2000/svg" id="star-outline"
			viewBox="0 0 15 15">
						<path fill="none" stroke="currentColor" stroke-linecap="round"
			stroke-linejoin="round"
			d="M7.5 9.804L5.337 11l.413-2.533L4 6.674l2.418-.37L7.5 4l1.082 2.304l2.418.37l-1.75 1.793L9.663 11L7.5 9.804Z" />
					</symbol>
					<symbol xmlns="http://www.w3.org/2000/svg" id="star-solid"
			viewBox="0 0 15 15">
						<path fill="currentColor"
			d="M7.953 3.788a.5.5 0 0 0-.906 0L6.08 5.85l-2.154.33a.5.5 0 0 0-.283.843l1.574 1.613l-.373 2.284a.5.5 0 0 0 .736.518l1.92-1.063l1.921 1.063a.5.5 0 0 0 .736-.519l-.373-2.283l1.574-1.613a.5.5 0 0 0-.283-.844L8.921 5.85l-.968-2.062Z" />
					</symbol>
					<symbol xmlns="http://www.w3.org/2000/svg" id="search"
			viewBox="0 0 24 24">
						<path fill="currentColor"
			d="M21.71 20.29L18 16.61A9 9 0 1 0 16.61 18l3.68 3.68a1 1 0 0 0 1.42 0a1 1 0 0 0 0-1.39ZM11 18a7 7 0 1 1 7-7a7 7 0 0 1-7 7Z" />
					</symbol>
					<symbol xmlns="http://www.w3.org/2000/svg" id="user"
			viewBox="0 0 24 24">
						<path fill="currentColor"
			d="M15.71 12.71a6 6 0 1 0-7.42 0a10 10 0 0 0-6.22 8.18a1 1 0 0 0 2 .22a8 8 0 0 1 15.9 0a1 1 0 0 0 1 .89h.11a1 1 0 0 0 .88-1.1a10 10 0 0 0-6.25-8.19ZM12 12a4 4 0 1 1 4-4a4 4 0 0 1-4 4Z" />
					</symbol>
					<symbol xmlns="http://www.w3.org/2000/svg" id="close"
			viewBox="0 0 15 15">
						<path fill="currentColor"
			d="M7.953 3.788a.5.5 0 0 0-.906 0L6.08 5.85l-2.154.33a.5.5 0 0 0-.283.843l1.574 1.613l-.373 2.284a.5.5 0 0 0 .736.518l1.92-1.063l1.921 1.063a.5.5 0 0 0 .736-.519l-.373-2.283l1.574-1.613a.5.5 0 0 0-.283-.844L8.921 5.85l-.968-2.062Z" />
					</symbol>
		
				</defs>
			</svg>

	<div class="preloader-wrapper">
		<div class="preloader"></div>
	</div>

	<div class="offcanvas offcanvas-end" data-bs-scroll="true"
		tabindex="-1" id="offcanvasCart" aria-labelledby="My Cart">
		<div class="offcanvas-header justify-content-center">
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
				aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<div class="order-md-last">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-primary">장바구니</span> <a href="cart.do"><span
						class="badge bg-primary rounded-circle pt-2">></span></a>
				</h4>

				<ul class="list-group mb-3">
					<c:forEach var="od" items="${logCart}" varStatus="status">
						<li class="list-group-item d-flex justify-content-between lh-sm">
							<div>
								<h6 class="my-0">${od.itemName}</h6>
								<small class="text-body-secondary">${od.itemDesc}</small>
							</div> <span class="text-body-secondary">${od.itemPrice}원</span>
						</li>
					</c:forEach>

				</ul>

				<a href="order.do"><button class="w-100 btn btn-primary btn-lg"
						type="submit">주문하기</button></a>
			</div>
		</div>
	</div>

	<div class="offcanvas offcanvas-end" data-bs-scroll="true"
		tabindex="-1" id="offcanvasSearch" aria-labelledby="Search">
		<div class="offcanvas-header justify-content-center">
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
				aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">

			<div class="order-md-last">
				<h4 class="text-primary text-uppercase mb-3">Search</h4>
				<div class="search-bar border rounded-2 border-dark-subtle">
					<!-- search-form2 -->
					<form id="search-form2"
						class="text-center d-flex align-items-center" action="itemListSearch.do" method="">
						<input type="text" class="form-control border-0 bg-transparent"
							placeholder="검색어를 입력하세요." name="keyword"/>
						<iconify-icon icon="tabler:search" class="fs-4 me-3"></iconify-icon>
					</form>
				</div>
			</div>
		</div>
	</div>

	<header>
		<div class="container py-2">
			<div class="row py-4 pb-0 pb-sm-4 align-items-center ">

				<div class="col-sm-4 col-lg-3 text-center text-sm-start">
					<div class="main-logo">
						<a href="main.do"> <img src="images/logoDog.png" alt="logo"
							class="img-fluid">
						</a>
					</div>
				</div>

				<div
					class="col-sm-6 offset-sm-2 offset-md-0 col-lg-5 d-none d-lg-block">
					<div class="search-bar border rounded-2 px-3 border-dark-subtle">
						<!-- search-form1 -->
						<form id="search-form1"
							class="text-center d-flex align-items-center" action="itemListSearch.do" method="">
							<input type="text" class="form-control border-0 bg-transparent"
								placeholder="검색어를 입력하세요" name="keyword"/>
								<button type="submit" class="border-0 bg-transparent">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24">
										<path fill="currentColor"
									d="M21.71 20.29L18 16.61A9 9 0 1 0 16.61 18l3.68 3.68a1 1 0 0 0 1.42 0a1 1 0 0 0 0-1.39ZM11 18a7 7 0 1 1 7-7a7 7 0 0 1-7 7Z" />
									</svg>
								</button>
						</form>
					</div>
				</div>
				<div class="col-sm-8 col-lg-4 d-flex justify-content-end gap-5 align-items-center mt-4 mt-sm-0 justify-content-center justify-content-sm-end">
					<div class="support-box text-end d-none d-xl-block">
						<!-- 
						<span class="fs-6 secondary-font text-muted">연락처</span>
						<h5 class="mb-0">053-421-2460</h5>
						 -->
							<c:choose>
								<c:when test="${!empty logid}">
									<span class="fs-6 secondary-font text-muted">${logNick}님 환영합니다.</span>
										<a class="mx-3" href="mypage.do"><i	class="bi bi-person-fill-gear" style="font-size: 25px;"></i></a>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
					</div>
					<div class="support-box text-end d-none d-xl-block">
						<!-- 
						<span class="fs-6 secondary-font text-muted">이메일</span>
						<h5 class="mb-0">yedam@ac.kr</h5>
						 -->
					</div>



				</div>
			</div>
		</div>

		<div class="container-fluid">
			<hr class="m-0">
		</div>


		<div class="container">
			<nav class="main-menu d-flex navbar navbar-expand-lg ">
				<div class="d-flex d-lg-none align-items-end mt-3">
					<ul class="d-flex justify-content-end list-unstyled m-0">
						<c:choose>
							<c:when test="${!empty logid}">
							
								<li style="line-height:24px;">
									${logNick}님 
									<a href="logout.do">
									&nbsp;&nbsp;&nbsp;&nbsp;로그아웃&nbsp;&nbsp;&nbsp;&nbsp;</a>
								</li>
								<!-- 
									<span class="fs-6 secondary-font text-muted">${logNick}님<a href="logout.do">
									<i class="bi bi-box-arrow-right" style="font-size: 30px;"></i>로그아웃</a>
									</span>
								 -->
							</c:when>
							<c:otherwise>
								<li><a class="mx-3" href="loginForm.do"
									data-bs-toggle="modal" data-bs-target="#loginModal"> <iconify-icon
											icon="healthicons:person" class="fs-4"></iconify-icon>
								</a></li>
							</c:otherwise>
						</c:choose>

						<li><a href="wish.do" class="mx-3"> <iconify-icon
									icon="mdi:heart" class="fs-4"></iconify-icon>
						</a></li>

						<li><a href="#" class="mx-3" data-bs-toggle="offcanvas"
							data-bs-target="#offcanvasCart" aria-controls="offcanvasCart">
								<iconify-icon icon="mdi:cart" class="fs-4 position-relative"></iconify-icon>
								<span
								class="position-absolute translate-middle badge rounded-circle bg-primary pt-2">

							</span>
						</a></li>

						<li><a href="#" class="mx-3" data-bs-toggle="offcanvas"
							data-bs-target="#offcanvasSearch" aria-controls="offcanvasSearch">
								<iconify-icon icon="tabler:search" class="fs-4"></iconify-icon>
								</span>
						</a></li>
					</ul>
				</div>

				<button class="navbar-toggler" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
					aria-controls="offcanvasNavbar">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="offcanvas offcanvas-end" tabindex="-1"
					id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">

					<div class="offcanvas-header justify-content-center">
						<button type="button" class="btn-close"
							data-bs-dismiss="offcanvas" aria-label="Close"></button>
					</div>

					<div class="offcanvas-body justify-content-between ">
						<select class="filter-categories border-0 mb-0 me-5">
							<option>R&Y 스토어</option>
						</select>
						<ul class="navbar-nav list-unstyled d-flex gap-md-3 mb-0">
							<li class="nav-item dropdown"><a
								href="itemListLine.do?lineNo=11" class="nav-link dropdown-toggle"
								id="navbarDropdown11" role="button" aria-expanded="false">
									간식 </a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown11">
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=101">강아지껌</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=102">비스켓/스낵</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=103">수제간식</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=104">육포/사사미</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=105">캔/파우치</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=106">기타간식</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=107">고양이간식</a>
									</li>
								</ul></li>
							<li class="nav-item dropdown"><a
								href="itemListLine.do?lineNo=12" class="nav-link dropdown-toggle"
								id="navbarDropdown12" role="button" aria-expanded="false">
									사료 </a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown12">
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=201">건식사료</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=202">습식사료</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=203">우유/분유</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=204">강아지영양제</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=205">고양이사료</a>
									</li>
								</ul></li>
							<li class="nav-item dropdown"><a
								href="itemListLine.do?lineNo=13" class="nav-link dropdown-toggle"
								id="navbarDropdown13" role="button" aria-expanded="false">
									미용용품 </a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown13">
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=301">드라이기</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=302">발톱관리용품</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=303">브러시</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=304">샤워기/타월</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=305">이발기/가위</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=306">기타미용용품</a>
									</li>
								</ul></li>
							<li class="nav-item dropdown"><a
								href="itemListLine.do?lineNo=14" class="nav-link dropdown-toggle"
								id="navbarDropdown14" role="button" aria-expanded="false">
									패션용품 </a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown14">
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=401">레인코트</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=402">신발/양말</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=403">외투</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=404">원피스/올인원</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=405">코스튬</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=406">셔츠/상의</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=407">기타패션용품</a>
									</li>
								</ul></li>
							<li class="nav-item dropdown"><a
								href="itemListLine.do?lineNo=15" class="nav-link dropdown-toggle"
								id="navbarDropdown15" role="button" aria-expanded="false">
									위생용품 </a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown15">
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=501">구강위생용품</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=502">기저귀</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=503">배변봉투</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=504">배변판</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=505">배변패드</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=506">탈취/소독제</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=507">눈/귀
											위생용품</a></li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=508">넥카라</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=509">해충방지용품</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=510">고양이화장실</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=511">고양이모래</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=512">기타고양이위생용품</a>
									</li>
								</ul></li>
							<li class="nav-item dropdown"><a
								href="itemListLine.do?lineNo=16" class="nav-link dropdown-toggle"
								id="navbarDropdown16" role="button" aria-expanded="false">
									식기/급수기 </a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown16">
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=601">급수기</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=602">급식기</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=603">정수기</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=604">사료보관통</a>
									</li>
								</ul></li>
							<li class="nav-item dropdown"><a
								href="itemListLine.do?lineNo=17" class="nav-link dropdown-toggle"
								id="navbarDropdown17" role="button" aria-expanded="false">
									외출용품 </a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown17">
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=701">가슴줄</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=702">리드줄</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=703">목걸이/인식표</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=704">목줄</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=705">유모차</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=706">이동가방/이동장</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=707">차량용캐리어/시트</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=708">입마개</a>
									</li>
								</ul></li>
							<li class="nav-item dropdown"><a
								href="itemListLine.do?lineNo=18" class="nav-link dropdown-toggle"
								id="navbarDropdown18" role="button" aria-expanded="false">
									장난감/훈련용품 </a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown18">
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=801">공/원반</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=802">인형</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=803">터널/큐브</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=804">훈련용품</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=805">기타장난감</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=806">캣타워</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=807">고양이스크래쳐</a>
									</li>
									<li class="dropdown-submenu"><a
										class="dropdown-item nav-link " href="itemListLine.do?lineNo=808">고양이장난감</a>
									</li>
								</ul></li>
						</ul>

						<div class="d-none d-lg-flex align-items-end">
							<ul class="d-flex justify-content-end list-unstyled m-0">
								<!--  -->


								<c:choose>
									<c:when test="${!empty logid}">
										
										<li>
									<a class="mx-3" href="logout.do"><i	class="bi bi-box-arrow-right" style="font-size: 16px;"></i>로그아웃</a>
										</li>
										
									</c:when>
									<c:otherwise>
										<li><a class="nav-link mx-3" href="loginForm.do"
											data-bs-toggle="modal" data-bs-target="#loginModal"> <iconify-icon
													icon="healthicons:person" class="fs-4"></iconify-icon>
										</a></li>
									</c:otherwise>
								</c:choose>
								
								<!--  -->
								<li><a class="nav-link mx-3" href="wish.do"> <iconify-icon
											icon="mdi:heart" class="fs-4"></iconify-icon>
								</a></li>

								<li class=""><a href="#" class="nav-link mx-3"
									data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart"
									aria-controls="offcanvasCart"> <iconify-icon
											icon="mdi:cart" class="fs-4 position-relative"></iconify-icon>
										<span
										class="position-absolute translate-middle badge rounded-circle bg-primary pt-2">

									</span>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</nav>
		</div>
	</header>

	<!-- Modal -->
	<div class="modal fade" id="loginModal" tabindex="-1"
		aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">

					<h1 class="modal-title fs-5" id="loginModalLabel">로그인 화면</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="">
						<img class="mb-4" src="assets/brand/bootstrap-logo.svg" alt=""
							width="72" height="57">
						<h1 class="h3 mb-3 fw-normal">로그인 하세요</h1>
						<!-- 
						<div id="msg">
							<c:if test="${!empty msg }">
								<script>
									/* alert("아이디와 비밀번호를 확인하세요"); */
									document.getElementById('loginModal').classList
											.add('show');
									document.getElementById('loginModal')
											.setAttribute('aria-modal', "true");
									document.getElementById('loginModal')
											.setAttribute('role', 'dialog');
									document.getElementById('loginModal')
											.removeAttribute('aria-hidden');
									document.getElementById('loginModal').style.display = 'block';
								</script>
								<p style="color: red;">${msg }</p>
							</c:if>
						</div>
 -->
						<div class="form-floating">
							<input type="text" class="form-control" id="floatingInput"
								placeholder="아이디를 입력하세요." name="id"> <label
								for="floatingInput">아이디</label>
						</div>
						<div class="form-floating">
							<input type="password" class="form-control" id="floatingPassword"
								placeholder="비밀번호를 입력하세요." name="pw"> <label
								for="floatingPassword">비밀번호</label>
						</div>

						<div class="form-check text-start my-3">
							<input class="form-check-input" type="checkbox"
								value="remember-me" id="flexCheckDefault"> <label
								class="form-check-label" for="flexCheckDefault"> 아이디
								기억하기. </label>
						</div>
						<button class="btn btn-primary w-100 py-2" type="button"
							id="joinBtn">로그인</button>
					</form>
					<a href="addform.do"><button class="btn btn-warning w-100 py-2"
							type="submit">회원가입</button></a>
					<p class="mt-5 mb-3 text-body-secondary">&copy; 2017–2024</p>

				</div>
			</div>
		</div>
	</div>
	<script>
    document.querySelector('#joinBtn').onclick = function(e) {
    let id = document.querySelector('#floatingInput').value;
    let pw = document.querySelector('#floatingPassword').value;
    
    let url = "login.do?id="+id+"&pw="+pw;
    fetch(url) // promise객체. then(), catch() ,optionObj > fetch 옵션
        .then(function(result) {
            //console.log(result);    // Response 객체.
            return result.json(); //json 문자열 형태로 반환.
        })
        .then(function(result) {
            //console.log(result);
            if (result.recCode == 'Fail'){ // 로그인실패
                alert("로그인 실패 재시도하세요.");
            }else{ // 로그인성공
            	if(result.retVal == "user"){// 회원인경우
                location.href="main.do";
            	} else{	// 관리자인경우
                location.href="adminpage.do";
            	}
            }
        })
        .catch(function(err) {
            console.err(err);
        })
}
</script>
	<!--   <script>
		  new bootstrap.Modal(document.getElementById('loginModal')).show();
		  </script> -->
</body>

</html>