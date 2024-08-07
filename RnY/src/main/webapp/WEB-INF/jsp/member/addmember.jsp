<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


	<div class="container">
	<form action="addMember.do" name="join">
			<div class="py-5 text-center">
				<h1>회원가입</h1>
				<h1>─────</h1>
			  	</div>
			  	
							<div class="col-sm-12">
								<label class="form-label" > ID </label> 
								<input type="text" class="form-control" id="userId" name="userId" placeholder="" value="" required>
							</div>

							<div class="col-12">
								<label class="form-label"> PASSWORD </label>
									<input type="password" class="form-control" id="userPw" name="userPw" placeholder="비밀번호" required>
							</div>
							
							<div class="col-12">
								<label class="form-label"> PASSWORD확인 </label>
									<input type="password" class="form-control" id="userPw1" name="userPw1" placeholder="비밀번호 확인" required>
							</div>
							
							<div class="col-12">
								<label class="form-label"> 이름 </label>
									<input type="text" class="form-control" id="userName" name="userName" required>
							</div>
							
							<div class="col-12">
								<label class="form-label"> 닉네임 </label>
									<input type="text" class="form-control" id="userNick"  name="userNick" required>
							</div>
							
							<div class="col-12">
								<label class="form-label"> 생년월일 </label>
									<input type="text" class="form-control" id="userBirth" name="userBirth" placeholder="1995-11-10" 
									required>
							</div>
							
							<div class="col-12">
								<label class="form-label"> 이메일 </label>
									<input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="abc@naver.com" required>
							</div>
							
							<div class="col-12">
								<label class="form-label"> 전화번호 </label>
									<input type="text" class="form-control" id="userPhone" name="userPhone" placeholder="010-0000-0000" required>
							</div>
							
								<div class="col-12">
								<label class="form-label"> 주소 </label>
									<input type="text" class="form-control" id="userAdd" name="userAdd" required>
							</div>

            <div class="row-2">
						<button class="w-100 btn btn-primary btn-lg" type="submit"> 회원가입 </button>
						</div>
						</form>
					</div>
					
	<script type="text/javascript" src="src/main/webapp/js/addmember.js"></script>
	
	
	
	
	
	