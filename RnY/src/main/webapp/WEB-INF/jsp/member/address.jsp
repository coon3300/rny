<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<Script src='js/address.js'></Script>
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
    content: '\25C6';
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

.container1 {
    max-width: 800px;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
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
    width: calc(100% - 20px);
    padding: 15px;
    border: 3px solid #f5eee6;
    border-radius: 5px;
    font-size: 16px;
    color: #333;
    background-color: transparent;
    box-sizing: border-box;
    margin-bottom: 10px; /* 입력 필드 간격 추가 */
}

input[type="text"]:disabled,
input[type="password"]:disabled,
input[type="email"]:disabled {
    background-color: #f0f0f0;
}

.buttons {
    display: flex;
    justify-content: center;
    gap: 10px;
    margin-top: 20px;
}

button, input[type="submit"], input[type="button"] {
    padding: 10px 20px;
    background-color: #FFB347;
    color: #fff;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    text-align: center;
}

button:hover, input[type="submit"]:hover, input[type="button"]:hover {
    background-color: #E69A2C;
}

button.cancel, input[type="button"].cancel {
    background-color: #6c757d;
    color: #fff;
}

button.cancel:hover, input[type="button"].cancel:hover {
    background-color: #5a6268;
}

.checkbox {
    display: flex;
    align-items: center;
}

.checkbox input[type="checkbox"] {
    margin-right: 10px;
}

hr.custom-hr {
    border: none;
    border-top: 2px solid #333;
    width: 20%;
    margin: 20px auto;
}
</style>

<div class="container1">
    <form action="address.do">
        <h1>Shipping Register</h1>
        <hr class="custom-hr">
    
        <div class="divider">
            <div class="line-with-diamond"></div>
            <span class="divider-text">주소록 등록</span>
            <div class="line-with-diamond"></div>
        </div>
                        
        <div class="form-group">
            <input type="hidden" class="form-control" id=userNo name="userNo" value="${userNo}" readonly="readonly">
        </div>
        
        <div class="form-group">
            <label>배송지명</label>
            <input type="text" class="form-control" id="addName" name="addName" placeholder="배송지명을 입력하세요" required>
        </div>
        
        <div class="form-group">
            <label>수령인</label> 
            <input type="text" class="form-control" id="recipient" name="recipient" placeholder="수령인명을 입력하세요" required>
        </div>

        <div class="form-group">
            <label>전화번호</label> 
            <input type="text" class="form-control" id="addPhone" onkeyup="check_phone()" name="addPhone" placeholder="010-0000-0000" required>
            <span id="checkResultPhone"></span>
        </div>

        <div class="form-group">
            <label>신규주소</label>
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
