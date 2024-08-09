<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
String logNick = (String) session.getAttribute("logNick");
%>


<div class="untree_co-section product-section before-footer-section">
		    <div class="container">
		      	<div class="row">
		      	
		      	<div
			class="section-header d-md-flex justify-content-between align-items-center mb-3">
			<h2 class="display-3 fw-normal">${logNick}님의WISHLIST</h2>
			<p></p>
		</div>


	<c:forEach var="wish" items="${logWish}" varStatus="status">
		      		<!-- Start Column 1 -->
					<div class="col-12 col-md-4 col-lg-3 mb-5">
						<a class="product-item" href="#">
							<img src="images/${wish.itemImage}" class="img-fluid product-thumbnail">
							<h3 class="product-title">${wish.itemName}</h3>
							<strong class="product-price">${wish.itemPrice}원</strong>

							
						</a>
					</div> 
					<!-- End Column 1 -->
					</c:forEach>
						
					

		      	</div>
		    </div>
		</div>
