<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="colorlib-about">
	<div class="container">
		<div class="row row-pb-lg">
			<div class="col-sm-6 mb-3">
				<img src="images/chan/${qvo.qnaImage}" width="600" height="500"
					alt="qna image">
				<div class="overlay"></div>
			</div>
			<div class="col-sm-6">
				<div class="about-wrap">
					<p>${qvo.qnaNum}</p>
					<h2>${qvo.qnaTitle}</h2>
					<p style="text-align: left">작성자 ${qvo.userNo}</p>
					<p style="text-align: left">작성일시 ${qvo.qnaDate}</p>
					<p>${qvo.qnaContent}</p>
					<br>
					<!--  <p style="text-align: right">${qvo.qnaAnswerDate}</p>
					<p style="text-align: right">${qvo.qnaAnswer}</p>-->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 댓글관련.. -->
<div class="container reply">
	<!-- 등록. -->
	<div class="header">
		<input class="col-sm-8" id="content">
		<button class="col-sm-3" id="addReply">댓글등록</button>
	</div>
</div>
<!-- 목록. -->
<div class="content">
	<ul id="replyList">
		<li style="display: none;"><span class="col-sm-2">11</span> <span
			class="col-sm-5">댓글내용입니다.</span> <span class="col-sm-2">user02</span>
			<span class="col-sm-2"><button>삭제</button></span></li>
	</ul>
</div>
<script src="js/chan/replyService.js"></script>
<script src="js/chan/addreply.js"></script>