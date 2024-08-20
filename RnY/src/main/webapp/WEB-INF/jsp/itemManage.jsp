<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
th, td {
  text-align: center;
}
</style>



<div class="alert alert-warning text-center display-6">아이템 관리</div>
	<div class="container">
		<div class="row mb-5">
		
				<div
					class="col-md-12">
					<div class="search-bar border rounded-2 px-3 border-dark-subtle">
						<!-- search-form1 -->
						<form id="search-form-item-manage"
							class="text-center d-flex align-items-center" action="itemManage.do" method="">
							<input type="text" class="form-control border-0 bg-transparent"
								placeholder="아이템명을 입력하세요" name="keyword"/>
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
		
			<form class="col-md-12" method="post">
				<div class="site-blocks-table">
					<table class="table table-striped">
						<thead class="table-secondary">
							<tr>
								<th class="product-quantity">번호</th>
								<th class="product-thumbnail">이미지</th>
								<th class="product-name">아이템명</th>
								<th class="product-price">가격</th>
								<th class="product-quantity">재고</th>
								<th class="product-name">최근 수정일</th>
								<th class="product-name">삭제일</th>
							</tr>
						</thead>
						<tbody class="justify-content-center">
							<c:forEach var="item" items="${itemList}" varStatus="status">

							<tr class="align-middle" >
								
								<td>
										<a href="itemModify.do?itemNo=${item.itemNo}&page=${paging.page}&keyword=${keyword}">${item.itemNo}</a>
								</td>
								
								<td class="product-thumbnail">
									<a href="itemModify.do?itemNo=${item.itemNo}&page=${paging.page}&keyword=${keyword}">
									<img src="images/line/${item.lineNo}a.jpg" alt="Image" height="50px">
									</a>
								</td>
								<td class="product-name">
									<a href="itemModify.do?itemNo=${item.itemNo}&page=${paging.page}&keyword=${keyword}">
									<h2 class="h5 text-black">${item.itemName}</h2>
									</a>
								</td>
								<td><fmt:formatNumber value="${item.itemPrice}" pattern="#,###" />원</td>
								<td>
								  <div class="d-flex justify-content-center align-items-center" style="width: 100%; height: 100%;">
								    <input type="text" class="form-control form-control-sm text-center py-0" style="max-width: 50px; height: 24px; font-size: 0.875rem;" aria-label="Quantity"
								    value="${item.itemStock}">
								  </div>
								</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${item.updatedDate}"/></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${item.disabledDate}"/></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</form>
		</div>
	</div>
</div>


		<!-- 라인 이동 과 검색 이동 구분 : 검색 시 하단 페이징 보이기 -->
	    <!-- 페이지부분. -->
	    <nav aria-label="Page navigation example">
	  	<ul class="pagination justify-content-center">
		  <!-- 이전 페이지. -->
		  <c:if test="${paging.prev }">
		    <li class="page-item">
		      <a class="page-link" href="itemManage.do?keyword=${keyword}&page=${paging.startPage - 1}" aria-label="Previous">
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
					  <li class="page-item"><a class="page-link" href="itemManage.do?page=${p}&keyword=${keyword}">${p}</a>
					  </li>
					</c:otherwise>	  
		  	</c:choose>
		  </c:forEach>
		  <!-- next 페이지. -->
		  <%--		if(paging.isNext()){ --%>
		  <c:if test="${paging.next}">
			  <li class="page-item">
			    <a class="page-link" href="itemManage.do?keyword=${keyword}&page=${paging.endPage + 1}" aria-label="Next">
			      <span aria-hidden="true">&raquo;</span>
			    </a>	
			  </li>
		  </c:if>
		  <%-- 		} --%>
		  </ul>
		</nav>
	  <!-- 페이지 끝. -->  
