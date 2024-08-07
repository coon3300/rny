<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <section id="banner" style="background: #F9F3EC;">
    <div class="container">
      <div class="swiper main-swiper">
        <div class="swiper-wrapper">

        </div>
        </div> 
    </div>
  </section>

  <section id="clothing" class="my-5 overflow-hidden">
    <div class="container pb-5">

      <div class="section-header d-md-flex justify-content-between align-items-center mb-3">
        <h2 class="display-3 fw-normal">WISHLIST</h2>
        
      </div>

     

        <c:forEach var="wish" items="${wishList}" varStatus="status">
            <div class="card position-relative">
              <a href="#"><img src="images/item1.jpg" class="img-fluid rounded-4" alt="image"></a>
              <div class="card-body p-0">
                <a href="#">
                  <h3 class="card-title pt-4 m-0">${wish.itemName}</h3>
                </a>

                <div class="card-text">
                  <span class="rating secondary-font">
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    <iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
                    4.0</span>

                  <h3 class="secondary-font text-primary">${wish.itemPrice}</h3> <!-- 이거 넣고 화면 안나옴 -->

                  <div class="d-flex flex-wrap mt-3">
                   
                    
                  </div>


                </div>

              </div>
            </div>
            </c:forEach>
          </div>
          <div class="swiper-slide">
            <!-- <div class="z-1 position-absolute rounded-3 m-3 px-3 border border-dark-subtle">
              New
            </div> -->
           


    </div>
  </section>

  <section id="register" style="background: url('images/background-img.png') no-repeat;">
    <div class="container ">
      <div class="row my-5 py-5">
        <div class="offset-md-3 col-md-6 my-5 ">
          <h2 class="display-3 fw-normal text-center">지금 회원가입 하시면<span class="text-primary">20% 할인 쿠폰 증정</span>
          </h2>
          <form>
            <div class="mb-3">
              <input type="email" class="form-control form-control-lg" name="email" id="email"
                placeholder="이메일 주소를 입력하세요">
            </div>
            <div class="mb-3">
              <input type="password" class="form-control form-control-lg" name="email" id="password1"
                placeholder="비밀번호 입력">
            </div>
            <div class="mb-3">
              <input type="password" class="form-control form-control-lg" name="email" id="password2"
                placeholder="비밀번호 재입력">
            </div>

            <div class="d-grid gap-2">
              <button type="submit" class="btn btn-dark btn-lg rounded-1">회원가입</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>

  <section id="latest-blog" class="my-5">
    <div class="container py-5 my-5">
      <div class="row mt-5">
        <div class="section-header d-md-flex justify-content-between align-items-center mb-3">
          <h2 class="display-3 fw-normal">최신 블로그</h2>
          <div>
            <a href="#" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1">
              전체 읽기
              <svg width="24" height="24" viewBox="0 0 24 24" class="mb-1">
                <use xlink:href="#arrow-right"></use>
              </svg></a>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-4 my-4 my-md-0">
          <div class="z-1 position-absolute rounded-3 m-2 px-3 pt-1 bg-light">
            <h3 class="secondary-font text-primary m-0">1일</h3>
            <p class="secondary-font fs-6 m-0">8월</p>

          </div>
          <div class="card position-relative">
            <a href="single-post.html"><img src="images/blog1.jpg" class="img-fluid rounded-4" alt="image"></a>
            <div class="card-body p-0">
              <a href="single-post.html">
                <h3 class="card-title pt-4 pb-3 m-0">R&Y 스토어에서 구매해야하는 이유 10가지</h3>
              </a>

              <div class="card-text">
                <p class="blog-paragraph fs-6">지금부터 만들어 보겠습니다.</p>
                <a href="single-post.html" class="blog-read">더 보기</a>
              </div>

            </div>
          </div>
        </div>
        <div class="col-md-4 my-4 my-md-0">
          <div class="z-1 position-absolute rounded-3 m-2 px-3 pt-1 bg-light">
            <h3 class="secondary-font text-primary m-0">2일</h3>
            <p class="secondary-font fs-6 m-0">8월</p>

          </div>
          <div class="card position-relative">
            <a href="single-post.html"><img src="images/blog2.jpg" class="img-fluid rounded-4" alt="image"></a>
            <div class="card-body p-0">
              <a href="single-post.html">
                <h3 class="card-title pt-4 pb-3 m-0">강아지랑 놀기</h3>
              </a>

              <div class="card-text">
                <p class="blog-paragraph fs-6">일단 빈 그릇부터 채우자.</p>
                <a href="single-post.html" class="blog-read">더 보기</a>
              </div>

            </div>
          </div>
        </div>
        <div class="col-md-4 my-4 my-md-0">
          <div class="z-1 position-absolute rounded-3 m-2 px-3 pt-1 bg-light">
            <h3 class="secondary-font text-primary m-0">3일</h3>
            <p class="secondary-font fs-6 m-0">8월</p>

          </div>
          <div class="card position-relative">
            <a href="single-post.html"><img src="images/blog3.jpg" class="img-fluid rounded-4" alt="image"></a>
            <div class="card-body p-0">
              <a href="single-post.html">
                <h3 class="card-title pt-4 pb-3 m-0">애완동물을 위한 최고의 집</h3>
              </a>

              <div class="card-text">
                <p class="blog-paragraph fs-6">에어콘 풀가동!!</p>
                <a href="single-post.html" class="blog-read">더보기</a>
              </div>

            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section id="service">
    <div class="container py-5 my-5">
      <div class="row g-md-5 pt-4">
        <div class="col-md-3 my-3">
          <div class="card">
            <div>
              <iconify-icon class="service-icon text-primary" icon="la:shopping-cart"></iconify-icon>
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
              <iconify-icon class="service-icon text-primary" icon="la:user-check"></iconify-icon>
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
        <div class="icon-overlay d-flex justify-content-center position-absolute">
          <iconify-icon class="text-white" icon="la:instagram"></iconify-icon>
        </div>
        <a href="#">
          <img src="images/insta1.jpg" alt="insta-img" class="img-fluid rounded-3">
        </a>
      </div>
      <div class="col instagram-item  text-center position-relative">
        <div class="icon-overlay d-flex justify-content-center position-absolute">
          <iconify-icon class="text-white" icon="la:instagram"></iconify-icon>
        </div>
        <a href="#">
          <img src="images/insta2.jpg" alt="insta-img" class="img-fluid rounded-3">
        </a>
      </div>
      <div class="col instagram-item  text-center position-relative">
        <div class="icon-overlay d-flex justify-content-center position-absolute">
          <iconify-icon class="text-white" icon="la:instagram"></iconify-icon>
        </div>
        <a href="#">
          <img src="images/insta3.jpg" alt="insta-img" class="img-fluid rounded-3">
        </a>
      </div>
      <div class="col instagram-item  text-center position-relative">
        <div class="icon-overlay d-flex justify-content-center position-absolute">
          <iconify-icon class="text-white" icon="la:instagram"></iconify-icon>
        </div>
        <a href="#">
          <img src="images/insta4.jpg" alt="insta-img" class="img-fluid rounded-3">
        </a>
      </div>
      <div class="col instagram-item  text-center position-relative">
        <div class="icon-overlay d-flex justify-content-center position-absolute">
          <iconify-icon class="text-white" icon="la:instagram"></iconify-icon>
        </div>
        <a href="#">
          <img src="images/insta5.jpg" alt="insta-img" class="img-fluid rounded-3">
        </a>
      </div>
      <div class="col instagram-item  text-center position-relative">
        <div class="icon-overlay d-flex justify-content-center position-absolute">
          <iconify-icon class="text-white" icon="la:instagram"></iconify-icon>
        </div>
        <a href="#">
          <img src="images/insta6.jpg" alt="insta-img" class="img-fluid rounded-3">
        </a>
      </div>
    </div>
  </section>
