package co.rny.service;

import java.util.List;
import co.rny.vo.CartVO;

public interface CartService {
    List<CartVO> cartList(String userNo); // 장바구니 목록 조회
    void deleteCartItem(int cartNo); // 장바구니 항목 삭제
    void addOrUpdateCartItem(CartVO cartItem); // 장바구니 항목 추가 또는 업데이트
}