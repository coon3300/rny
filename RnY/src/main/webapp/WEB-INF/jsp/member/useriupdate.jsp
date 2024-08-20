<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<Script src='js/addmember2.js'></Script>
<style>
body {
    font-family: 'Jua', sans-serif;
    background-color: #fff;
    color: #333;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

.divider {
    text-align: center;
    margin: 40px 0;
    position: relative;
    width: 100vw;
    left: 50%;
    transform: translateX(-50%);
}

.line-with-diamond {
    width: 100%;
    height: 1px;
    background-color: #ccc;
    position: relative;
    margin: 10px 0;
}

.line-with-diamond::before {
    content: '\25C6'; /* 다이아몬드 모양 유니코드 */
    font-size: 12px;
    color: #333;
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    top: -6px;
    background-color: #fff;
    padding: 0 5px;
}

.divider-text {
    font-size: 16px;
    font-weight: bold;
    color: #666;
    margin: 50px 0;
    display: block;
    position: relative;
}

.main-container {
    max-width: 800px;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
}

h1 {
    font-size: 32px;
    text-align: center;
    font-weight: 700;
    margin-bottom: 30px;
    color: #000;
    letter-spacing: 2px;
}

hr.custom-hr {
    border: none;
    border-top: 1px solid #333;
    width: 70px;
    margin: 10px auto;
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
    width: calc(100% - 20px);
    padding: 15px;
    border: 3px solid #f5eee6;
    border-radius: 5px;
    font-size: 16px;
    color: #333;
    background-color: transparent;
    box-sizing: border-box;
}

input[type="text"]:disabled,
input[type="password"]:disabled,
input[type="email"]:disabled {
    background-color: #f5eee6;
    color: #aaa;
}

input::placeholder {
    color: #aaa; /* placeholder 폰트 색상을 회색으로 설정 */
}

input:focus {
    outline: none;
    border: 3px solid #f5eee6;
    box-shadow: none;
}

.button-container {
    display: flex;
    justify-content: center; /* 중앙 정렬 */
    gap: 20px; /* 버튼 사이의 간격 */
    margin-top: 20px;
}

button {
    width: 30%; /* 버튼 크기를 줄임 */
    padding: 10px;
    color: #fff;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.submit-btn {
    background-color: #FFB347; 
}

.submit-btn:hover {
    background-color: #FFDAB9; 
}

.cancel-btn {
    background-color: #cccccc; 
}

.cancel-btn:hover {
    background-color: #707070; 
}
</style>

<div class="main-container">
	
   	 	<h1>MODIFY</h1>
    	<hr class="custom-hr">
 	
 	<div class="divider">
    	 <div class="line-with-diamond"></div>
   		 <span class="divider-text">수정 할 회원정보를 입력하신 후 하단의 버튼을 클릭하세요</span>
   		 <div class="line-with-diamond"></div>
	</div>
 	
  <form action="updateuser.do" method="post">
 	<input type="hidden" name="userNo" value="${userinfo.userNo}">

    <div class="form-group">
        <label for="id">아이디</label>
        <input type="text" id="userId" name="userId" value="${userinfo.userId}" disabled>
    </div>

    <div class="form-group">
        <label for="password">비밀번호</label>
        <input type="password" id="userPw" onkeyup="check_pw()" name="userPw" placeholder="Password(변경시에만 입력)">
        <span id="checkResultPW"></span>
    </div>

    <div class="form-group">
        <label for="confirm_password">비밀번호 확인</label>
        <input type="password" id="userPw2" onkeyup="check_pw2()" name="userPw2"  placeholder="Confirm Password (변경시에만 입력)">
        <span id="checkResultPW2"></span>
    </div>

	<div class="form-group">
        <label for="name">이름</label>
        <input type="text" id="userName" name="userName" value="${userinfo.userName}" disabled>
    </div>
    
    <div class="form-group">
        <label for="name">닉네임</label>
        <input type="text" id="userNick" name="userNick" value="${userinfo.userNick}">
    </div>

    <div class="form-group">
        <label for="birth">생년월일</label>
        <input type="text" id="userBirth" name="userBirth" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${userinfo.userBirth}'/>">
        <span id="checkResultBirth"></span>
    </div>

    <div class="form-group">
        <label for="phone">전화번호</label>
        <input type="text" id="userPhone" name="userPhone" onkeyup="check_phone()" value="${userinfo.userPhone}">
    	<span id="checkResultPhone"></span>
    </div>

    <div class="form-group">
        <label for="email">이메일</label>
        <input type="email" id="userEmail" name="userEmail" value="${userinfo.userEmail}">
        <span id="checkResultEMAIL"></span>
    </div>

    <div class="form-group">
        <label for="address">주소</label>
        <input type="text" id="userAdd" name="userAdd" value="${userinfo.userAdd}" disabled>
    </div>

    <div class="form-group">
        <label for="date">가입일자</label>
        <input type="text" id="userDate" name="userDate" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${userinfo.userDate}'/>" disabled>
    </div>
    
    <div class="button-container">
        <button type="submit" class="submit-btn">정보수정</button>
        <button type="button" class="cancel-btn"> <a href="mypage.do">뒤로가기</a></button>
    </div>
  </form>
</div>
