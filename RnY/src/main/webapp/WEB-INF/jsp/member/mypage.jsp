<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f8f8;
	margin: 0;
	padding: 0;
}

.myshop-container {
	width: 100%;
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
}

.myshop-header {
	text-align: center;
	margin-bottom: 30px;
}

.myshop-header h1 {
	font-size: 36px;
	font-weight: bold;
}

.myshop-nav ul {
	list-style: none;
	padding: 0;
	display: flex;
	justify-content: center;
	gap: 20px;
}

.myshop-nav ul li {
	font-size: 18px;
}

.myshop-nav ul li a {
	text-decoration: none;
	color: #333;
}

.myshop-content {
	display: flex;
	justify-content: space-between;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 8px;
}

.point-info {
	display: flex;
	width: 100%;
}

.point-summary, .point-details {
	width: 50%;
}

.point-summary h2, .point-details h2 {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
}

.point-summary ul {
	list-style: none;
	padding: 0;
}

.point-summary ul li {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
	font-size: 18px;
}

.point-summary ul li span {
	color: #009688;
}

.point-summary ul li button {
	padding: 5px 10px;
	background-color: #009688;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
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

.myshop-footer {
	margin-top: 40px;
}

.footer-icons {
	display: flex;
	justify-content: space-between;
	text-align: center;
	border-top: 1px solid #ddd;
	padding-top: 20px;
}

.icon-item {
	width: 23%;
}

.icon {
	font-size: 30px;
	margin-bottom: 10px;
}

.icon-item p {
	font-size: 14px;
	line-height: 1.5;
}
</style>

<div class="myshop-container">
	<header class="myshop-header">
		<h1>MYSHOP</h1>
		<div class="myshop-nav">
			<ul>
				<li><a href="#">마이쇼핑</a></li>
				<li><a href="updateuserform.do">정보변경</a></li>
				<li><a href="#">장바구니</a></li>
			</ul>
		</div>
	</header>

	<section class="myshop-content">
		<div class="point-info">
			<div class="point-summary">
				<h2>적립금 목록</h2>
				<table class="point-table">
					<tr>
						<th>항목</th>
						<th>금액/수량</th>
						<th></th>
					</tr>
					<tr>
						<td>가용 적립금</td>
						<td>2,000원</td>
						<td><button>조회</button></td>
					</tr>
					<tr>
						<td>총 적립금</td>
						<td>2,000원</td>
						<td><button>조회</button></td>
					</tr>
					<tr>
						<td>사용적립금</td>
						<td>0원</td>
						<td><button>조회</button></td>
					</tr>
					<tr>
						<td>총주문</td>
						<td>0원 / 0회</td>
						<td><button>조회</button></td>
					</tr>
					<tr>
						<td>쿠폰</td>
						<td>0개</td>
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

	<footer class="myshop-footer">
		<div class="footer-icons">
			<div class="icon-item">
				<div class="icon">🕒</div>
				<p>
					ORDER<br>고객님께서 주문하신 상품의 주문내역을 확인하실 수 있습니다.
				</p>
			</div>
			<div class="icon-item">
				<div class="icon">🎟</div>
				<p>
					COUPON<br>고객님이 보유하고 계신 쿠폰내역을 보여드립니다.
				</p>
			</div>


			<div class="icon-item">
				<a href="myaddress.do" style="text-decoration: none; color: inherit;">
					<div class="icon">🏠</div>
					<p> ADDRESS<br>자주 사용하는 배송지를 등록하고 관리하실 수 있습니다. </p>
				</a>
			</div>

			<div class="icon-item">
				<div class="icon">❤️</div>
				<p>
					WISHLIST<br>관심상품으로 등록하신 상품내역을 보여드립니다.
				</p>
			</div>
		</div>
	</footer>
</div>