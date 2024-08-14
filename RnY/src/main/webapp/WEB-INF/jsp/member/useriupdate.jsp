<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="css/style.css">

<section class="cart_area padding_top">
	<div class="cart_inner">
		<div class="table-responsive">
		
		<form action="updateuser.do">
			<input type="hidden" name="userNo" value="${userinfo.userNo}">
			<table class="table" style="text-align: center">
				<thead>
				
					<tr>
						<th class="col-sm-1">고유번호</th>
						<td class="col-sm-3">${userinfo.userNo}</td>
					</tr>

					<tr>
						<th class="col-sm-1">ID</th>
						<td class="col-sm-3">${userinfo.userId}</td>
					</tr>

					<tr>
						<th class="col-sm-1">패스워드</th>
						<td class="col-sm-3"><input type="password" name="userPw" value="${userinfo.userPw}"></td>
					</tr>

					<tr>
						<th class="col-sm-2">닉네임</th>
						<td class="col-sm-3"><input type="text" name="userNick" value="${userinfo.userNick}"></td>
					</tr>

					<tr>
						<th class="col-sm-2">생년월일</th>
						<td class="col-sm-3"><input type="text" name="userBirth" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${userinfo.userBirth}'/>">
						</td>
					</tr>

					<tr>
						<th class="col-sm-2">전화번호</th>
						<td class="col-sm-3"><input type="text" name="userPhone" value="${userinfo.userPhone}"></td>
					</tr>

					<tr>
						<th class="col-sm-2">이메일</th>
						<td class="col-sm-3"><input type="email" name="userEmail" value="${userinfo.userEmail}"></td>
					</tr>

					<tr>
						<th class="col-sm-1">주소</th>
						<td class="col-sm-3">${userinfo.userAdd}"</td>
					</tr>

					<tr>
						<th class="col-sm-1">가입일자</th>
						<td class="col-sm-3"><fmt:formatDate pattern='yyyy-MM-dd' value='${userinfo.userDate}'/></td>
					</tr>

					<tr>
						<th class="col" colspan=2>
						<button class="btn_1" style="width: 100px;" type="submit">정보수정</button>
						<a class="btn_1" href="mypage.do" style="width: 100px;">뒤로가기</a></th>
					</tr>
				</thead>

			</table>
			</form>
		</div>

	</div>
</section>