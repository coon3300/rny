package co.rny.service;

import java.util.List;

import co.rny.vo.CartVO;

public interface CartService {
	 List<CartVO> getCartList(String memberId);
	    boolean deleteCartList(String cartNo);
		boolean insertCartList(CartVO cartListVO);
}