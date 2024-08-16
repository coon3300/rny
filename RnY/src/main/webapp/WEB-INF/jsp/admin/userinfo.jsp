<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
    padding: 30px;
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
    display: flex;
    align-items: center;
    margin-bottom: 15px;
}

.form-group label {
    width: 120px; /* 모든 레이블의 너비를 동일하게 설정 */
    margin-right: 10px; /* label과 input 간의 간격을 조정 */
    white-space: nowrap; /* 텍스트가 줄 바꿈되지 않도록 설정 */
    text-align: right; /* 레이블 텍스트를 오른쪽 정렬 */
}

.form-group input {
    flex: 1;
    padding: 10px;
    border: 0;
    border-radius: 10px;
    
}

input[disabled] {
    background-color:#ecfdff; /* 비활성화된 필드의 배경색도 연한 하늘색 */
}

button {
    display: inline-block;
    padding: 10px 10px;
    width: 100px;
    border-radius: 20px;
    background-color: #ecfdff;
    font-size: 15px;
    font-weight: 700;
    color: black;
    border: none;
    transition: 0.5s;
    justify-content: center;
    
}

button:hover {
    background-color: #ec971f;
}

button.cancel:hover {
    background-color: #aaa;
}
</style>

<div class="container1">
    <h1>USERINFO</h1>
    <h1>────────</h1>

    <div class="form-group">
        <label>회원고유번호</label>
        <input value="${mvo.userNo}" disabled>
    </div>

    <div class="form-group">
        <label>ID</label>
        <input value="${mvo.userId}" disabled>
    </div>

    <div class="form-group">
        <label>이름</label>
        <input value="${mvo.userName}" disabled>
    </div>

    <div class="form-group">
        <label>닉네임</label>
        <input value="${mvo.userNick}" disabled>
    </div>

    <div class="form-group">
        <label>생년월일</label>
        <input value="<fmt:formatDate pattern='yyyy-MM-dd' value='${mvo.userBirth}'/>" disabled>
    </div>

    <div class="form-group">
        <label>전화번호</label>
        <input value="${mvo.userPhone}" disabled>
    </div>

    <div class="form-group">
        <label>이메일</label>
        <input value="${mvo.userEmail}" disabled>
    </div>

    <div class="form-group">
        <label>주소</label>
        <input value="${mvo.userAdd}" disabled>
    </div>

    <div class="form-group">
        <label>가입일자</label>
        <input value="<fmt:formatDate pattern='yyyy-MM-dd' value='${mvo.userDate}'/>" disabled>
    </div>

    <div class="form-group">
        <label>권한</label>
        <input value="${mvo.responsibility}" disabled>
    </div>

    <button type="button">
        <a href="memberList.do" style="color:black ; text-decoration: none; ">뒤로가기</a>
    </button>
    
</div>


