<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
  .card-title-container {
    height: 60px;
    overflow: hidden;
    margin-bottom: 10px;
  }
  .card-title {
    margin: 0;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
  }
</style>

  <section id="foodies" class="my-5">
    <div class="container my-5 py-5  bg-light">


      <div class="section-header d-md-flex justify-content-between align-items-center">
      <!-- 
        <h6 class="display-3 fw-normal">${lineName}</h6>
       -->
       <!-- 
        <div>
          <a href="#" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1">
            ${lineName}
					</a>
        </div>
        -->
        <!-- 
        <div>
          <a href="#" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1">
            스토어 바로가기
            <svg width="24" height="24" viewBox="0 0 24 24" class="mb-1">
              <use xlink:href="#arrow-right"></use>
            </svg></a>
        </div>
         -->
      </div>
 
      <div class="isotope-container row">
			<c:forEach var="item" items="${itemList}" varStatus="status">

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

                <div class="d-flex flex-wrap mt-3">
                  <a href="cartAdd.do?itemNo=${item.itemNo}&userNo=${userNo}" class="btn-cart me-3 px-4 pt-3 pb-3">
                    <h5 class="text-uppercase m-0">장바구니 담기</h5>
                  </a>
                  <a href="addWish.do?itemNo=${item.itemNo}&userNo=${userNo}" class="btn-wishlist px-4 pt-3 ">
                    <iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
        
				</c:forEach>
    </div>
   </div>
  </section>

		<!-- 라인 이동 과 검색 이동 구분 : 검색 시 하단 페이징 보이기 -->
	    <!-- 페이지부분. -->
	    <nav aria-label="Page navigation example">
	  	<ul class="pagination justify-content-center">
		  <!-- 이전 페이지. -->
		  <c:if test="${paging.prev }">
		    <li class="page-item">
		      <a class="page-link" href="itemListLine.do?lineNo=${lineNo}&page=${paging.startPage - 1}" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		  </c:if>
		  <!-- 페이지 갯수 만큼 링크 생성. -->
		  <c:forEach var="p" begin="${paging.startPage }" end="${paging.endPage }">
		  	<c:choose>
					<c:when test="${paging.page == p }">
						<li class="page-item active" aria-current="page">
							<span class="page-link">${p}</span>
						</li>
					</c:when>
					<c:otherwise>
					  <li class="page-item"><a class="page-link" href="itemListLine.do?page=${p}&lineNo=${lineNo}">${p}</a>
					  </li>
					</c:otherwise>	  
		  	</c:choose>
		  </c:forEach>
		  <!-- next 페이지. -->
		  <c:if test="${paging.next}">
			  <li class="page-item">
			    <a class="page-link" href="itemListLine.do?lineNo=${lineNo}&page=${paging.endPage + 1}" aria-label="Next">
			      <span aria-hidden="true">&raquo;</span>
			    </a>	
			  </li>
		  </c:if>
		  </ul>
		</nav>
	  <!-- 페이지 끝. -->