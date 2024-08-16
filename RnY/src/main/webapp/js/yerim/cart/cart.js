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
        document.getElementById('grandTotalBottomDisplay').textContent = Math.round(grandTotal);
    }
});









document.getElementById('cartForm').addEventListener('submit', function() {
    let cartCountInput = document.querySelector('input[name="cartCount"]').value;
    document.querySelector('input[name="cartCount"]').value = cartCountInput;
});

