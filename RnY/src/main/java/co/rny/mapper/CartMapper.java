package co.rny.mapper;

import java.util.List;

import co.rny.vo.CartVO;

public interface CartMapper {
	List<CartVO> selectCartList(String memberId);
    int deleteCartItem(String cartNo); // 장바구니 항목 삭제 메서드 정의
	int insertCartItem(CartVO cartListVO);
}