<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title>addMember.jsp</title>
<Script src='js/addmember2.js'></Script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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

p {
    text-align: center;
    color: #666;
    font-size: 14px;
}

.form-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.form-table th {
    text-align: left;
    padding: 15px 10px;
    font-weight: bold; /* 폰트를 굵게 설정 */
    color: #333;
    vertical-align: middle;
    font-size: 16px;
    width: 150px; /* th 너비 고정 */
}

.form-table th::after {
    content: "\f069"; /* Font Awesome의 asterisk 아이콘 코드 */
    font-family: "Font Awesome 5 Free"; /* Font Awesome 폰트 패밀리 지정 */
    font-weight: 900; /* 폰트 굵기 */
    color: red; /* 아이콘 색상 */
    font-size: 10px; /* 아이콘 크기 조정 */
    margin-left: 5px; /* 아이콘과 텍스트 사이 간격 */
    vertical-align: top; /* 아이콘을 텍스트와 중앙 정렬 */
}

.form-table td {
    padding: 15px 10px;
    vertical-align: top;
}

.form-control {
    width: calc(30% - 10px); /* 인풋박스 너비 조정 */
    padding: 15px; /* 인풋박스 높이 조정 */
    border: 3px solid #f5eee6; /* 연한 노란색 테두리 */
    border-radius: 5px;
    font-size: 14px;
    color: #333;
    background-color: transparent;
    box-sizing: border-box;
    margin-bottom: 5px;
    outline: none; /* 포커스 시 검은 테두리 제거 */
    display: inline-block; /* 인풋박스를 인라인 블록 요소로 설정 */
    vertical-align: middle; /* 스판태그와 수직으로 중앙 정렬 */
}

.form-control::placeholder {
    color: #aaa; /* placeholder 폰트 색상을 회색으로 설정 */
}

.form-control:focus {
    outline: none; /* 포커스 시 검은 테두리 제거 */
    border: 3px solid #f5eee6; /* 포커스 시에도 노란색 테두리 유지 */
    box-shadow: none; /* 포커스 시 그림자 제거 */
}

.form-control#userId {
    background-color: #f5eee6; /* 아이디 필드 배경색 연한 노란색 */
}

.form-control#userName,
.form-control#userNick,
.form-control#userBirth,
.form-control#userPhone,
.form-control#userEmail {
    width: 40%; 
}

.form-control#sample6_postcode,
.form-control#sample6_address,
.form-control#sample6_extraAddress {
    width: 70%; 
}

.info-text {
    font-size: 12px;
    color: #aaa;
    display: inline-block; /* 스판태그를 인라인 블록 요소로 설정 */
    margin-top: 0;
    margin-left: 10px; /* 인풋박스와의 간격 조정 */
    vertical-align: middle; /* 인풋박스와 수직으로 중앙 정렬 */
   /* 스판태그 너비 조정 */
}

.buttons {
    text-align: center;
    margin-top: 30px;
}

.submit-btn {
    padding: 10px 20px;
    background-color: #cccccc; /* 비활성화된 상태의 기본 색상 */
    color: #fff;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: not-allowed;
    text-align: center;
    transition: background-color 0.3s ease;
    font-family: 'Jua', sans-serif;
}

.submit-btn.enabled {
    background-color: #4CAF50; /* 활성화된 상태의 버튼 색상 (녹색) */
    cursor: pointer;
}

.submit-btn:hover.enabled {
    background-color: #45a049; /* 활성화된 상태에서 마우스를 올렸을 때의 색상 */
}

.tooltip-box {
    display: none;
    position: absolute;
    top: 30px;
    left: 50%;
    width: 250px;
    background-color: #fff;
    border: 1px solid #ddd;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
    border-radius: 5px;
    padding: 10px;
    z-index: 10;
}

.tooltip-box h4 {
    margin: 0;
    font-size: 14px;
    font-weight: bold;
    color: #333;
}

.tooltip-box hr {
    border: none;
    border-top: 1px solid #ddd;
    margin: 8px 0;
}

.tooltip-box ul {
    padding-left: 20px;
    font-size: 12px;
    color: #555;
    list-style-type: disc;
}

.tooltip-box ul li {
    margin-bottom: 5px;
}

/* 인풋 필드와 툴팁을 같은 위치에 표시하기 위한 부모 요소 */
.form-table td {
    position: relative;
}
</style>
	 
<div class="main-container">
   
       <h1>JOIN</h1>
       <hr class="custom-hr">
   
	<div class="divider">
    	 <div class="line-with-diamond"></div>
   		 <span class="divider-text">아래 회원가입 양식을 입력해주세요.</span>
   		 <div class="line-with-diamond"></div>
	</div>


    <form action="addMember.do">
        <table class="form-table">
            <tr>
                <th>아이디</th>
                <td>
                    <input type="text" class="form-control" id="userId" name="userId" placeholder="ID" onkeyup="check_id()" required>
                    <span class="info-text" id="checkResultID">아이디는 4자 이상, 16자 이하 영문자와 숫자만 사용할 수 있습니다</span>
                </td>
            </tr>
            
             <tr>
                <th>비밀번호</th>
                <td>
                    <input type="password" class="form-control" id="userPw" name="userPw" placeholder="Password" onkeyup="check_pw()" required
                           onmouseover="showTooltip()" onmouseout="hideTooltip()">
                    <span class="info-text" id="checkResultPW">(영문 대소문자/숫자/특수문자 중 3가지 이상 조합, 8자~16자)</span>

                    <!-- 설명 박스 -->
                    <div class="tooltip-box" id="tooltipBox">
                        <h4>비밀번호 입력 조건</h4>
                        <hr>
                        <ul>
                            <li>대소문자/숫자/특수문자 중 3가지 이상 조합, 8자~16자</li>
                            <li>입력 가능한 특수문자: ~`!@#$%^&*()_-+={}[]|:;”'<>,.?/</li>
                            <li>공백 입력 불가능</li>
                            <li>연속된 문자, 숫자 사용 불가능</li>
                            <li>동일한 문자, 숫자를 반복해서 사용 불가능</li>
                        </ul>
                    </div>
                </td>
            </tr>
            
            <tr>
                <th>비밀번호 확인</th>
                <td>
                    <input type="password" class="form-control" id="userPw2" name="userPw2" placeholder="Confirm Password" onkeyup="check_pw2()" required>
                    <span class="info-text" id="checkResultPW2"></span>
                </td>
            </tr>
            
            <tr>
                <th>이름</th>
                <td>
                    <input type="text" class="form-control" id="userName" name="userName" required>
                </td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td>
                    <input type="text" class="form-control" id="userNick" name="userNick" required>
                </td>
            </tr>
            <tr>
                <th>생년월일</th>
                <td>
                    <input type="text" class="form-control" id="userBirth" onkeyup="check_birth()" name="userBirth" placeholder="1995-11-10" required>
                    <span class="info-text" id="checkResultBirth">생년월일은 YYYY-MM-DD 형식이어야 합니다.</span>
                </td>
            </tr>
            <tr>
                <th>휴대전화</th>
                <td>
                    <input type="text" class="form-control" id="userPhone" onkeyup="check_phone()" name="userPhone" placeholder="010-0000-0000" required>
                    <span class="info-text" id="checkResultPhone">전화번호는 010-0000-0000 형식이어야 합니다.</span>
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    <input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="user@domain.com" onkeyup="check_email()" required>
                    <span class="info-text" id="checkResultEMAIL">유효한 이메일을 입력해주세요.</span>
                </td>
            </tr>
            <tr>
                <th>주소</th>
                <td>
                    <input type="text" class="form-control" id="sample6_postcode" name="userAdd1" placeholder="우편번호 찾기" onclick="sample6_execDaumPostcode()" required>
                    <input type="text" class="form-control" id="sample6_address" name="userAdd2" placeholder="주소" required>
                    <input type="text" class="form-control" id="sample6_extraAddress" name="userAdd4" placeholder="상세주소" required>
                </td>
            </tr>
        </table>
        <div class="buttons">
            <button id="submitBtn" class="submit-btn" type="submit" onclick="submitForm()" disabled>회원가입</button>
        </div>
        <div id="successMessage"></div>
    </form>
</div>
