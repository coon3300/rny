package co.rny.mapper;

import java.util.List;
import co.rny.vo.CartVO;

public interface CartMapper {
    List<CartVO> selectCartList(String userNo); // 장바구니 목록 조회
    void deleteCartItem(int cartNo); // 장바구니 항목 삭제
    CartVO selectCartItem(int cartNo); // 장바구니 항목 조회
    void updateCartItem(CartVO cartItem); // 장바구니 항목 수량 업데이트
    void insertCartItem(CartVO cartItem); // 장바구니 항목 추가
}