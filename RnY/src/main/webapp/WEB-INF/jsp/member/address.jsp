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

<div class="container">
    <h1>Shipping Register</h1>
    <form>
        <div class="notice">
            <p>배송 주소록 유의사항</p>
            <ul>
                <li>배송 주소로 최대 10개까지 등록할 수 있으며...</li>
                <li>자동 업데이트 제외한 경우...</li>
                <li>기본 배송지는 1개만 저장됩니다...</li>
            </ul>
        </div>

        <label for="name">성명</label>
        <input type="text" id="name" name="name">

        <label for="postcode">우편번호</label>
        <input type="text" id="postcode" name="postcode">
        <input type="button" value="주소검색">

        <label for="address">주소</label>
        <input type="text" id="address" name="address">
        <input type="text" id="detailAddress" name="detailAddress">

        <label for="phone">일반전화</label>
        <select name="phone1" id="phone1">
            <option value="02">02</option>
            <!-- Other options -->
        </select>
        <input type="tel" id="phone2" name="phone2">
        <input type="tel" id="phone3" name="phone3">

        <label for="mobile">휴대전화</label>
        <select name="mobile1" id="mobile1">
            <option value="010">010</option>
            <!-- Other options -->
        </select>
        <input type="tel" id="mobile2" name="mobile2">
        <input type="tel" id="mobile3" name="mobile3">

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
