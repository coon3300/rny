<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<link rel="stylesheet" href="css/style.css">

<div class="py-5 text-center">
	<h1>회원리스트</h1>
	<h1>──────</h1>
</div>


<section>
	<div class="container" style="text-align: center" >
		<div class="cart_inner">
			
<form action="memberList.do">
				<!--  검색 -->
				<div class="row">
					<div class="col-sm-4">
						<!-- select 목록. -->
						<select name="searchCondition" class="form-control">
							<option value="">선택하세요.</option>
							<option value="N" ${searchCondition == 'N' ? 'selected' : '' }>회원이름</option>
							<option value="K" ${searchCondition eq 'K' ? 'selected' : '' }>닉네임</option>
							<option value="P" ${searchCondition eq 'P' ? 'selected' : '' }>전화번호</option>
						</select>
					</div>
					<div class="col-sm-6">
						<input type="text" name="keyword" value="${keyword}" class="form-control">
					</div>

					<div class="col-sm-2">
						<input type="submit" value="검색" class="btn btn-primary">
					</div>
				</div>
</form>

				<table class="table" style="text-align: center">
					<thead>
						<tr>
						  <th class="col-sm-1">NO</th>
							<th class="col-sm-1">고유번호</th>
							<th class="col-sm-1">ID</th>
							<th class="col-sm-1">이름</th>
							<th class="col-sm-2">생년월일</th>
							<th class="col-sm-2">폰번호</th>
							<th class="col-sm-2">가입일자</th>
							<th class="col-sm-1">권한</th>
							<th class="col-sm-3">상세</th>
							<th class="col-sm-3">삭제</th>

						</tr>
					</thead>

					<tbody style="height: 1px">
					
					<% int cnt = 1; %> <!-- cnt 변수를 1로 초기화 -->
						<c:forEach var="member" items="${memberList}">
							<tr>
								<td><%= cnt++ %></td>
								<td>${member.userNo }</td>
								<td>${member.userId }</td>
								<td>${member.userName }</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.userBirth}" /></td>
								<td>${member.userPhone }</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.userDate}" /></td>
								<td>${member.responsibility }</td>
								<td class="col-sm-1"><a class="btn_1" href="user.do?uno=${member.userNo}">상세</a></td>
								<%-- <td class="col-sm-1"><a class="btn_1" value="${member.userNo}">삭제</a></td> --%>
								<td class="col-sm-1">
                <a href="deletemember.do?userNo=${member.userNo}" class="btn_1" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
		</div>
	</div>
	

	<!-- paging...시작. -->
	<nav aria-label="...">
		<ul class="pagination justify-content-center">
			<!-- 이전 페이지. -->
			<c:choose>
				<c:when test="${paging.prev }">
					<li class="page-item"><a class="page-link" href="memberList.do?page=${paging.startPage-1 }">Previous</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled">
						<a class="page-link">Previous</a>
					</li>
				</c:otherwise>
			</c:choose>

			<!-- 페이지 갯수 만큼 링크 생성. -->
			<c:forEach var="p" begin="${paging.startPage }" end="${paging.endPage }">
				<c:choose>
					<c:when test="${paging.page == p }">
						<li class="page-item active" aria-current="page">
							<a class="page-link" href="#">${p}</a>
						</li>
					</c:when>
					
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="memberList.do?page=${p}&searchCondition=${searchCondition}&keyword=${keyword}">${p}</a>
						</li>
					</c:otherwise>
					
				</c:choose>
			</c:forEach>


			<!-- next 페이지. -->
			<c:choose>
				<c:when test="${paging.next }">
					<li class="page-item"><a class="page-link" href="memberList.do?searchCondition=${searchCondition}&keyword=${keyword}&page=${paging.endPage + 1}">NEXT</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled">
						<a class="page-link">NEXT</a>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
	<!-- paging...종료. -->

</section>
