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

.divider {
    text-align: center;
    margin: 40px 0;
    width: 100%; /* 컨테이너 안에 들어가므로 100%로 변경 */
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
    top: -6px; /* 다이아몬드 위치 조정 */
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

.button-container {
    text-align: right; /* 버튼을 오른쪽으로 정렬 */
    margin-top: 20px; /* 위쪽 여백 추가 */
}

button {
    padding: 10px 20px;
    width: 100px;
    border-radius: 20px;
    background-color: #ecfdff;
    font-size: 15px;
    font-weight: 700;
    color: black;
    border: none;
    transition: 0.5s;
    cursor: pointer;
}

button:hover {
    background-color: #ec971f;
}

button.cancel:hover {
    background-color: #aaa;
}

button a {
    color: black;
    text-decoration: none;
}
</style>

<div class="container1">
    <h1>USERINFO</h1>

    <!-- divider 영역을 container1 내부로 이동 -->
    <div class="divider">
        <div class="line-with-diamond"></div>
        <span class="divider-text">회원 정보</span>
        <div class="line-with-diamond"></div>
    </div>

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

    <div class="button-container">
        <button type="button">
            <a href="memberList.do">뒤로가기</a>
        </button>
    </div>
</div>
