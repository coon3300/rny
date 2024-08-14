<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
/* 컨테이너 */
.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
    font-family: Arial, sans-serif;
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
    <div class="title-section">
        <h1>SHIPPING ADDRESS</h1>
        <p>배송주소록 관리</p>
    </div>

    <div class="notice-box">
        <p>배송주소록 유의사항</p>
        <ul>
            <li>배송 주소로 최대 10개까지 등록할 수 있으며...</li>
            <li>자동 업데이트 제외한 경우...</li>
            <li>기본 배송지는 1개만 저장됩니다...</li>
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
        <tbody>
        <c:forEach var="add" items="${addList}">
            <tr>
                <td><input name="mainAddr" type="radio" ${add.isMainAdd == 'Y' ? 'checked' : '' }></td>
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