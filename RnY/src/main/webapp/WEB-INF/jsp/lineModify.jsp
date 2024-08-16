<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<!-- Bootstrap icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="css/main/styles.css" rel="stylesheet" />
	<link href="css/styles.css" rel="stylesheet" />
<style>

#buttons {
    padding: 0 !important;
}
</style>
	
	
</head>


<!-- 상품상세. -->
<!-- Product section-->
<section class="py-5 bg-light">
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="col-md-6">
				<img class="card-img-top mb-5 mb-md-0"
					src="images/line/${lvo.getLineNo() }a.jpg" />
			</div>
			<div class="col-md-6">
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel"
						aria-labelledby="home-tab">
					<div class="table-responsive">
						<form action="lineUpdate.do">
						<table class="table"> 
							<tbody>
								<tr>
									<td>
										<h5>라인 번호</h5>
									</td>
									<td>
										<h5>
										
										<input class="form-control" type="text" name="lineNo" value="${lvo.getLineNo() }" readonly>
										</h5>
										
									</td>
								</tr>
								<tr>
									<td>
										<h5>부모 라인 번호</h5>
									</td>
									<td>
										<h5>
											<input class="form-control" type="text" name="lineParentNo" value="${lvo.getLineParentNo() }">
										</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>라인명</h5>
									</td>
									<td>
										<h5><input class="form-control" type="text" name="lineName" value="${lvo.getLineName() }"></h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>라인 설명</h5>
									</td>
									<td>
										<h5><input class="form-control" type="text" name="lineDesc" value="${lvo.getLineDesc() }"></h5>
									</td>
								</tr>
							</tbody>
						</table>
						
						<div id="buttons" class="card-footer p-4 pt-0 border-top-0 bg-transparent d-flex justify-content-between list-unstyled m-0" style="margin: 0; padding: 0;">
							<input class="btn btn-outline-primary w-100 mt-auto " type="submit" value="수정">
							
							<button class="btn btn-outline-danger w-100 mt-auto" type="button" id="removeLine" style="${lvo.getIsDisabled() == 1 ? 'display:none;' : ''}">삭제</button>
							<button class="btn btn-outline-warning w-100 mt-auto" type="button" id="restoreLine" style="${lvo.getIsDisabled() == 1 ? '' : 'display:none;'}">삭제 취소</button>							
							
						</div>
						</form>
					</div>

				</div>
			</div>
			</div>		
		</div>
	</div>
  </section>

<!--================End Product Description Area =================-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5 ">
            	<div class="row justify-content-center">
			        	<img  class="fit-picture"  src="images/line/${lvo.getLineNo() }b.jpg"  alt="..." />
			        </div>
		        </div>
        </section>

	<script>
		document.querySelector('#removeLine')
				.addEventListener('click', function(e) {
					location.href = 'lineRemove.do?lineNo=${lvo.getLineNo() }';
				});
		
		document.getElementById('restoreLine')
				.addEventListener('click', function(e) {
					location.href = 'lineRestore.do?lineNo=${lvo.getLineNo() }';
				});
	</script>