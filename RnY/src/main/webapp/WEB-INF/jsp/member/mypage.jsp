<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
    margin: 20px 0; /* 위아래에 간격 추가 */
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
    width: 70px;
    margin: 10px auto;
}

.myshop-container {
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
}

.myshop-nav {
    display: flex;
    justify-content: center;
    gap: 40px;
    margin-bottom: 30px;
    margin-top: 30px;
}

.icon-item {
    text-align: center;
    width: 100px;
}

.icon {
    font-size: 30px;
    margin-bottom: 10px;
}

.icon-item p {
    font-size: 14px;
    line-height: 1.5;
}

.point-info {
    display: flex;
    gap: 20px;
    width: 100%;
}

.point-summary, .point-details {
    width: 50%;
    border: 1px solid #ddd;
    padding: 20px;
    border-radius: 8px;
    background-color: #f9f9f9;
}

.point-summary h2, .point-details h2 {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
}

.point-summary table {
    width: 100%;
    border-collapse: collapse;
}

.point-summary th, .point-summary td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
    text-align: left;
}

.point-summary th {
    background-color: #f1f1f1;
    font-weight: bold;
}

.point-summary td button {
    padding: 5px 10px;
    background-color: #009688;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.point-summary td button:hover {
    background-color: #00796b;
}

.point-details p {
    font-size: 16px;
    color: #666;
    margin-bottom: 10px;
}

.order-status {
    display: flex;
    justify-content: space-around;
    padding: 10px 0;
    background-color: #f1f1f1;
    border-radius: 4px;
    font-weight: bold;
}

.order-status li {
    text-align: center;
}

.footer-icons {
    display: flex;
    justify-content: space-between;
    text-align: center;
    margin-top: 20px;
}

.footer-icons .icon-item {
    width: 30%;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    background-color: #fff;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}
</style>

<div class="myshop-container">
    <h1>MYSHOP</h1>
    <hr class="custom-hr">

    <div class="divider">
        <div class="line-with-diamond"></div>
        <div class="myshop-nav">
            <div class="icon-item">
                <a href="#" style="text-decoration: none; color: inherit;">
                    <div class="icon">🛒</div>
                    <p>마이쇼핑</p>
                </a>
            </div>
            <div class="icon-item">
                <a href="updateuserform.do" style="text-decoration: none; color: inherit;">
                    <div class="icon">🔧</div>
                    <p>MODIFY<br>정보수정</p>
                </a>
            </div>
            <div class="icon-item">
                <a href="myaddress.do" style="text-decoration: none; color: inherit;">
                    <div class="icon">🏠</div>
                    <p>ADDRESS<br>주소록</p>
                </a>
            </div>
        </div>
        <div class="line-with-diamond"></div>
    </div>

    <section class="myshop-content">
        <div class="point-info">
            <div class="point-summary">
                <h2>목록</h2>
                <table>
                    <tr>
                        <th>항목</th>
                        <th></th>
                    </tr>
                    <tr>
                        <td>공지사항</td>
                        <td><button>조회</button></td>
                    </tr>
                    <tr>
                        <td>나의 O&A</td>
                        <td><button>조회</button></td>
                    </tr>
                    <tr>
                        <td>나의 리뷰</td>
                        <td><button>조회</button></td>
                    </tr>
                </table>
            </div>
            <div class="point-details">
                <h2>적립금 안내</h2>
                <p>주문으로 발생한 적립금은 배송 완료 후 7일 부터 실제 사용 가능한 적립금으로 전환됩니다.</p>
                <p>적립금은 사용여부에 따라 주문취소/반품 시 환원됩니다.</p>
                <p>미가용 적립금은 환불된 적립금으로, 사용 가능한 적립금으로 전환되기까지 상품구매에 사용하실 수 없습니다.</p>
                <p>가용 적립금(총적립금-사용적립금-미가용적립금)은 상품구매 시 바로 사용 가능합니다.</p>
                <h3>나의 주문처리 현황 (최근 3개월 기준)</h3>
                <ul class="order-status">
                    <li>입금전 <span>0</span></li>
                    <li>배송준비중 <span>0</span></li>
                    <li>배송중 <span>0</span></li>
                    <li>배송완료 <span>0</span></li>
                </ul>
            </div>
        </div>
    </section>

<div class="footer-icons">
    <div class="icon-item">
        <div class="icon">🕒</div>
        <p>
            ORDER<br>고객님께서 주문하신 상품의 주문내역을 확인하실 수 있습니다.
        </p>
    </div>
    <div class="icon-item">
        <div class="icon">❤️</div>
        <p>
            WISHLIST<br>관심상품으로 등록하신 상품내역을 보여드립니다.
        </p>
    </div>
    <div class="icon-item">
        <div class="icon">🛒</div>
        <p>
            CART<br>장바구니에 담긴 상품을 확인하고 관리하실 수 있습니다.
        </p>
    </div>
</div>
</div>