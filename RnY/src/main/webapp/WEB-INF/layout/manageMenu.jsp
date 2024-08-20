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
body, h1, h2, h3, h4, h5, h6, p, a, span, div, li, td, th, input, button,
	select, textarea {
	/* font-family: 'Noto Sans KR', sans-serif !important;*/
	/* font-family: 'Poppins', sans-serif !important; */
	font-family: 'Arial', sans-serif !important;

}
</style>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">

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
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">



<div class="preloader-wrapper">
	<div class="preloader"></div>
</div>

<div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1"
	id="offcanvasCart" aria-labelledby="My Cart">
	<div class="offcanvas-header justify-content-center">
		<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
			aria-label="Close"></button>
	</div>
	<div class="offcanvas-body">
		<div class="order-md-last">
			<h4 class="d-flex justify-content-between align-items-center mb-3">
				<span class="text-primary">장바구니</span> <a href="cartList.do"><span
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

<div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1"
	id="offcanvasSearch" aria-labelledby="Search">
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
					class="text-center d-flex align-items-center"
					action="itemListSearch.do" method="">
					<input type="text" class="form-control border-0 bg-transparent"
						placeholder="검색어를 입력하세요." name="keyword" />
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
						class="text-center d-flex align-items-center"
						action="itemListSearch.do" method="">
						<input type="text" class="form-control border-0 bg-transparent"
							placeholder="검색어를 입력하세요" name="keyword" />
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
			<div
				class="col-sm-8 col-lg-4 d-flex justify-content-end gap-5 align-items-center mt-4 mt-sm-0 justify-content-center justify-content-sm-end">
				<div class="support-box text-end d-none d-xl-block">
					<!-- 
                  <span class="fs-6 secondary-font text-muted">연락처</span>
                  <h5 class="mb-0">053-421-2460</h5>
                   -->
                   

					<c:choose>
						<c:when test="${!empty logid}">
							<span class="fs-6 secondary-font text-muted">${logNick}님 환영합니다</span>
							<a class="mx-3" href="mypage.do"><i class="bi bi-person-fill-gear" style="font-size: 25px;" data-bs-toggle="tooltip" title="마이페이지"></i></a>
						</c:when>
						<c:otherwise>
							 
						</c:otherwise>
					</c:choose>
                   <a href="noticeList.do" class="bi bi-megaphone-fill fs-4" style="font-size: 20px;" data-bs-toggle="tooltip" title="공지사항"></a>


                   
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
				

					<li><a href="wish.do" class="mx-3"> <iconify-icon icon="mdi:heart" class="fs-4"></a></iconify-icon>


							<li><a href="#" class="mx-3" data-bs-toggle="offcanvas"
								data-bs-target="#offcanvasCart" aria-controls="offcanvasCart">
									<iconify-icon icon="mdi:cart" class="fs-4 position-relative"></iconify-icon>
									<span
									class="position-absolute translate-middle badge rounded-circle bg-primary pt-2">
								</span>
							</a></li>


							<li><a href="#" class="mx-3" data-bs-toggle="offcanvas"
								data-bs-target="#offcanvasSearch"
								aria-controls="offcanvasSearch"> <iconify-icon
										icon="tabler:search" class="fs-4"></iconify-icon> </a></li>
					<c:choose>
						<c:when test="${!empty logid}">
							<li><a class="mx-3" href="logout.do"
								data-bs-toggle="tooltip" title="로그아웃"> <i
									class="bi bi-box-arrow-right fs-4" style="font-size: 50px;"></i>

							</a></li>
						</c:when>
						<c:otherwise>
							<li><a class="nav-link mx-3" href="loginForm.do"
								data-bs-toggle="modal" data-bs-target="#loginModal"> <iconify-icon
										icon="healthicons:person" class="fs-4"
										data-bs-toggle="tooltip" title="로그인">
							</a></li>
						</c:otherwise>
					</c:choose>
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
					<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
						aria-label="Close"></button>
				</div>

				<div class="offcanvas-body justify-content-between ">
					<select class="filter-categories border-0 mb-0 me-5">
						<option>R&Y 스토어</option>
					</select>
            <ul class="navbar-nav list-unstyled d-flex gap-md-3 mb-0">
                <!-- 2레벨 시작 -->
                <c:forEach var="line" items="${lineList}">
                    <c:if test="${line.level == 2}">
                        <!-- 2레벨 확인 -->
                        <c:set var="isLevel2" value="false"/>
                        <c:forEach var="level2" items="${lineList}">
                            <c:if test="${level2.lineParentNo == line.lineNo}">
                                <c:set var="isLevel2" value="true"/>
                            </c:if>
                        </c:forEach>
                        <li class="nav-item dropdown">
                            <a href="itemList.do?lineNo=${line.lineNo}" class="nav-link dropdown-toggle"  id="navbarDropdown${line.lineNo}" role="button" aria-expanded="false">
                                ${line.lineName}
                            </a>
                            <!-- 3레벨 드롭다운 메뉴 생성 -->
                            <c:if test="${isLevel2}">
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown${line.lineNo}">
                                    <!-- 3레벨 시작 -->
                                    <c:forEach var="level2" items="${lineList}">
                                        <c:if test="${level2.lineParentNo == line.lineNo}">
                                            <!-- 3레벨 확인 -->
                                            <c:set var="isLevel3" value="false"/>
                                            <c:forEach var="level3" items="${lineList}">
                                                <c:if test="${level3.lineParentNo == level2.lineNo}">
                                                    <c:set var="isLevel3" value="true"/>
                                                </c:if>
                                            </c:forEach>
                                            <li class="dropdown-submenu">
                                                <!-- 3레벨 dropdown-toggle 클래스 추가 -->
                                                <a class="dropdown-item nav-link <c:if test="${isLevel3}">dropdown-toggle</c:if>" 
                                                href="itemList.do?lineNo=${level2.lineNo}">${level2.lineName}</a>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </c:if>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>

					<div class="d-none d-lg-flex align-items-end">
						<ul class="d-flex justify-content-end list-unstyled m-0">
							

							<li><a class="nav-link mx-3" href="wish.do" data-bs-toggle="tooltip" title="위시리스트">
							<i class="bi bi-chat-heart-fill" style="font-size: 1.5rem;"></i>
							</a></li>


							<li class=""><a href="cartList.do" class="nav-link mx-3" data-bs-toggle="tooltip" title="장바구니" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart" aria-controls="offcanvasCart"> 
								<i class="bi bi-cart-check-fill" style="font-size: 1.5rem;"></i>
							</a></li>
							<c:choose>
								<c:when test="${!empty logid}">
									<li><a class="nav-link mx-3" href="logout.do" data-bs-toggle="tooltip" title="로그아웃"> 
									<i class="bi bi-box-arrow-right" style="font-size: 1.5rem; color: cornflowerblue;"></i>
									</a></li>
								</c:when>
								<c:otherwise>
									<li><a class="nav-link mx-3"  href="loginForm.do" data-bs-toggle="modal" data-bs-target="#loginModal"> 
									<i class="bi bi-person-fill" data-bs-toggle="tooltip" title="로그인" style="font-size: 1.5rem;"></i>
									</a></li>
								</c:otherwise>
							</c:choose>
							
						</ul>
					</div>
				</div>
			</div>
		</nav>
	</div>
</header>

<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h1 class="modal-title fs-4 text-center w-100" id="loginModalLabel">로그인</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="text-center mb-4">
					<img src="images/logoDog.png" alt="logo" class="img-fluid">
				</div>
				<form id="loginForm">
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="floatingInput"
							placeholder="아이디를 입력하세요." name="id"> <label
							for="floatingInput">아이디</label>
					</div>
					<div class="form-floating mb-3">
						<input type="password" class="form-control" id="floatingPassword"
							placeholder="비밀번호를 입력하세요." name="pw"> <label
							for="floatingPassword">비밀번호</label>
					</div>
					<div class="form-check text-start my-3">
						<input class="form-check-input" type="checkbox"
							value="remember-me" id="flexCheckDefault"> <label
							class="form-check-label" for="flexCheckDefault">아이디 기억하기</label>
					</div>
					<button class="btn btn-primary w-100 py-2 mb-2" type="button"
						id="loginBtn">로그인</button>
				</form>
				<a href="addform.do">
					<button class="btn btn-outline-warning w-100 py-2" type="button">회원가입</button>
				</a>
				<p class="mt-5 mb-3 text-center text-muted">&copy; 2017–2024</p>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h1 class="modal-title fs-4 text-center w-100" id="loginModalLabel">로그인</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="text-center mb-4">
					<img src="images/logoDog.png" alt="logo" class="img-fluid">
				</div>
				<form id="loginForm" autocomplete="off">
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="floatingInput" placeholder="아이디를 입력하세요." name="id" autocomplete="username">
						<label for="floatingInput">아이디</label>
					</div>
					<div class="form-floating mb-3">
						<input type="password" class="form-control" id="floatingPassword" placeholder="비밀번호를 입력하세요." name="pw" autocomplete="new-password">
						<label for="floatingPassword">비밀번호</label>
					</div>
					<div class="form-check text-start my-3">
						<input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
						<label class="form-check-label" for="flexCheckDefault">아이디 기억하기</label>
					</div>
					<button class="btn btn-primary w-100 py-2 mb-2" type="button" id="loginBtn">로그인</button>
				</form>
				<a href="addform.do">
					<button class="btn btn-outline-warning w-100 py-2" type="button">회원가입</button>
				</a>
				<p class="mt-5 mb-3 text-center text-muted">&copy; 2017–2024</p>
			</div>
		</div>
	</div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function () {
    const idInput = document.getElementById('floatingInput');
    const pwInput = document.getElementById('floatingPassword');
    const rememberMeCheckbox = document.getElementById('flexCheckDefault');
    const loginBtn = document.getElementById('loginBtn');
    
    // 페이지 로드 시 저장된 아이디를 로드
    if (localStorage.getItem('rememberMe') === 'true') {
        idInput.value = localStorage.getItem('savedId');
        rememberMeCheckbox.checked = true;
    }

    // 로그인 버튼 클릭 시 처리
    loginBtn.onclick = function(e) {
        let id = idInput.value;
        let pw = pwInput.value;
        
        let url = "login.do?id=" + id + "&pw=" + pw;
        fetch(url)
            .then(function(response) {
                return response.json();
            })
            .then(function(result) {
                console.log(result); // 서버의 응답을 콘솔에 출력하여 확인
                if (result.recCode === 'Fail') { // 로그인 실패
                	alert("로그인 실패 재시도하세요.");
                } else { // 로그인 성공
                    if (rememberMeCheckbox.checked) {
                        localStorage.setItem('savedId', idInput.value);
                        localStorage.setItem('rememberMe', 'true');
                    } else {
                        localStorage.removeItem('savedId');
                        localStorage.setItem('rememberMe', 'false');
                    }

                    if (result.retVal === "user") { // 회원인 경우
                        location.href = "main.do";
                    } else { // 관리자인 경우
                        location.href = "adminpage.do";
                    }
                }
            })
            .catch(function(err) {
                console.error(err);
                alert("로그인 실패 재시도하세요."); // 서버 통신 오류 발생 시 알림창 표시
            });
    }
});
</script>

<script>
document.addEventListener('DOMContentLoaded', function () {
    // 모든 툴팁 요소를 초기화
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
});
</script>



<!--   <script>
        new bootstrap.Modal(document.getElementById('loginModal')).show();
        </script> -->
</body>

</html>