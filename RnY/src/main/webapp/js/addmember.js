/**
 * 
 */

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


//아이디 중복체크
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



// 비밀번호 확인
/*        function check_pw(){
 
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
        }*/
        
function check_pw() {
	var userPw = document.getElementById('userPw').value;
	var userPw2 = document.getElementById('userPw2').value;
	var resultDiv = document.getElementById('result');

	var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,16}$/;

	if (passwordRegex.test(userPw)) {
		if (userPw === userPw2) {
			resultDiv.innerHTML = '비밀번호가 일치하며 유효합니다.';
			resultDiv.style.color = 'green';
		}else{
			resultDiv.innerHTML = '비밀번호가 일치하지 않습니다.';
			resultDiv.style.color = 'red';
		}
	}else{
		resultDiv.innerHTML = '비밀번호는 최소 8자에서 16자까지, 영문자, 숫자 및 특수 문자를 포함해야 합니다.';
		resultDiv.style.color = 'red';
	}
}        

 
// 이메일 중복확인
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

		


