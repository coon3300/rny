<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
th, td {
  text-align: center;
}
</style>




<div class="untree_co-section before-footer-section">



	<div class="container">
		<div class="row mb-5">
		
				<div
					class="col-md-12">
					<div class="search-bar border rounded-2 px-3 border-dark-subtle">
						<!-- search-form1 -->
						<form id="search-form-line-manage"
							class="text-center d-flex align-lines-center" action="lineManage.do" method="">
							<input type="text" class="form-control border-0 bg-transparent"
								placeholder="라인명을 입력하세요" name="keyword"/>
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
						<thead class="table-dark">
							<tr>
								<th class="product-quantity">라인 번호</th>
								<th class="product-thumbnail">이미지</th>
								<th class="product-name">라인명</th>
								<th class="product-name">부모 라인 번호</th>
								<th class="product-name">설명</th>
								<th class="product-name">최근 수정일</th>
								<th class="product-name">삭제일</th>
							</tr>
						</thead>
						<tbody class="justify-content-center">
							<c:forEach var="line" items="${lineList}" varStatus="status">

							<tr class="align-middle" >
								
								<td>
										<a href="lineModify.do?lineNo=${line.lineNo}"><h2 class="h5 text-black">${line.lineNo}</h2></a>
								</td>
								
								<td class="product-thumbnail">
									<a href="lineModify.do?lineNo=${line.lineNo}">
									<img src="images/line/${line.lineNo}a.jpg" alt="Image" height="50px">
									</a>
								</td>
								<td class="product-name">
									<a href="lineModify.do?lineNo=${line.lineNo}">
									<h2 class="h5 text-black">${line.lineName}</h2>
									</a>
								</td>
								<td class="product-name">
									<a href="lineModify.do?lineNo=${line.lineParentNo}">
									<h2 class="h5 text-black">${line.lineParentNo}</h2>
									</a>
								</td>
								<td><h2 class="h5 text-black">${line.lineDesc}</h2></td>

								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${line.updatedDate}"/></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${line.disabledDate}"/></td>
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
		    <li class="page-line">
		      <a class="page-link" href="lineManage.do?keyword=${keyword}&page=${paging.startPage - 1}" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		  </c:if>
		  <!-- 페이지 갯수 만큼 링크 생성. -->
		  <c:forEach var="p" begin="${paging.startPage }" end="${paging.endPage }">
		  	<c:choose>
					<c:when test="${paging.page == p }">
						<li class="page-line active" aria-current="page">
							<span class="page-link">${p}</span>
						</li>
					</c:when>
					<c:otherwise>
					  <li class="page-line"><a class="page-link" href="lineManage.do?page=${p}&keyword=${keyword}">${p}</a>
					  </li>
					</c:otherwise>	  
		  	</c:choose>
		  </c:forEach>
		  <!-- next 페이지. -->
		  <%--		if(paging.isNext()){ --%>
		  <c:if test="${paging.next}">
			  <li class="page-line">
			    <a class="page-link" href="lineManage.do?keyword=${keyword}&page=${paging.endPage + 1}" aria-label="Next">
			      <span aria-hidden="true">&raquo;</span>
			    </a>	
			  </li>
		  </c:if>
		  <%-- 		} --%>
		  </ul>
		</nav>
	  <!-- 페이지 끝. -->  
	  
