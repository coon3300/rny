<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script>
  function mouseenterHandler() {
    document.getElementById("userId").setAttribute('placeholder', '아이디는 4자 이상, 20자 이하이어야 합니다');
  }
  function mouseleaveHandler() {
	  document.getElementById("userId").setAttribute('placeholder', '');
  }
  function mouseenterHandler1() {
	  document.getElementById("userPw").setAttribute('placeholder', '비밀번호는 6글자 이상, 16글자 이하, !,@,#,$,% 의 특수문자가 포함되어야 합니다');
	}
	function mouseleaveHandler1() {
		document.getElementById("userPw").setAttribute('placeholder', '');
	}
</script>

<script>
		function checkId() {
			let userId = document.getElementById("userId");
			let checkResultSpan = document.getElementById("checkResult");
			
			if (userId.value.length < 4 || userId.value.length > 20) {
				// checkResultSpan.innerHTML = "<font color=pink>아이디는 4자 이상, 20자 이하이어야 합니다</font>";
				window.alert('아이디는 4자 이상, 20자 이하이어야 합니다');
			} else {
				// Fetch API를 사용한 비동기 요청
				fetch("idCheck.do?userId=" + encodeURIComponent(userId.value))
					.then(response => {
						if (!response.ok) {
							throw new Error("Network response was not ok");
						}
						return response.json();
					})
					.then(data => {
						console.log(data);
						// data에서 필요한 값을 확인하는 부분
						if (data.retCode === "Success" && data.retVal === "ok") {
							//checkResultSpan.innerHTML = "<font color=blue>사용 가능</font>";
							window.alert('사용 가능');
						} else {
							//checkResultSpan.innerHTML = "<font color=red>사용 불가</font>";
							window.alert('사용 불가');
						}
					})
					.catch(error => {
						console.error("There was a problem with the fetch operation:", error);
						checkResultSpan.innerHTML = "<font color=red>서버 오류</font>";
					});
			}
		}
</script>


<script>
        function check_pw(){
 
            var pw = document.getElementById('userPw').value;
            var SC = ["!","@","#","$","%"];
            var check_SC = 0;
            let checkpwSpan = document.getElementById("checkpw");
 
            if(pw.length < 6 || pw.length>16){
                window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
                document.getElementById('userPw').value='';
            }
            for(var i=0;i<SC.length;i++){
                if(pw.indexOf(SC[i]) != -1){
                    check_SC = 1;
                }
            }
            if(check_SC == 0){
                window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
                document.getElementById('userPw').value='';
            }
            if(document.getElementById('userPw').value !='' && document.getElementById('userPw2').value!=''){
                if(document.getElementById('userPw').value==document.getElementById('userPw2').value){
                	// window.alert('비밀번호가 일치합니다.')
                	document.getElementById('a').style.display='block'
                	document.getElementById('b').style.display='block'
                }
                else{
                	window.alert('비밀번호가 불일치합니다.')
                }
            }
        }
 </script>
 
 <script>
 function emailCheck(email_address){     
	email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
	if(!email_regex.test(email_address)){ 
		//window.alert('O')
		return false; 
	}else{
		//window.alert('X')
		return true;
	}
 }
		function check_email() {
			var email = document.getElementById('userEmail').value;
			var emailInput = document.getElementById('userEmail');
			//var resultDiv = document.getElementById('result');
			//var email = emailInput.value;
	
			if (emailCheck(email)) {
				window.alert('유효한 이메일 주소입니다.')
				//resultDiv.innerHTML = '유효한 이메일 주소입니다.';
			} else {
				window.alert('유효하지 않은 이메일 주소입니다.')
				//resultDiv.innerHTML = '유효하지 않은 이메일 주소입니다.';
			} 
			if (emailCheck(email)){
				fetch("emailCheck.do?userEmail=" + encodeURIComponent(email))
					.then(response => {
						if (!response.ok) {
							throw new Error("Network response was not ok");
						}
						return response.json();
					})
					.then(data => {
						console.log(data);
						// data에서 필요한 값을 확인하는 부분
						if (data.retCode === "Success" && data.retVal === "ok") {
							//checkResultSpan.innerHTML = "<font color=blue>사용 가능</font>";
							window.alert('사용 가능');
						} else {
							//checkResultSpan.innerHTML = "<font color=red>사용 불가</font>";
							window.alert('사용 불가');
						}
					})
					.catch(error => {
						console.error("There was a problem with the fetch operation:", error);
						checkResultSpan.innerHTML = "<font color=red>서버 오류</font>";
					});
			}
		} 
</script>
 
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

<div class="container" style="max-width: 600px; margin: auto;">

	
	<form  action="addMember.do" name="join" >
			<div class="py-5 text-center">
				<h1>회원가입</h1>
				<h1>─────</h1>
			  	</div>
			  	  <div>
							<div class="col-sm-12"  onmouseenter="mouseenterHandler()" onmouseleave="mouseleaveHandler()">
    						<label class="form-label"> ID </label>
    							<div style="display: flex;" id="id">
        						<input type="text" class="form-control" id="userId" name="userId" placeholder="" value="" required>
        						<span id="checkResult"></span>
       						  <button class="col-sm-2" type="button" onclick="checkId()">중복확인</button>
   							  </div>&nbsp;
							</div>

							<div class="col-sm-12" onmouseenter="mouseenterHandler1()" onmouseleave="mouseleaveHandler1()">
								<label class="form-label"> PASSWORD </label>
							<div style="display: flex;" >
									<input type="password" class="form-control" id="userPw" onchange="check_pw()" name="userPw" placeholder="" required>
									<svg id="a" xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="blue" class="bi bi-patch-check" viewBox="0 0 16 16" style="display: none;">
  								<path fill-rule="evenodd" d="M10.354 6.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7 8.793l2.646-2.647a.5.5 0 0 1 .708 0"/>
  								<path d="m10.273 2.513-.921-.944.715-.698.622.637.89-.011a2.89 2.89 0 0 1 2.924 2.924l-.01.89.636.622a2.89 2.89 0 0 1 0 4.134l-.637.622.011.89a2.89 2.89 0 0 1-2.924 2.924l-.89-.01-.622.636a2.89 2.89 0 0 1-4.134 0l-.622-.637-.89.011a2.89 2.89 0 0 1-2.924-2.924l.01-.89-.636-.622a2.89 2.89 0 0 1 0-4.134l.637-.622-.011-.89a2.89 2.89 0 0 1 2.924-2.924l.89.01.622-.636a2.89 2.89 0 0 1 4.134 0l-.715.698a1.89 1.89 0 0 0-2.704 0l-.92.944-1.32-.016a1.89 1.89 0 0 0-1.911 1.912l.016 1.318-.944.921a1.89 1.89 0 0 0 0 2.704l.944.92-.016 1.32a1.89 1.89 0 0 0 1.912 1.911l1.318-.016.921.944a1.89 1.89 0 0 0 2.704 0l.92-.944 1.32.016a1.89 1.89 0 0 0 1.911-1.912l-.016-1.318.944-.921a1.89 1.89 0 0 0 0-2.704l-.944-.92.016-1.32a1.89 1.89 0 0 0-1.912-1.911z"/>
									</svg>
							</div></div>&nbsp;
							
							<div class="col-sm-12" >
								<label class="form-label"> PASSWORD 확인 </label>
								<div style="display: flex;" >
									<input type="password" class="form-control" id="userPw2" onchange="check_pw()" name="userPw2" placeholder="" required>&nbsp;
									<svg id="b" xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="blue" class="bi bi-patch-check" viewBox="0 0 16 16" style="display: none">
 								  <path fill-rule="evenodd" d="M10.354 6.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7 8.793l2.646-2.647a.5.5 0 0 1 .708 0"/>
  								<path d="m10.273 2.513-.921-.944.715-.698.622.637.89-.011a2.89 2.89 0 0 1 2.924 2.924l-.01.89.636.622a2.89 2.89 0 0 1 0 4.134l-.637.622.011.89a2.89 2.89 0 0 1-2.924 2.924l-.89-.01-.622.636a2.89 2.89 0 0 1-4.134 0l-.622-.637-.89.011a2.89 2.89 0 0 1-2.924-2.924l.01-.89-.636-.622a2.89 2.89 0 0 1 0-4.134l.637-.622-.011-.89a2.89 2.89 0 0 1 2.924-2.924l.89.01.622-.636a2.89 2.89 0 0 1 4.134 0l-.715.698a1.89 1.89 0 0 0-2.704 0l-.92.944-1.32-.016a1.89 1.89 0 0 0-1.911 1.912l.016 1.318-.944.921a1.89 1.89 0 0 0 0 2.704l.944.92-.016 1.32a1.89 1.89 0 0 0 1.912 1.911l1.318-.016.921.944a1.89 1.89 0 0 0 2.704 0l.92-.944 1.32.016a1.89 1.89 0 0 0 1.911-1.912l-.016-1.318.944-.921a1.89 1.89 0 0 0 0-2.704l-.944-.92.016-1.32a1.89 1.89 0 0 0-1.912-1.911z"/>
								  </svg>
							</div></div>&nbsp;
							
							<div class="col-sm-12">
								<label class="form-label"> 이름 </label>
									<input type="text" class="form-control" id="userName" name="userName" required>&nbsp;
							</div>
							
							<div class="col-sm-12">
								<label class="form-label"> 닉네임 </label>
									<input type="text" class="form-control" id="userNick"  name="userNick" required>&nbsp;
							</div>
							
							<div class="col-sm-12">
								<label class="form-label"> 생년월일 </label>
									<input type="text" class="form-control" id="userBirth" name="userBirth" placeholder="1995-11-10" required>&nbsp;
							</div>
							
							<div class="col-sm-12">
								<label class="form-label"> 이메일 </label>
									<input type="text" class="form-control" id="userEmail" name="userEmail" onchange="check_email()" placeholder="abc@naver.com" required>&nbsp;
							</div>
							
							<div class="col-sm-12">
								<label class="form-label"> 전화번호 </label>
									<input type="text" class="form-control" id="userPhone" name="userPhone" placeholder="010-0000-0000" required>&nbsp;
							</div>
							
								<div class="col-sm-12">
								<label class="form-label"> 주소 </label>
								<div style="display: flex;">
								  <input type="text" class="form-control" id="sample6_postcode" name="userAdd1" placeholder="우편번호" required>&nbsp;
								  <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">&nbsp;
							  </div>&nbsp;
								  <input type="text" class="form-control" id="sample6_address" name="userAdd2" placeholder="주소">&nbsp;
								  <input type="text" class="form-control" id="sample6_detailAddress" name="userAdd3" placeholder="상세주소">&nbsp;
								  <input type="text" class="form-control" id="sample6_extraAddress" name="userAdd4" placeholder="참고항목">&nbsp;
									<!-- <input type="text" class="form-control" id="userAdd" name="userAdd" required>&nbsp; -->
							</div>

            <div>
						<button class="w-100 btn btn-primary btn-lg" type="submit"> 회원가입 </button>
						</div>
						</div>
						</form>
					</div>	
	
	
	
	
	
	