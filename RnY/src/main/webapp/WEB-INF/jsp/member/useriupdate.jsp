<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<Script src='js/addmember2.js'></Script>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
    color: #333;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

.container1 {
    width: 100%;
    max-width: 800px;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    font-size: 24px;
    margin-bottom: 20px;
    color: #333;
    letter-spacing: 2px;
}

.form-group {
    margin-bottom: 15px;
}

label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

input[type="text"], 
input[type="password"], 
input[type="email"], 
select {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
    color: #333;
}

input[type="text"]:disabled,
input[type="password"]:disabled,
input[type="email"]:disabled {
    background-color: #f0f0f0;
}

button {
    display: block;
    width: 100%;
    padding: 10px;
    background-color: #333;
    color: #fff;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #555;
}

.note {
    font-size: 12px;
    color: #777;
    margin-top: 20px;
    text-align: center;
}

button.cancel {
    background-color: #ccc;
    color: #333;
    margin-top: 10px;
}

button.cancel:hover {
    background-color: #aaa;
}
</style>

<div class="container1">
        <h1>MODIFY</h1>
		<form action="updateuser.do" method="post">
 		   <input type="hidden" name="userNo" value="${userinfo.userNo}">

    <div class="form-group">
        <label for="id">아이디 *</label>
        <input type="text" id="userId" name="userId" value="${userinfo.userId}" disabled>
    </div>

    <div class="form-group">
        <label for="password">비밀번호 *</label>
        <input type="password" id="userPw" onkeyup="check_pw()" name="userPw" placeholder="Password(변경시에만 입력)">
        <span id="checkResultPW"></span>
    </div>

    <div class="form-group">
        <label for="confirm_password">비밀번호 확인 *</label>
        <input type="password" id="userPw2" onkeyup="check_pw2()" name="userPw2"  placeholder="Confirm Password (변경시에만 입력)">
        <span id="checkResultPW2"></span>
    </div>

	<div class="form-group">
        <label for="name">이름 *</label>
        <input type="text" id="userName" name="userName" value="${userinfo.userName}" disabled>
    </div>
    
    <div class="form-group">
        <label for="name">닉네임 *</label>
        <input type="text" id="userNick" name="userNick" value="${userinfo.userNick}">
    </div>

    <div class="form-group">
        <label for="birth">생년월일 *</label>
        <input type="text" id="userBirth" name="userBirth" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${userinfo.userBirth}'/>">
        <span id="checkResultBirth"></span>
    </div>

    <div class="form-group">
        <label for="phone">전화번호 *</label>
        <input type="text" id="userPhone" name="userPhone" onkeyup="check_phone()" value="${userinfo.userPhone}">
    	<span id="checkResultPhone"></span>
    </div>

    <div class="form-group">
        <label for="email">이메일 *</label>
        <input type="email" id="userEmail" name="userEmail" value="${userinfo.userEmail}">
        <span id="checkResultEMAIL"></span>
    </div>

    <div class="form-group">
        <label for="address">주소</label>
        <input type="text" id="userAdd" name="userAdd" value="${userinfo.userAdd}" disabled>
    </div>

    <div class="form-group">
        <label for="date">가입일자 *</label>
        <input type="text" id="userDate" name="userDate" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${userinfo.userDate}'/>" disabled>
    </div>

    <p class="note">회원 정보를 입력하시면 하단의 버튼을 클릭하세요.</p>
    
    <button type="submit" class="btn btn-danger">정보수정</button>
    <button type="button" class="btn btn-warning"> <a href="mypage.do">뒤로가기</a></button>
    
</form>

		</div>

