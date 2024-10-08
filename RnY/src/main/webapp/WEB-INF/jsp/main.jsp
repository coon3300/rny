<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<section id="banner" style="background: #F9F3EC;">
	<div class="container">
		<div class="swiper main-swiper">
			<div class="swiper-wrapper">

				<div class="swiper-slide py-5">
					<div class="row banner-content align-items-center">
						<div class="img-wrapper col-md-5">
							<img src="images/banner-img.png" class="img-fluid">
						</div>
						<div class="content-wrapper col-md-7 p-5 mb-5">
							<div class="secondary-font text-primary text-uppercase mb-4">전품목
								10 ~ 20% 할인</div>
							<h2 class="banner-title display-1 fw-normal">
								골든리트리버 Pick!<span class="text-primary">최애의 인형</span>
							</h2>
							<a href="itemList.do?lineNo=18"
								class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1">
								장난감 스토어 바로가기 <svg width="24" height="24" viewBox="0 0 24 24"
									class="mb-1">
                    <use xlink:href="#arrow-right"></use>
                  </svg>
							</a>
						</div>

					</div>
				</div>
				<div class="swiper-slide py-5">
					<div class="row banner-content align-items-center">
						<div class="img-wrapper col-md-5">
							<img src="images//banner-img3.png" class="img-fluid">
						</div>
						<div class="content-wrapper col-md-7 p-5 mb-5">
							<div class="secondary-font text-primary text-uppercase mb-4">전품목
								50% 이상 할인</div>
							<h2 class="banner-title display-1 fw-normal">
								고양이가 눈을 떼지 못하는 이유는 <span class="text-primary"> ?</span>
							</h2>
							<a href="itemList.do?lineNo=12"
								class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1">
								사료 스토어 바로가기 <svg width="24" height="24" viewBox="0 0 24 24"
									class="mb-1">
                    <use xlink:href="#arrow-right"></use>
                  </svg>
							</a>
						</div>

					</div>
				</div>
				<div class="swiper-slide py-5">
					<div class="row banner-content align-items-center">
						<div class="img-wrapper col-md-5">
							<img src="images/banner-img4.png" class="img-fluid">
						</div>
						<div class="content-wrapper col-md-7 p-5 mb-5">
							<div class="secondary-font text-primary text-uppercase mb-4">일부품목
								~ 80% 할인</div>
							<h2 class="banner-title display-1 fw-normal">
								Must Have Item! <span class="text-primary">베이비 핑크색 출시!</span>
							</h2>
							<a href="itemList.do?lineNo=11"
								class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1">
								간식 스토어 바로가기 <svg width="24" height="24" viewBox="0 0 24 24"
									class="mb-1">
                    <use xlink:href="#arrow-right"></use>
                  </svg>
							</a>
						</div>

					</div>
				</div>
			</div>

			<div class="swiper-pagination mb-5"></div>

		</div>
	</div>
</section>

<!-- 
  <section id="categories">
    <div class="container my-3 py-5">
      <div class="row my-5">
        <div class="col text-center">
          <a href="#" class="categories-item">
            <iconify-icon class="category-icon" icon="ph:bowl-food"></iconify-icon>
            <h5>푸드 스토어</h5>
          </a>
        </div>
        <div class="col text-center">
          <a href="#" class="categories-item">
            <iconify-icon class="category-icon" icon="ph:bird"></iconify-icon>
            <h5>새 스토어</h5>
          </a>
        </div>
        <div class="col text-center">
          <a href="#" class="categories-item">
            <iconify-icon class="category-icon" icon="ph:dog"></iconify-icon>
            <h5>강아지 스토어</h5>
          </a>
        </div>
        <div class="col text-center">
          <a href="#" class="categories-item">
            <iconify-icon class="category-icon" icon="ph:fish"></iconify-icon>
            <h5>물고기 스토어</h5>
          </a>
        </div>
        <div class="col text-center">
          <a href="#" class="categories-item">
            <iconify-icon class="category-icon" icon="ph:cat"></iconify-icon>
            <h5>고양이 스토어</h5>
          </a>
        </div>
      </div>
    </div>
  </section>
 	-->

<!-- 
  <section id="clothing" class="my-5 overflow-hidden">
    <div class="container pb-5">
      <div class="section-header d-md-flex justify-content-between align-items-center mb-3">
        <h2 class="display-3 fw-normal">애완동물용 옷</h2>
        <div>
          <a href="#" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1">
            스토어 바로가기
            <svg width="24" height="24" viewBox="0 0 24 24" class="mb-1">
              <use xlink:href="#arrow-right"></use>
            </svg></a>
        </div>
      </div>

      <div class="products-carousel swiper">
        <div class="swiper-wrapper">

          <div class="swiper-slide">
            <div class="z-1 position-absolute rounded-3 m-3 px-3 border border-dark-subtle">
              New
            </div>
            <div class="card position-relative">
              <a href="#"><img src="images/item1.jpg" class="img-fluid rounded-4" alt="image"></a>
              <div class="card-body p-0">
                <a href="#">
                  <h3 class="card-title pt-4 m-0">귀 달린 후드</h3>
                </a>

                <div class="card-text">
                  <span class="rating secondary-font">
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    4.0</span>

                  <h3 class="secondary-font text-primary">18,000원</h3>

                  <div class="d-flex flex-wrap mt-3">
                    <a href="#" class="btn-cart me-3 px-4 pt-3 pb-3">
                      <h5 class="text-uppercase m-0">장바구니 담기</h5>
                    </a>
                    <a href="#" class="btn-wishlist px-4 pt-3 ">
                      <iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
                    </a>
                  </div>


                </div>

              </div>
            </div>
          </div>
          <div class="swiper-slide">
              New
            <div class="card position-relative">
              <a href="#"><img src="images/item2.jpg" class="img-fluid rounded-4" alt="image"></a>
              <div class="card-body p-0">
                <a href="#">
                  <h3 class="card-title pt-4 m-0">청바지</h3>
                </a>

                <div class="card-text">
                  <span class="rating secondary-font">
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    5.0</span>

                  <h3 class="secondary-font text-primary">18,000원</h3>

                  <div class="d-flex flex-wrap mt-3">
                    <a href="#" class="btn-cart me-3 px-4 pt-3 pb-3">
                      <h5 class="text-uppercase m-0">장바구니 담기</h5>
                    </a>
                    <a href="#" class="btn-wishlist px-4 pt-3 ">
                      <iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
                    </a>
                  </div>

                </div>

              </div>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="z-1 position-absolute rounded-3 m-3 px-3 border border-dark-subtle">
              -90%
            </div>
            <div class="card position-relative">
              <a href="#"><img src="images/item3.jpg" class="img-fluid rounded-4" alt="image"></a>
              <div class="card-body p-0">
                <a href="#">
                  <h3 class="card-title pt-4 m-0">분홍 조끼</h3>
                </a>

                <div class="card-text">
                  <span class="rating secondary-font">
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>

                    3.0</span>

                  <h3 class="secondary-font text-primary">15,000원</h3>

                  <div class="d-flex flex-wrap mt-3">
                    <a href="#" class="btn-cart me-3 px-4 pt-3 pb-3">
                      <h5 class="text-uppercase m-0">장바구니 담기</h5>
                    </a>
                    <a href="#" class="btn-wishlist px-4 pt-3 ">
                      <iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
                    </a>
                  </div>


                </div>

              </div>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="z-1 position-absolute rounded-3 m-3 px-3 border border-dark-subtle">
              New
            </div>
            <div class="card position-relative">
              <a href="#"><img src="images/item4.jpg" class="img-fluid rounded-4" alt="image"></a>
              <div class="card-body p-0">
                <a href="#">
                  <h3 class="card-title pt-4 m-0">검은색 잠옷</h3>
                </a>

                <div class="card-text">
                  <span class="rating secondary-font">
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>

                    2.0</span>

                  <h3 class="secondary-font text-primary">24,000원</h3>

                  <div class="d-flex flex-wrap mt-3">
                    <a href="#" class="btn-cart me-3 px-4 pt-3 pb-3">
                      <h5 class="text-uppercase m-0">장바구니 담기</h5>
                    </a>
                    <a href="#" class="btn-wishlist px-4 pt-3 ">
                      <iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
                    </a>
                  </div>


                </div>

              </div>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="z-1 position-absolute rounded-3 m-3 px-3 border border-dark-subtle">
              New
            </div>
            <div class="card position-relative">
              <a href="#"><img src="images/item7.jpg" class="img-fluid rounded-4" alt="image"></a>
              <div class="card-body p-0">
                <a href="#">
                  <h3 class="card-title pt-4 m-0">후드 티</h3>
                </a>

                <div class="card-text">
                  <span class="rating secondary-font">
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    5.0</span>

                  <h3 class="secondary-font text-primary">17,000원</h3>

                  <div class="d-flex flex-wrap mt-3">
                    <a href="#" class="btn-cart me-3 px-4 pt-3 pb-3">
                      <h5 class="text-uppercase m-0">장바구니 담기</h5>
                    </a>
                    <a href="#" class="btn-wishlist px-4 pt-3 ">
                      <iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="z-1 position-absolute rounded-3 m-3 px-3 border border-dark-subtle">
              New
            </div>
            <div class="card position-relative">
              <a href="#"><img src="images/item8.jpg" class="img-fluid rounded-4" alt="image"></a>
              <div class="card-body p-0">
                <a href="#">
                  <h3 class="card-title pt-4 m-0">후드 티</h3>
                </a>

                <div class="card-text">
                  <span class="rating secondary-font">
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    5.0</span>

                  <h3 class="secondary-font text-primary">11,000원</h3>

                  <div class="d-flex flex-wrap mt-3">
                    <a href="#" class="btn-cart me-3 px-4 pt-3 pb-3">
                      <h5 class="text-uppercase m-0">장바구니 담기</h5>
                    </a>
                    <a href="#" class="btn-wishlist px-4 pt-3 ">
                      <iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
                    </a>
                  </div>


                </div>

              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
  </section>
 	-->

<section id="foodies" class="my-5">
	<div class="container my-5 py-5">
		<div
			class="section-header d-md-flex justify-content-between align-items-center">
			<h2 class="display-3 fw-normal">R&Y</h2>
			<div class="mb-4 mb-md-0">
				<p class="m-0">
					<button class="filter-button me-4 " onclick="getMainItemList('11')">간식</button>
					<button class="filter-button me-4 " onclick="getMainItemList('12')">사료</button>
					<button class="filter-button me-4 " onclick="getMainItemList('13')">패션용품</button>
					<button class="filter-button me-4 " onclick="getMainItemList('14')">위생용품</button>
					<button class="filter-button me-4 " onclick="getMainItemList('15')">식기/급수기</button>
					<button class="filter-button me-4 " onclick="getMainItemList('16')">미용용품</button>
					<button class="filter-button me-4 " onclick="getMainItemList('17')">외출용품</button>
					<button class="filter-button me-4 " onclick="getMainItemList('18')">장난감/훈련용품</button>
				</p>
			</div>
			<div>
				<a href="#"
					class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1">
					맨 위로 바로가기 <svg width="24" height="24" viewBox="0 0 24 24"
						class="mb-1">
              <use xlink:href="#arrow-right"></use>
            </svg>
				</a>
			</div>
		</div>

		<!-- <div class="isotope-container row"> -->
		<div class="row bg-light" id="mainItemDiv">
			<!-- ajax -->
			<c:forEach var="item" items="${itemListNew}" varStatus="status">
        <div class="item cat col-md-4 col-lg-3 my-4">
        <!-- 
         <div class="z-1 position-absolute rounded-3 m-3 px-3 border border-dark-subtle">
            New
          </div>
         -->
          <div class="card position-relative">
            <a href="itemInfo.do?itemNo=${item.itemNo }"><img src="images/line/${item.lineNo }a.jpg" class="img-fluid rounded-4" alt="image"></a>
            <div class="card-body p-0">
            <div class="card-title-container">
              <a href="itemInfo.do?itemNo=${item.itemNo }">
                <h3 class="card-title pt-4 m-0">${item.itemName }</h3>
              </a>
            </div>
              <div class="card-text">
                <span class="rating secondary-font">
                  <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                  ${status.count * item.itemNo % 5 + 1}</span>
                <h3 class="secondary-font text-primary"><fmt:formatNumber value="${item.itemPrice}" pattern="#,###" />원</h3>
              </div>
            </div>
          </div>
        </div>
			</c:forEach>
			<!-- ajax -->
		</div>
	</div>
</section>

<section id="banner-2" class="my-3" style="background: #F9F3EC;">
	<div class="container">
		<div class="row flex-row-reverse banner-content align-items-center">
			<div class="img-wrapper col-12 col-md-6">
				<img src="images/banner-img2.png" class="img-fluid">
			</div>
			<div class="content-wrapper col-12 offset-md-1 col-md-5 p-5">
				<div class="secondary-font text-primary text-uppercase mb-3 fs-4">최대
					40% 할인</div>
				<h2 class="banner-title display-1 fw-normal">클리어런스 SALE !!!</h2>
				<a href="itemList.do?lineNo=14"
					class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1">
					패션 스토어 바로가기 <svg width="24" height="24" viewBox="0 0 24 24"
						class="mb-1">
              <use xlink:href="#arrow-right"></use>
            </svg>
				</a>
			</div>

		</div>
	</div>
</section>


<section id="bestselling" class="my-5 overflow-hidden">
	<div class="container py-5 mb-5">

		<div
			class="section-header d-md-flex justify-content-between align-items-center mb-3">
			<h2 class="display-3 fw-normal">인기 상품</h2>
			<div>
				<a href="#"
					class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1">
					스토어 바로가기 <svg width="24" height="24" viewBox="0 0 24 24"
						class="mb-1">
              <use xlink:href="#arrow-right"></use>
            </svg>
				</a>
			</div>
		</div>

		<div class="row bg-light" id="mainItemBest">
			<!-- ajax -->
			<c:forEach var="item" items="${itemListBest}" varStatus="status">
        <div class="item cat col-md-4 col-lg-3 my-4">
        <!-- 
         <div class="z-1 position-absolute rounded-3 m-3 px-3 border border-dark-subtle">
            New
          </div>
         -->
          <div class="card position-relative">
            <a href="itemInfo.do?itemNo=${item.itemNo }"><img src="images/line/${item.lineNo }a.jpg" class="img-fluid rounded-4" alt="image"></a>
            <div class="card-body p-0">
            <div class="card-title-container">
              <a href="itemInfo.do?itemNo=${item.itemNo }">
                <h3 class="card-title pt-4 m-0">${item.itemName }</h3>
              </a>
            </div>
              <div class="card-text">
                <span class="rating secondary-font">
                  <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                  ${status.count * item.itemNo % 5 + 1}</span>
                <h3 class="secondary-font text-primary"><fmt:formatNumber value="${item.itemPrice}" pattern="#,###" />원</h3>
              </div>
            </div>
          </div>
        </div>
			</c:forEach>

	</div>
	<!-- ajax end. -->
</section>


<section id="service">
	<div class="container py-5 my-5">
		<div class="row g-md-5 pt-4">
			<div class="col-md-3 my-3">
				<div class="card">
					<div>
						<iconify-icon class="service-icon text-primary"
							icon="la:shopping-cart"></iconify-icon>
					</div>
					<h3 class="card-title py-2 m-0">무료 배송</h3>
					<div class="card-text">
						<p class="blog-paragraph fs-6">도서산간지역의 경우 추가배송비가 발생합니다.</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 my-3">
				<div class="card">
					<div>
						<iconify-icon class="service-icon text-primary"
							icon="la:user-check"></iconify-icon>
					</div>
					<h3 class="card-title py-2 m-0">100% 포인트 결제 가능</h3>
					<div class="card-text">
						<p class="blog-paragraph fs-6">단, 네이버페이에 한함.</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 my-3">
				<div class="card">
					<div>
						<iconify-icon class="service-icon text-primary" icon="la:tag"></iconify-icon>
					</div>
					<h3 class="card-title py-2 m-0">오늘의 Pick!</h3>
					<div class="card-text">
						<p class="blog-paragraph fs-6">고민은 배송만 늦출 뿐.</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 my-3">
				<div class="card">
					<div>
						<iconify-icon class="service-icon text-primary" icon="la:award"></iconify-icon>
					</div>
					<h3 class="card-title py-2 m-0">품질 보증</h3>
					<div class="card-text">
						<p class="blog-paragraph fs-6">교환/환불은 1주일 이내.</p>
					</div>
				</div>
			</div>

		</div>
	</div>
</section>

<section id="insta" class="my-5">
	<div class="row g-0 py-5">
		<div class="col instagram-item  text-center position-relative">
			<div
				class="icon-overlay d-flex justify-content-center position-absolute">
				<iconify-icon class="text-white" icon="la:instagram"></iconify-icon>
			</div>
			<a href="#"> <img src="images/insta1.jpg" alt="insta-img"
				class="img-fluid rounded-3">
			</a>
		</div>
		<div class="col instagram-item  text-center position-relative">
			<div
				class="icon-overlay d-flex justify-content-center position-absolute">
				<iconify-icon class="text-white" icon="la:instagram"></iconify-icon>
			</div>
			<a href="#"> <img src="images/insta2.jpg" alt="insta-img"
				class="img-fluid rounded-3">
			</a>
		</div>
		<div class="col instagram-item  text-center position-relative">
			<div
				class="icon-overlay d-flex justify-content-center position-absolute">
				<iconify-icon class="text-white" icon="la:instagram"></iconify-icon>
			</div>
			<a href="#"> <img src="images/insta3.jpg" alt="insta-img"
				class="img-fluid rounded-3">
			</a>
		</div>
		<div class="col instagram-item  text-center position-relative">
			<div
				class="icon-overlay d-flex justify-content-center position-absolute">
				<iconify-icon class="text-white" icon="la:instagram"></iconify-icon>
			</div>
			<a href="#"> <img src="images/insta4.jpg" alt="insta-img"
				class="img-fluid rounded-3">
			</a>
		</div>
		<div class="col instagram-item  text-center position-relative">
			<div
				class="icon-overlay d-flex justify-content-center position-absolute">
				<iconify-icon class="text-white" icon="la:instagram"></iconify-icon>
			</div>
			<a href="#"> <img src="images/insta5.jpg" alt="insta-img"
				class="img-fluid rounded-3">
			</a>
		</div>
		<div class="col instagram-item  text-center position-relative">
			<div
				class="icon-overlay d-flex justify-content-center position-absolute">
				<iconify-icon class="text-white" icon="la:instagram"></iconify-icon>
			</div>
			<a href="#"> <img src="images/insta6.jpg" alt="insta-img"
				class="img-fluid rounded-3">
			</a>
		</div>
	</div>
</section>
<Script src='js/mainItemList.js'></Script>
<Script src='js/mainItemListService.js'></Script>


