<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<Script src='js/address.js'></Script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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

.buttons {
    display: flex;
    justify-content: center;
    gap: 10px; /* 버튼 간의 간격 추가 */
    margin-top: 20px;
}

button, input[type="submit"], input[type="button"] {
    padding: 10px 20px;
    background-color: #007bff; /* 기본 버튼 색상 (파란색) */
    color: #fff;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    text-align: center; /* 텍스트 중앙 정렬 */
}

button:hover, input[type="submit"]:hover, input[type="button"]:hover {
    background-color: #0056b3; /* 호버 시 색상 (더 진한 파란색) */
}

button.cancel, input[type="button"].cancel {
    background-color: #6c757d; /* 취소 버튼 색상 (회색) */
    color: #fff;
}

button.cancel:hover, input[type="button"].cancel:hover {
    background-color: #5a6268; /* 취소 버튼 호버 시 색상 */
}

.checkbox {
    display: flex;
    align-items: center; /* 세로 정렬을 중앙으로 맞춤 */
}

.checkbox input[type="checkbox"] {
    margin-right: 10px; /* 체크박스와 레이블 사이 간격 설정 */
}

hr.custom-hr {
    border: none;  /* 기본 선 없애기 */
    border-top: 2px solid #333;  /* 두께와 색상 설정 */
    width: 20%;  /* 너비 설정 */
    margin: 20px auto;  /* 위아래 여백과 중앙 정렬 */
}
</style>


<div class="container1">
    <form action="address.do">
        <div class="notice">
            <div class="py-5 text-center">
                <h1>Shipping Register</h1>
                <h1>주소록 등록</h1>
                <hr class="custom-hr">
            </div>
            
            <p>배송 주소록 유의사항</p>
            <ul>
                <li>배송 주소로 최대 10개까지 등록할 수 있으며...</li>
                <li>자동 업데이트 제외한 경우...</li>
                <li>기본 배송지는 1개만 저장됩니다...</li>
            </ul>
        </div>

        <div class="form-group">
            <input type="hidden" class="form-control" id=userNo name="userNo" value="${userNo}" readonly="readonly">
        </div>
        
        <div class="form-group">
            <label> 배송지명 </label>
            <input type="text" class="form-control" id=addName name="addName" placeholder="배송지명을 입력하세요" required>
        </div>
        
        <div class="form-group">
            <label> 수령인 </label> 
            <input type="text" class="form-control" id="recipient" name="recipient" placeholder="수령인명을 입력하세요" required>
        </div>

        <div class="form-group">
            <label> 전화번호 </label> 
            <input type="text" class="form-control" id="addPhone" onkeyup="check_phone()" name="addPhone" placeholder="010-0000-0000" required>
            <span id="checkResultPhone"></span>
        </div>

        <div class="form-group">
            <label> 신규주소 </label>
            <input type="text" class="form-control" id="sample6_postcode" name="newAddress1" placeholder="우편번호 찾기" onclick="sample6_execDaumPostcode()">
            <input type="text" class="form-control" id="sample6_address" name="newAddress2" placeholder="주소">
            <input type="text" class="form-control" id="sample6_extraAddress" name="newAddress3" placeholder="상세주소">
        </div>
        
        <div class="checkbox">
  		   <input type="checkbox" id="defaultAddress" name="defaultAddress">
 		   <label for="defaultAddress">이 배송지를 기본 배송지로 저장</label>
		</div>
        
        <div class="buttons">
            <input type="submit" value="등록">
            <input type="button" class="cancel" value="취소">
        </div>
    </form>
</div>
