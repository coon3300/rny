<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/style.css">
</head>

<section class="cart_area padding_top">
		<div class="cart_inner">
			<div class="table-responsive">
				<table class="table" style="text-align: center">
					<thead>
					<tr>
						<tr><th class="col-sm-1">고유번호</th>
							<td class="col-sm-3">${mvo.userNo}</td></tr>
							
							<tr><th class="col-sm-1">ID</th>
							<td class="col-sm-3">${mvo.userId}</td></tr>
							
							<tr><th class="col-sm-1">패스워드</th>
							<td class="col-sm-3">${mvo.userPw}</td></tr>
							
							<tr><th class="col-sm-1">이름</th>
							<td class="col-sm-3">${mvo.userName}</td></tr>
							
							<tr><th class="col-sm-2">닉네임</th>
							<td class="col-sm-3">${mvo.userNick}</td></tr>
							
							<tr><th class="col-sm-2">생년월일</th>
							<td class="col-sm-3"><fmt:formatDate pattern="yyyy-MM-dd" value="${mvo.userBirth}"/></td></tr>
							
							<tr><th class="col-sm-2">전화번호</th>
							<td class="col-sm-3">${mvo.userPhone}</td></tr>
							
							<tr><th class="col-sm-2">이메일</th>
							<td class="col-sm-3">${mvo.userEmail}</td></tr>
							
							<tr><th class="col-sm-1">주소</th>
							<td class="col-sm-3">${mvo.userAdd}</td></tr>
							
							
							<tr><th class="col-sm-1">가입일자</th>
							<td class="col-sm-3"><fmt:formatDate pattern="yyyy-MM-dd" value="${mvo.userDate}"/></td></tr>
							
							<tr><th class="col-sm-1">권한</th>
							<td class="col-sm-3">${mvo.responsibility}</td></tr>
							
							<tr>
							<th class="col" colspan=2><a class="btn_1" href="#" style="width: 100px;">정보수정</a>
							<a class="btn_1" href="memberList.do" style="width: 100px;">뒤로가기</a>
							</tr>
						
					</thead>
				</table>
			</div>

	</div>
</section>