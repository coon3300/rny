<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/style.css">
</head>

<div class="py-5 text-center">
			<h1>회원리스트</h1>
			<h1>──────</h1>
		</div>
<section class="cart_area padding_top">
	<div class="container">
		<div class="cart_inner">
			<div class="table-responsive">
				<table class="table" style="text-align: center">
					<thead>
						<tr>
							<th class="col-sm-1">고유번호</th>
							<th class="col-sm-1">ID</th>
							<th class="col-sm-1">이름</th>
							<th class="col-sm-2">생년월일</th>
							<th class="col-sm-2">폰번호</th>
							<th class="col-sm-1">포인트</th>
							<th class="col-sm-1">쿠폰</th>
							<th class="col-sm-2">가입일자</th>
							<th class="col-sm-1">권한</th>
							<th class="col-sm-3">□</th>
							
						</tr>
					</thead>
					
					<tbody style="height: 1px">
						<c:forEach var="member" items="${memberList}">
							<tr>
								<td>${member.userNo }</td>
								<td>${member.userId }</td>
								<td>${member.userName }</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.userBirth}"/></td>
								<td>${member.userPhone }</td>
								<td>${member.userPoint }</td>
								<td>${member.userCoupon }</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.userDate}"/></td>
								<td>${member.responsibility }</td>
								<td class="col-sm-1"><a class="btn_1" href="user.do?uno=${member.userNo}">상세</a></td>
							</tr>
						</c:forEach>

						
					</tbody>

				</table>
</div>
			</div>
		</div>
</section>