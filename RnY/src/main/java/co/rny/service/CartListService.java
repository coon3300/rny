package co.rny.service;

import java.util.List;

import co.rny.vo.CartListVO;

public interface CartListService {
	List<CartListVO> getCartList(String memberId);
    boolean deleteCartList(String cartNo);
	boolean insertCartList(CartListVO cartListVO);
}
