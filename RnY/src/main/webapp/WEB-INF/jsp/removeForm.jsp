<%@page import="co.rny.vo.WishVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<h3>삭제화면(removeForm.jsp)</h3>
<form action="deleteWish.do">
	<input type="hidden" name="wno" value="${wish.wishNo }">
	<table class="table">
		<tr>
			<th class="col-sm-3">글번호</th>
			<td>${wish.wishNo }</td>
			<td></td>
		</tr>
		<tr>
			<td colspan="4" align="center"><input class="btn btn-danger"
				type="submit" value="삭제">
				<button class="btn btn-warning" type="button">수정</button></td>
		</tr>
	</table>
</form>