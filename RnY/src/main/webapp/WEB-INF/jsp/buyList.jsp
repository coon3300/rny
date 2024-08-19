<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
</script>
<!-- Single Page Header 시작 -->
<div class="container-fluid page-header py-5">
	<h1 class="text-center text-white display-6">주문 목록</h1>
	<!-- 
	<ol class="breadcrumb justify-content-center mb-0">
		<li class="breadcrumb-item"><a href="#">홈</a></li>
		<li class="breadcrumb-item"><a href="#">페이지</a></li>
		<li class="breadcrumb-item active text-white">장바구니</li>
	</ol>
	 -->
</div>
<!-- Single Page Header 끝 -->
<link rel="stylesheet" href="css/yerim/cart/cart2.css" type="text/css">


<div class="container-fluid py-5">
	<div class="container py-5">
		<!-- 에러 메시지 표시 -->
		<c:if test="${not empty param.errorMessage}">
			<div class="alert alert-danger" role="alert">
				<c:out value="${param.errorMessage}" />
			</div>
		</c:if>

		<!-- 장바구니가 비어있지 않은 경우 -->
		<c:if test="${not empty buyList}">
			<div class="table-responsive">
			  <table class="table">
			    <thead>
			      <tr>
			        <th scope="col">주문번호</th>
			        <th scope="col">상품갯수</th>
			        <th scope="col">가격</th>
			        <th scope="col">주문상태</th>
			        <th scope="col">주문일</th>
			      </tr>
			    </thead>
			    <tbody id="cart">
			      <c:forEach var="item" items="${buyList}">
			        <tr>
			          <td><a href ="buyDetail.do?buyNo=${item.buyNo}">${item.buyNo}</a></td>
			          <td>${item.buyCount}</td>
			          <td><fmt:formatNumber value="${item.buyPrice}" pattern="#,###" />원</td>
			          <td>${item.buyStatus}</td>
			          <td><fmt:formatDate pattern="yyyy-MM-dd" value="${item.createdAt}"/></td>
			        </tr>
			      </c:forEach>
			    </tbody>
			  </table>
			</div>
		</c:if>

		<!-- 장바구니가 비어있을 때 -->
		<c:if test="${empty buyList}">
			<div class="alert alert-warning">주문 목록이 비어 있습니다.</div>
		</c:if>
	</div>
</div>
<!-- 
<script src="js/yerim/cart/CartList.js"></script>
 -->