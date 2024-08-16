package co.rny.service;

import java.util.List;

import co.rny.vo.CartVO;
import co.rny.vo.MemberVO;

public interface CartService {
	List<CartVO> cartList(String id);
	boolean removeCart(int CartNo);
	boolean addCart(MemberVO mvo);
	CartVO getCartItem(String userNo, String itemNo);  // 장바구니 항목을 가져오는 메소드
    void updateCartCount(CartVO cart);  // 수량을 업데이트하는 메소드
}
