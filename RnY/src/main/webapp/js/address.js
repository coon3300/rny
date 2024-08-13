/**
 * 
 */

// 전화번호
function check_phone() {
	var addPhone = document.getElementById('addPhone').value;
	var checkResultPhone = document.getElementById('checkResultPhone');
	var phoneRegex = /^01[0-9]-\d{4}-\d{4}$/; // 010-0000-0000 형식의 정규식

	// 전화번호가 정규식 조건에 맞지 않을 경우 경고 메시지를 표시
	if (!phoneRegex.test(addPhone)) {
		checkResultPhone.innerHTML = '전화번호는 010-0000-0000 형식이어야 합니다.';
		checkResultPhone.style.color = 'red';
	} else {
		checkResultPhone.innerHTML = '전화번호가 유효합니다.';
		checkResultPhone.style.color = 'green';
	}
	checkFormValidity();
}


// 주소API
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
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== '') {
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
			document.getElementById("sample6_extraAddress").focus();
		}
	}).open();
}

// 전체 유효형 체크
function checkFormValidity() {
	var phoneValid = document.getElementById('checkResultPhone').style.color === 'green';

	var submitBtn = document.getElementById('submitBtn');

	if (birthValid) {
		submitBtn.disabled = false;
		submitBtn.removeAttribute('disabled');
		document.getElementById('successMessage').innerHTML = '';
	} else {
		submitBtn.disabled = true;
		document.getElementById('successMessage').innerHTML = '모든 필드를 올바르게 입력하세요.';
		document.getElementById('successMessage').style.color = 'red';
		document.getElementById('successMessage').style.textAlign = 'center';
	}
}

function submitForm() {
	if (document.getElementById('submitBtn').disabled) {
		document.getElementById('successMessage').style = 'block';
	} else {
		document.getElementById('successMessage');
		alert('주소등록 완료');
	}
}



