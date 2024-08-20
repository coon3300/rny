<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

.container {
    max-width: 1200px;
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
    width: 200px;
    margin: 10px auto;
}



/* 제목 섹션 */
.title-section {
    text-align: center;
    margin-bottom: 40px;
}

.title-section h1 {
    font-size: 36px;
    font-weight: bold;
    margin-bottom: 10px;
}

.title-section p {
    font-size: 16px;
    color: #555;
}

/* 유의사항 박스 */
.notice-box {
    background-color: #f9f9f9;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 4px;
    margin-bottom: 20px;
}

.notice-box p {
    margin: 0;
    font-weight: bold;
    font-size: 16px;
    margin-bottom: 10px;
}

.notice-box ul {
    margin: 0;
    padding-left: 20px;
    font-size: 14px;
    color: #555;
}

.notice-box ul li {
    list-style-type: decimal;
}

/* 테이블 스타일 */
.address-table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

.address-table thead {
    background-color: #f2f2f2;
}

.address-table th, .address-table td {
    padding: 15px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

.address-table th {
    font-weight: bold;
}

.address-table td {
    font-size: 14px;
}

.address-table td input[type="checkbox"] {
    cursor: pointer;
}

.address-table td .btn-edit {
    background-color: #ddd;
    border: none;
    padding: 8px 12px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
}

/* 버튼 섹션 */
.button-section {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.button-section .btn-delete, 
.button-section .btn-add {
    background-color: #333;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
}

.btn-delete{
    background-color: #333;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
}

.btn-delete {
    background-color: #ff4d4d;
}

.button-section .btn-add {
    background-color: #00cc66;
}
</style>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
    <h1>Shipping Register</h1>
       <hr class="custom-hr">

	<div class="divider">
    	 <div class="line-with-diamond"></div>
   		 <span class="divider-text">배송 주소록 관리</span>
   		 <div class="line-with-diamond"></div>
	</div>
	
        <div class="notice">
            <p>배송 주소록 유의사항</p>
            <ul>
                <li>기본 배송지는 1개만 저장됩니다.</li>
            </ul>
        </div>

    <table class="address-table">
        <thead>
            <tr>
                <th>기본</th>
                <th>배송지명</th>
                <th>수령인</th>
                <th>휴대전화</th>
                <th>주소</th>
                <th>수정</th>
            </tr>
        </thead>
        <tbody class="main-add">
        <c:forEach var="add" items="${addList}">
            <tr data-main-add='${add.mainAdd }'>
                <td><input onchange="changeMainAdd('${add.mainAdd }')" name="mainAddr" type="radio" ${add.isMainAdd == 'Y' ? 'checked' : '' }></td>
								<td>${add.addName }</td>
								<td>${add.recipient }</td>
								<td>${add.addPhone }</td>
								<td>${add.newAddress }</td>
                <td>
                <a href="adddelete.do?mainAdd=${add.mainAdd}" class="btn-delete" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
								</td>
            </tr>
           </c:forEach>
        </tbody>
    </table>

    <div class="button-section">
    <a href="addressform.do" class="btn-add">배송지 등록</a>
</div>
</div>

<!-- <script>
  function changeMainAdd(mainAdd) {
	 console.log(document.querySelectorAll('.main-add tr td input:checked')[0].dataset.mainAdd);
	 let targetAdd = document.querySelectorAll('.main-add tr td input:checked')[0].dataset.mainAdd;
	  if(!confirm('변경하겠습니까?')) {
		  document.querySelector('tr[data-main-add="'+targetAdd+'"] input').checked = true;
		  location.reload();
		  return;
	  }
	  console.log(mainAdd)
	  // 사용자번호, 메인주소.
	  fetch('addupdate.do?mainAdd='+mainAdd+'&userNo=${userNo}')
	  .then(result=>result.json())
	  .then(result=>{
		  console.log(result)
	  })
	  .catch(err=>console.log(err))
  }
</script> -->

<script>
function changeMainAdd(mainAdd) {
    let targetAdd = document.querySelector('input[name="mainAddr"]:checked').dataset.mainAdd;
    if (!confirm("기본 주소지를 변경하시겠습니까?")) {
        // 변경 취소 시, 이전 상태로 되돌림
        document.querySelector(`tr[data-main-add="${targetAdd}"] input`).checked = true;
        return;
    }
    fetch(`addupdate.do?mainAdd=${mainAdd}&userNo=${userNo}`)
        .then(response => response.json())
        .then(result => {
            if (result.success) {
                alert("기본 주소지가 변경되었습니다.");
                location.reload();
            } else {
                alert("기본 주소지 변경에 실패했습니다.");
            }
        })
        .catch(error => console.error('Error:', error));
}

function deleteAddress(event, isMainAdd, mainAdd) {
    event.preventDefault(); // 기본 동작 막기

    if (isMainAdd === 'Y') {
        alert("기본 주소지는 삭제할 수 없습니다.");
        return;
    }

    if (confirm("정말로 삭제하시겠습니까?")) {
        fetch(`adddelete.do?mainAdd=${mainAdd}`)
            .then(response => response.json())
            .then(result => {
                if (result.success) {
                    alert("주소가 삭제되었습니다.");
                    location.reload();
                } else {
                    alert("주소 삭제에 실패했습니다.");
                }
            })
            .catch(error => console.error('Error:', error));
    }
}
</script>