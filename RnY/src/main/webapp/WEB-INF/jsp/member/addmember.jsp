<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<Script src='js/addmember2.js'></Script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	 
<div class="container" style="max-width: 600px; margin: auto;">

<form action="addMember.do" name="join">
		
		
		<div class="py-5 text-center">
			<h1>회원가입</h1>
			<h1>─────</h1>
		</div>
		
			<div>
				<label> ID </label>
					<input type="text" class="form-control" id="userId" onkeyup="check_id()" name="userId" placeholder="" value="" required>
						<span id="checkResultID"></span>
			</div>
			

			<div>
				<label> PASSWORD </label>
					<input type="password" class="form-control" id="userPw" onkeyup="check_pw()" name="userPw" placeholder="" required>
						<span id="checkResultPW"></span>
			</div>
			

			<div>
				<label> PASSWORD 확인 </label>
					<input type="password" class="form-control" id="userPw2" onkeyup="check_pw2()" name="userPw2" placeholder="" required>
						<span id="checkResultPW2"></span>
			</div>
			

			<div>
				<label> 이름 </label> 
					<input type="text" class="form-control" id="userName" name="userName" required>
			</div>


			<div>
				<label> 닉네임 </label> 
					<input type="text" class="form-control" id="userNick" name="userNick" required>
			</div>

			<div>
				<label> 생년월일 </label> 
					<input type="text" class="form-control" id="userBirth" onkeyup="check_birth()" name="userBirth" placeholder="1995-11-10" required>
						<span id="checkResultBirth"></span>
			</div>


			<div>
				<label> 이메일 </label> 
					<input type="text" class="form-control" id="userEmail" name="userEmail" onkeyup="check_email()" placeholder="abc@naver.com" required>
						<span id="checkResultEMAIL"></span>
			</div>


			<div>
				<label> 전화번호 </label> 
					<input type="text" class="form-control" id="userPhone" onkeyup="check_phone()" name="userPhone" placeholder="010-0000-0000" required>
			      <span id="checkResultPhone"></span>
			</div>


			<div>
				<label> 주소 </label>
					<input type="text" class="form-control" id="sample6_postcode" name="userAdd1" placeholder="우편번호 찾기" onclick="sample6_execDaumPostcode()">
					<input type="text" class="form-control" id="sample6_address"	name="userAdd2" placeholder="주소">
					<!-- <input type="text" class="form-control" id="sample6_detailAddress" name="userAdd3" placeholder="상세주소">  -->
					<input type="text" class="form-control" id="sample6_extraAddress" name="userAdd4" placeholder="상세주소">
			</div>
			

			<div>
				<!-- <button class="w-100 btn btn-primary btn-lg" type="submit">회원가입</button> -->
				<button id="submitBtn" class="w-100 btn btn-primary btn-lg" type="submit" onclick="submitForm()" disabled>회원가입</button>
			</div>
			
			<div id="successMessage"></div>

		
	</form>
</div>