<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="colorlib-about">
	<div class="container">
		<div class="row row-pb-lg">
			<div class="col-sm-6 mb-3">
				<img src="images/chan/${qvo.qnaImage}" width="600" height="500" alt="qna image">
				<div class="overlay"></div>
			</div>
			<div class="col-sm-6">
				<div class="about-wrap">
					<p>${qvo.qnaNum}</p>
					<h2>${qvo.qnaTitle}</h2>
					<p style="text-align: left">작성자 ${qvo.userNo}</p>
					<p style="text-align: left">작성일시 <fmt:formatDate pattern="yyyy-MM-dd" value="${qvo.qnaDate}"/></p>
					<p>${qvo.qnaContent}</p>
					<br>
					<!--  <p style="text-align: right">${qvo.qnaAnswerDate}</p>
			<p style="text-align: right">${qvo.qnaAnswer}</p>-->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 댓글관련. -->
<div class="container reply">
    <div class="row">
		<!-- 등록. -->
		<div class="header">
			<input type="hidden" name="qno" id="qno" value="${qvo.qnaNum}" /> <input type="hidden" name="writer"
				id="writer" value="${logid}" /> <input type="text" class="col-sm-11" id="content">
			<button type="button" class="btn btn-outline-info" id="addReply">댓글등록</button>
		</div>
		<!-- 목록. -->
		<div class="content justify-content-center">
			<ul id="replyList">
				<li style="display: none;">
					<span class="col-sm-11">${qvc.qreplyNum}</span>
					<span class="col-sm-5">${qvc.qreplyContent}</span>
					<span class="col-sm-11">${qvc.userId}</span>
					<span class="col-sm-11">${qvc.qreplyDate}</span>
					<button type="button" class="btn btn-outline-info">삭제</button>
				</li>
			</ul>
		</div>
	</div>
</div>
<script src="js/chan/replyService.js"></script>
<script src="js/chan/addreply.js"></script>