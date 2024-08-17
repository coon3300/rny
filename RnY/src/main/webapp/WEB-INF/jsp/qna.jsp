<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
					<p style="text-align: left">작성자 ${qvo.userId}</p>
					<p style="text-align: left">
						작성일시
						<fmt:formatDate pattern="yyyy-MM-dd" value="${qvo.qnaDate}" />
					</p>
					<p>${qvo.qnaContent}</p>
					<br>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 댓글 관련 -->
<div class="container reply">
	<div class="row">
		<!-- 등록 -->
		<c:choose>
			<c:when test="${sessionScope.responsibility eq 'admin'}">
				<div class="header">
					<input type="hidden" name="qno" id="qno" value="${qvo.qnaNum}" />
					<input type="hidden" name="writer" id="writer" value="${logid}" />
					<input type="text" class="col-sm-11" id="content">
					<button type="button" class="btn btn-outline-info" id="addReply">댓글등록</button>
				</div>
			</c:when>
			<c:otherwise>
				<p style="text-align: center; color: red;">댓글 작성 권한이 없습니다. 관리자만 댓글을 작성할 수 있습니다.</p>
			</c:otherwise>
		</c:choose>

		<!-- 목록 -->
		<div class="content justify-content-center">
	<ul id="replyList">
		<c:forEach var="qna" items="${qnaList}">
			<li data-rno="${qna.qreplyNum}">
				<span class="col-sm-11">${qna.qreplyNum}</span>
				<span class="col-sm-5">${qna.qreplyContent}</span>
				<span class="col-sm-11">${qna.userId}</span>
				<span class="col-sm-11">
					<fmt:formatDate pattern="yyyy-MM-dd" value="${qna.qreplyDate}" />
				</span>
				<c:if test="${sessionScope.responsibility == 'admin'}">
					<button type="button" class="btn btn-outline-info" onclick="deleteReply(${qna.qreplyNum})">삭제</button>
				</c:if>
			</li>
		</c:forEach>
	</ul>
</div>
	</div>
</div>
<script type="text/javascript">
    const responsibility = '<%=session.getAttribute("responsibility") != null ? session.getAttribute("responsibility") : "" %>';
    console.log("JavaScript에서 확인된 responsibility 값:", responsibility);
</script>
<script src="js/chan/replyService.js"></script>
<script src="js/chan/addreply.js"></script>