document.addEventListener('DOMContentLoaded', function() {
    // 수량 조절 버튼에 대한 이벤트 리스너 추가
    document.querySelectorAll('.decrease, .increase').forEach(button => {
        button.addEventListener('click', function(e) {
            const button = e.currentTarget;
            const row = button.closest('tr');
            const quantityInput = row.querySelector('.quantity-amount');
            let quantity = parseInt(quantityInput.value, 10);
            
            // 상품가격을 가져옴
            const itemPrice = parseFloat(row.querySelector('td:nth-child(3)').textContent.replace('원', '').trim());
            
            // 수량 증가 또는 감소
            if (button.classList.contains('increase')) {
                quantity + 1; // 수량을 1씩 증가
            } else if (button.classList.contains('decrease')) {
                quantity = Math.max(1, quantity); // 수량을 1 이상으로 감소
            }
            
            // 수량 업데이트
            quantityInput.value = quantity;
            
            // 총액 계산 및 업데이트
            const itemTotal = itemPrice * quantity;
            row.querySelector('td:nth-child(5)').textContent = itemTotal + '원';
            
            // 전체 합계 업데이트
            updateGrandTotal();
        });
    });
    
    function updateGrandTotal() {
        let grandTotal = 0;
        document.querySelectorAll('tbody tr').forEach(row => {
            const itemTotal = parseFloat(row.querySelector('td:nth-child(5)').textContent.replace('원', '').trim());
            grandTotal += itemTotal;
        });

        // 예상 구매 금액을 정수로 업데이트 (단위는 JSP에서 추가됨)
        document.getElementById('grandTotalDisplay').textContent = Math.round(grandTotal);
    }
    
 
   // 초기 데이터 설정
    const item_No = []; // 예시
    const item_Names = []; // 예시
    const item_Prices = []; // 예시
    const quantities = []; // 예시
    const userNo = ''; // 예시
    const grandTotal = ''; // 예시
    const shippingCost = ''; // 예시
    const totalAmount = ''; // 예시

    // 배열의 각 요소를 '/'로 구분하여 문자열로 변환
    document.querySelector('#cartForm input[name="itemNo"]').value = item_No.join('/');
    document.querySelector('#cartForm input[name="itemName"]').value = item_Names.join('/');
    document.querySelector('#cartForm input[name="itemPrice"]').value = item_Prices.join('/');
    document.querySelector('#cartForm input[name="quantity"]').value = quantities.join('/');

    // 값이 없으면 빈 문자열로 초기화
    document.querySelector('#cartForm input[name="userNo"]').value = userNo || '';
    document.querySelector('#cartForm input[name="grandTotal"]').value = grandTotal || '';
    document.querySelector('#cartForm input[name="shippingCost"]').value = shippingCost || '';
    document.querySelector('#cartForm input[name="totalAmount"]').value = totalAmount || '';

    // 확인용 출력
    console.log('itemNos:', item_No.join('/'));
    console.log('itemNames:', item_Names.join('/'));
    console.log('itemPrices:', item_Prices.join('/'));
    console.log('quantities:', quantities.join('/'));
    console.log('userNo:', userNo);
    console.log('grandTotal:', grandTotal);
    console.log('shippingCost:', shippingCost);
    console.log('totalAmount:', totalAmount);
});

document.getElementById('cartForm').addEventListener('submit', function(e) {
    e.preventDefault(); // 기본 제출 방지
    this.submit(); // 폼 제출
});