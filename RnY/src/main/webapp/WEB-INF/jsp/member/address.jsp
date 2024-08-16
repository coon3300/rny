<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<Script src='js/address.js'></Script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<div class="container" style="max-width: 600px; margin: auto;">

    
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
