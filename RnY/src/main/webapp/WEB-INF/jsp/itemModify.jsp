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
					src="images/line/${ivo.getLineNo() }a.jpg" />
			</div>
			<div class="col-md-6">
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel"
						aria-labelledby="home-tab">
					<div class="table-responsive">
						<form action="itemUpdate.do">
						<table class="table"> 
							<tbody>
								<tr>
									<td>
										<h5>상품번호</h5>
									</td>
									<td>
										<h5>
										
										<input class="form-control" type="text" name="itemNo" value="${ivo.getItemNo()}" readonly>
										</h5>
										
									</td>
								</tr>
								<tr>
									<td>
										<h5>라인 번호</h5>
									</td>
									<td>
										<h5>
											<input class="form-control" type="text" name="lineNo" value="${ivo.getLineNo() }">
										</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>아이템 코드</h5>
									</td>
									<td>
										<h5><input class="form-control" type="text" name="itemCode" value="${ivo.getItemCode() }"></h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>아이템명</h5>
									</td>
									<td>
										<h5><input class="form-control" type="text" name="itemName" value="${ivo.getItemName() }"></h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>설명</h5>
									</td>
									<td>
										<h5><input class="form-control" type="text" name="itemDesc" value="${ivo.getItemDesc() }"></h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>가격</h5>
									</td>
									<td>
										<h5><input class="form-control" type="text" name="itemPrice" value="${ivo.getItemPrice() }"></h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>재고</h5>
									</td>
									<td>
										<h5><input class="form-control" type="text" name="itemStock" value="${ivo.getItemStock() }"></h5>
									</td>
								</tr>


								<tr>
									<td>
										<h5>이미지</h5>
									</td>
									<td>
										<h5><input class="form-control" type="text" name="itemImage" value="${ivo.getItemImage() }"></h5>
									</td>
								</tr>
							</tbody>
						</table>
						
						<div id="buttons" class="card-footer p-4 pt-0 border-top-0 bg-transparent d-flex justify-content-between list-unstyled m-0" style="margin: 0; padding: 0;">
							<input class="btn btn-outline-primary w-100 mt-auto " type="submit" value="수정">
							
							<button class="btn btn-outline-danger w-100 mt-auto" type="button" id="removeItem" style="${ivo.getIsDisabled() == 1 ? 'display:none;' : ''}">삭제</button>
							<button class="btn btn-outline-warning w-100 mt-auto" type="button" id="restoreItem" style="${ivo.getIsDisabled() == 1 ? '' : 'display:none;'}">삭제 취소</button>							
							
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
			        	<img  class="fit-picture"  src="images/line/${ivo.getLineNo() }b.jpg"  alt="..." />
			        </div>
		        </div>
        </section>

	<script>
		document.querySelector('#removeItem')
				.addEventListener('click', function(e) {
					location.href = 'itemRemove.do?itemNo=${ivo.getItemNo() }';
				});
		
		document.getElementById('restoreItem')
				.addEventListener('click', function(e) {
					location.href = 'itemRestore.do?itemNo=${ivo.getItemNo() }';
				});
	</script>