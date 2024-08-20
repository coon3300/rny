/**
 * 아이디 체크
 */
function check_id() {
    let userId = document.getElementById("userId");
    let checkResultID = document.getElementById("checkResultID");
    let regex = /^[a-zA-Z0-9]+$/; // 영문자와 숫자만 허용하는 정규식

    // ID 길이 확인
    if (userId.value.length < 4 || userId.value.length > 16) {
        checkResultID.innerHTML = "<font color='red'>아이디는 4자 이상, 16자 이하 영문자와 숫자만 사용할 수 있습니다</font>";
    }
    // 정규식 검사를 통과하지 못할 경우
    else if (!regex.test(userId.value)) {
        checkResultID.innerHTML = "<font color='red'>아이디는 4자 이상, 16자 이하 영문자와 숫자만 사용할 수 있습니다</font>";
    }
    // 모든 조건이 맞을 경우 서버에 요청
    else {
        fetch("idCheck.do?userId=" + encodeURIComponent(userId.value))
            .then(response => {
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                return response.json();
            })
            .then(data => {
                if (data.retCode === "Success" && data.retVal === "ok") {
                    checkResultID.innerHTML = '사용 가능한 ID입니다.';
                    checkResultID.style.color = 'green';
                } else {
                    checkResultID.innerHTML = '중복된 ID가 존재합니다';
                    checkResultID.style.color = 'red';
                }
            })
            .catch(error => {
                console.error("There was a problem with the fetch operation:", error);
                checkResultID.innerHTML = "<font color='red'>서버 오류</font>";
            });
    }
    checkFormValidity();
}

/**
 * 비밀번호 체크
 */
function check_pw() {
    var userPw = document.getElementById('userPw').value;
    var checkResultPW = document.getElementById('checkResultPW');
    var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~`!@#$%^&*()_\-+={}[\]|:;"'<>,.?\/]).{8,16}$/;
    var whitespaceRegex = /\s/;
    var sequentialRegex = /(.)\1\1/;
    var repeatedCharRegex = /(.+)\1+/;

    // 조건 체크
    if (whitespaceRegex.test(userPw)) {
        checkResultPW.innerHTML = '비밀번호에는 공백을 포함할 수 없습니다.';
        checkResultPW.style.color = 'red';
    } else if (sequentialRegex.test(userPw)) {
        checkResultPW.innerHTML = '비밀번호에 연속된 문자나 숫자를 사용할 수 없습니다.';
        checkResultPW.style.color = 'red';
    } else if (repeatedCharRegex.test(userPw)) {
        checkResultPW.innerHTML = '비밀번호에 동일한 문자나 숫자를 반복해서 사용할 수 없습니다.';
        checkResultPW.style.color = 'red';
    } else if (!passwordRegex.test(userPw)) {
        checkResultPW.innerHTML = '비밀번호는 최소 8자에서 16자까지, 영문자, 숫자 및 특수 문자를 포함해야 합니다.';
        checkResultPW.style.color = 'red';
    } else {
        checkResultPW.innerHTML = '비밀번호가 유효합니다.';
        checkResultPW.style.color = 'green';
    }

    checkFormValidity();
}

/**
 * 비밀번호 확인
 */
function check_pw2() {
    var userPw = document.getElementById('userPw').value;
    var userPw2 = document.getElementById('userPw2').value;
    var checkResultPW2 = document.getElementById('checkResultPW2');

    if (userPw === userPw2) {
        checkResultPW2.innerHTML = '비밀번호가 일치하며 유효합니다.';
        checkResultPW2.style.color = 'green';
    } else {
        checkResultPW2.innerHTML = '비밀번호가 일치하지 않습니다.';
        checkResultPW2.style.color = 'red';
    }
    checkFormValidity();
}

/**
 * 툴팁 표시
 */
function showTooltip() {
    document.getElementById("tooltipBox").style.display = "block";
}

/**
 * 툴팁 숨기기
 */
function hideTooltip() {
    document.getElementById("tooltipBox").style.display = "none";
}

/**
 * 생일 체크
 */
function check_birth() {
    var userBirth = document.getElementById('userBirth').value;
    var checkResultBirth = document.getElementById('checkResultBirth');
    var birthDateRegex = /^(19|20)\d{2}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])$/;

    // 생년월일이 정규식 조건에 맞지 않을 경우 경고 메시지를 표시
    if (!birthDateRegex.test(userBirth)) {
        checkResultBirth.innerHTML = '생년월일은 YYYY-MM-DD 형식이어야 합니다.';
        checkResultBirth.style.color = 'red';
    } else {
        checkResultBirth.innerHTML = '생년월일이 유효합니다.';
        checkResultBirth.style.color = 'green';
    }
    checkFormValidity();
}

/**
 * 이메일 중복 확인
 */
function emailCheck(email_address) {
    email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
    return email_regex.test(email_address);
}

function check_email() {
    var email = document.getElementById('userEmail').value;
    var checkResultEMAIL = document.getElementById('checkResultEMAIL');

    if (emailCheck(email)) {
        checkResultEMAIL.innerHTML = '유효한 이메일 주소입니다.';
        checkResultEMAIL.style.color = 'green';
    } else {
        checkResultEMAIL.innerHTML = '유효하지 않은 이메일 주소입니다.';
        checkResultEMAIL.style.color = 'red';
    }

    if (emailCheck(email)) {
        fetch("emailCheck.do?userEmail=" + encodeURIComponent(email))
            .then(response => {
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                return response.json();
            })
            .then(data => {
                // data에서 필요한 값을 확인하는 부분
                if (data.retCode === "Success" && data.retVal === "ok") {
                    checkResultEMAIL.innerHTML = '등록가능한 이메일 입니다.';
                    checkResultEMAIL.style.color = 'green';
                } else {
                    checkResultEMAIL.innerHTML = '이미 등록된 이메일 입니다.';
                    checkResultEMAIL.style.color = 'red';
                }
            })
            .catch(error => {
                console.error("There was a problem with the fetch operation:", error);
                checkResultEMAIL.innerHTML = "<font color=red>서버 오류</font>";
            });
    }
    checkFormValidity();
}

/**
 * 전화번호 체크
 */
function check_phone() {
    var userPhone = document.getElementById('userPhone').value;
    var checkResultPhone = document.getElementById('checkResultPhone');
    var phoneRegex = /^01[0-9]-\d{4}-\d{4}$/; // 010-0000-0000 형식의 정규식

    // 전화번호가 정규식 조건에 맞지 않을 경우 경고 메시지를 표시
    if (!phoneRegex.test(userPhone)) {
        checkResultPhone.innerHTML = '전화번호는 010-0000-0000 형식이어야 합니다.';
        checkResultPhone.style.color = 'red';
    } else {
        checkResultPhone.innerHTML = '전화번호가 유효합니다.';
        checkResultPhone.style.color = 'green';
    }
    checkFormValidity();
}

/**
 * 주소 API
 */
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            if (data.userSelectedType === 'R') {
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if (extraAddr !== '') {
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("sample6_extraAddress").value = extraAddr;

            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            document.getElementById("sample6_extraAddress").focus();
        }
    }).open();
}

/**
 * 체크박스 전체 선택/해제
 */
function toggleCheckboxes(selectAll) {
    const checkboxes = document.querySelectorAll('.term-checkbox');
    checkboxes.forEach(checkbox => checkbox.checked = selectAll.checked);
    checkFormValidity(); // 체크박스 상태 변경 후 폼 유효성 체크
}

/**
 * 개별 체크박스 선택 시 모두 동의 체크박스 상태 업데이트
 */
document.querySelectorAll('.term-checkbox').forEach(checkbox => {
    checkbox.addEventListener('change', () => {
        const selectAll = document.getElementById('selectAll');
        const allChecked = Array.from(document.querySelectorAll('.term-checkbox')).every(cb => cb.checked);
        selectAll.checked = allChecked;
        checkFormValidity(); // 체크박스 상태 변경 후 폼 유효성 체크
    });
});

/**
 * 제출 버튼 활성화/비활성화 관리
 */
function checkFormValidity() {
    var idValid = document.getElementById('checkResultID').style.color === 'green';
    var pwValid = document.getElementById('checkResultPW').style.color === 'green';
    var pw2Valid = document.getElementById('checkResultPW2').style.color === 'green';
    var birthValid = document.getElementById('checkResultBirth').style.color === 'green';
    var emailValid = document.getElementById('checkResultEMAIL').style.color === 'green';
    var phoneValid = document.getElementById('checkResultPhone').style.color === 'green';

    var submitBtn = document.getElementById('submitBtn');
    var allTermsChecked = Array.from(document.querySelectorAll('.term-checkbox')).every(cb => cb.checked);

    if (idValid && pwValid && pw2Valid && birthValid && emailValid && phoneValid && allTermsChecked) {
        submitBtn.disabled = false;
        submitBtn.classList.add('enabled'); // 활성화된 상태의 클래스 추가
        document.getElementById('successMessage').innerHTML = '';
    } else {
        submitBtn.disabled = true;
        submitBtn.classList.remove('enabled'); // 비활성화된 상태의 클래스 제거
        document.getElementById('successMessage').innerHTML = '모든 필드를 올바르게 입력하세요.';
        document.getElementById('successMessage').style.color = 'red';
        document.getElementById('successMessage').style.textAlign = 'center';
    }
}

/**
 * 제출 버튼 클릭 시 처리
 */
function submitForm() {
    if (!document.getElementById('submitBtn').disabled) {
        alert('회원가입 완료');
    } else {
        document.getElementById('successMessage').style.display = 'block';
    }
}
