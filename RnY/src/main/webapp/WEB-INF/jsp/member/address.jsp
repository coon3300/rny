<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
/* 전체 페이지 컨테이너 */
.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
    font-family: Arial, sans-serif;
}

/* 헤더 스타일 */
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 0;
}

.header .logo {
    flex: 1;
}

.header .contact-info {
    flex: 2;
    text-align: right;
}

.header .contact-info p {
    margin: 0;
    line-height: 1.5;
}

.header .menu {
    display: flex;
    justify-content: space-around;
    flex: 2;
}

.header .menu a {
    text-decoration: none;
    color: #333;
    margin: 0 15px;
    font-weight: bold;
}

/* 메인 폼 스타일 */
/* 폼 컨테이너 */
.form-container {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 4px;
}

/* 폼 스타일 */
form {
    display: flex;
    flex-direction: column;
    gap: 15px; / 각 입력 요소 간의 간격 /
}

form label {
    font-weight: bold;
    margin-bottom: 5px;
}

form input[type="text"],
form input[type="tel"],
form select,
form button {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
}

/* 체크박스와 라벨을 같은 줄에 */
.checkbox-container {
    display: flex;
    align-items: center;
}

.checkbox-container input[type="checkbox"] {
    margin-right: 10px;
}

/* 버튼 스타일 */
.buttons {
    display: flex;
    justify-content: flex-start;
    gap: 10px;
}

.buttons input[type="submit"],
.buttons input[type="button"] {
    width: auto;
    padding: 10px 20px;
    background-color: #f1f1f1;
    border: 1px solid #ccc;
    border-radius: 4px;
    cursor: pointer;
}

/* 푸터 스타일 */
.footer {
    text-align: center;
    padding: 20px 0;
    font-size: 12px;
    color: #666;
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    .header {
        flex-direction: column;
        align-items: flex-start;
    }

    .header .contact-info {
        text-align: left;
        margin-top: 10px;
    }

    .header .menu {
        justify-content: flex-start;
    }
}
</style>
<Script src='js/address.js'></Script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<div class="container">

    
    <form action="address.do">
        <div class="notice">
			<div class="py-5 text-center">
    <h1>Shipping Register</h1>
				<h1>주소록 등록</h1>
				<h1>───────</h1>
			</div>
			<p>배송 주소록 유의사항</p>
            <ul>
                <li>배송 주소로 최대 10개까지 등록할 수 있으며...</li>
                <li>자동 업데이트 제외한 경우...</li>
                <li>기본 배송지는 1개만 저장됩니다...</li>
            </ul>
        </div>

		  <div>
					<input type="hidden" class="form-control" id=userNo name="userNo" value="${userNo}" readonly="readonly">
			</div>
		  
			<div>
				<label> 배송지명 </label>
					<input type="text" class="form-control" id=addName name="addName" placeholder="배송지명을 입력하세요" required>
			</div>
			
			<div>
				<label> 수령인 </label> 
					<input type="text" class="form-control" id="recipient" name="recipient" placeholder="수령인명을 입력하세요" required>
			</div>

			<div>
				<label> 전화번호 </label> 
					<input type="text" class="form-control" id="addPhone" onkeyup="check_phone()" name="addPhone" placeholder="010-0000-0000" required>
			      <span id="checkResultPhone"></span>
			</div>


			<div>
				<label> 신규주소 </label>
					<input type="text" class="form-control" id="sample6_postcode" name="newAddress1" placeholder="우편번호 찾기" onclick="sample6_execDaumPostcode()">
					<input type="text" class="form-control" id="sample6_address"	name="newAddress2" placeholder="주소">
					<!-- <input type="text" class="form-control" id="sample6_detailAddress" name="userAdd3" placeholder="상세주소">  -->
					<input type="text" class="form-control" id="sample6_extraAddress" name="newAddress3" placeholder="상세주소">
			</div>
			
			
        <div class="checkbox">
            <input type="checkbox" id="defaultAddress" name="defaultAddress">
            <label for="defaultAddress">이 배송지를 기본 배송지로 저장</label>
        </div>
        
        

        <div class="buttons">
            <input type="submit" value="등록">
            <input type="button" value="취소">
        </div>
    </form>
</div>
