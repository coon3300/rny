window.onload = function(){
	// 1. 상품번호넣는 배열 빈값 만들기 [] =>    (장바구니번호, 수량, 금액 총 4개 빈배열 만들기)
			let item_Nos = [];
			let cart_Nos = [];
			let quantities = [];
			let item_Prices = [];
			let item_Images = [];
			let item_Names = [];
			// 2. 전체 tr 가져와서 반복문 만들기
			document.querySelectorAll('#cart>tr')
				.forEach(tr => {
					// 3. 반복문안에서 해당 하는 tr에 상품번호, 장바구니번호, 수량, 금액을 가져와서 해당하는 빈배열에 값 너기배열명.push(값)
					// tr 안에서 값 가져오기
					let cartNo = tr.dataset.cartNo;
					let itemNo = tr.dataset.itemNo;
					let itemPrice = tr.dataset.itemPrice;
					let itemName = tr.dataset.itemName;
					let itemImage = tr.dataset.itemImage;
					let quantity = tr.querySelector('#quantity').value;

					// 빈배열에 값 넣기
					if (quantity > 0) {
						cart_Nos.push(cartNo);
						item_Nos.push(itemNo);
						item_Prices.push(itemPrice);
						item_Names.push(itemName);
						item_Images.push(itemImage);
						quantities.push(quantity);
					}
				});
			// 숨겨진 입력 필드에 값 설정
			document.querySelector('#cartForm input[name="cartNos"]').value = cart_Nos.join('/');
			document.querySelector('#cartForm input[name="itemNos"]').value = item_Nos.join('/');
			document.querySelector('#cartForm input[name="quantities"]').value = quantities.join('/');
			document.querySelector('#cartForm input[name="itemPrices"]').value = item_Prices.join('/');
			document.querySelector('#cartForm input[name="itemImages"]').value = item_Images.join('/');
			document.querySelector('#cartForm input[name="itemNames"]').value = item_Names.join('/');
}

document.addEventListener('DOMContentLoaded', function() {
	// 수량 조절 버튼에 대한 이벤트 리스너 추가
	document.querySelectorAll('.btn-minus, .btn-plus').forEach(button => {
		button.addEventListener('click', function(e) {

			const button = e.currentTarget;
			const row = button.closest('tr');
			const quantityInput = row.querySelector('input[type="text"]');
			let quantity = parseInt(quantityInput.value, 10);

			// 상품 가격을 가져옴
			const itemPrice = parseFloat(row.querySelector('td:nth-child(3) p').textContent.replace('원', '').trim());
			// 수량 증가 또는 감소
			if (button.classList.contains('btn-minus')) {
				quantity = quantity - 1; // 수량을 0으로 제한
			} else if (button.classList.contains('btn-plus')) {
				quantity = quantity + 1;
			}
			// 수량 업데이트
			quantityInput.value = quantity;
			// 총액 계산 및 업데이트
			const itemTotal = itemPrice * quantity;
			row.querySelector('td:nth-child(5) p').textContent = itemTotal + ' 원';
			// 전체 합계 업데이트
			updateGrandTotal();
			// 1. 상품번호넣는 배열 빈값 만들기 [] =>    (장바구니번호, 수량, 금액 총 4개 빈배열 만들기)
			let item_Nos = [];
			let cart_Nos = [];
			let quantities = [];
			let item_Prices = [];
			let item_Images = [];
			let item_Names = [];
			// 2. 전체 tr 가져와서 반복문 만들기
			document.querySelectorAll('#cart>tr')
				.forEach(tr => {
					// 3. 반복문안에서 해당 하는 tr에 상품번호, 장바구니번호, 수량, 금액을 가져와서 해당하는 빈배열에 값 너기배열명.push(값)
					// tr 안에서 값 가져오기
					let cartNo = tr.dataset.cartNo;
					let itemNo = tr.dataset.itemNo;
					let itemPrice = tr.dataset.itemPrice;
					let itemName = tr.dataset.itemName;
					let itemImage = tr.dataset.itemImage;
					let quantity = tr.querySelector('#quantity').value;

					// 빈배열에 값 넣기
					if (quantity > 0) {
						cart_Nos.push(cartNo);
						item_Nos.push(itemNo);
						item_Prices.push(itemPrice);
						item_Names.push(itemName);
						item_Images.push(itemImage);
						quantities.push(quantity);
					}
				});
			// 숨겨진 입력 필드에 값 설정
			document.querySelector('#cartForm input[name="cartNos"]').value = cart_Nos.join('/');
			document.querySelector('#cartForm input[name="itemNos"]').value = item_Nos.join('/');
			document.querySelector('#cartForm input[name="quantities"]').value = quantities.join('/');
			document.querySelector('#cartForm input[name="itemPrices"]').value = item_Prices.join('/');
			document.querySelector('#cartForm input[name="itemImages"]').value = item_Images.join('/');
			document.querySelector('#cartForm input[name="itemNames"]').value = item_Names.join('/');
		});
	});

	document.querySelector('#cartForm').addEventListener('submit', function(e) {
		e.preventDefault(); // 기본 제출 방지
		this.submit(); // 폼 제출
	});
});



function updateGrandTotal() {
	let grandTotal = 0;

	// 각 아이템의 총액을 계산하여 grandTotal에 추가
	document.querySelectorAll('tbody tr').forEach(row => {
		const itemTotalText = row.querySelector('td:nth-child(5) p').textContent.replace(' 원', '').trim();
		const itemTotal = parseFloat(itemTotalText) || 0; // NaN이 될 경우 0으로 대체
		grandTotal += itemTotal;
	});

	// 배송비 설정
	const shippingCost = 3000;
	const totalAmount = grandTotal + shippingCost;

	// 소계와 총합 업데이트
	document.querySelector('#grandTotal').textContent = grandTotal + ' 원';
	document.querySelector('.bg-light .py-4.mb-4.border-top.border-bottom.d-flex.justify-content-between p').textContent = totalAmount + ' 원';
}
function remove_proNo(e) {
	if (e.target.tagName == 'I') {

		console.dir(e.target.parentElement.dataset.itemId);
		removeCart(e);
		e.target.parentElement.parentElement.parentElement.remove();
	}
	else if (e.target.tagName == 'BUTTON') {
		console.dir(e.target.dataset.itemId);
		removeCart(e);
		e.target.parentElement.parentElement.remove();
	}
	updateGrandTotal();
}
function removeCart(e) {
	let cartNo = e.target.dataset.cartNo;
	let url = "cartRemove.do?cartNo=" + cartNo;
	fetch(url) // promise객체, then(), catch()
		.then(function(result) {
			console.log(result);
		})
		.catch(function(err) {
			console.error(err);
		})
}
//단건
//document.querySelector('input[name=fullName]').addEventListener('change', function(e) {
	//console.log(this.value);
	//let inputVal = this.value;
	//document.querySelector('input[name=send_fullName]').value = inputVal;
//});
document.querySelectorAll('#orderInfo input').forEach(input => {
	input.addEventListener('change', function() {
		let inputName = input.getAttribute('name');
		let inputVal = this.value;
		console.log(this.value);
		document.querySelector('input[name=send_' + inputName + ']').value = inputVal;
	});
});
document.querySelector('#orderInfo textarea').addEventListener('change', function() {
	console.log(this.value);
	let inputVal = this.value;
	document.querySelector('input[name=send_orderMemo]').value = inputVal;
		
});




