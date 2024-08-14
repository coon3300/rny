package co.rny.service;

import java.util.List;

import co.rny.vo.CartVO;
import co.rny.vo.MemberVO;

public interface CartService {
	List<CartVO> cartList(String id);
	boolean removeCart(int CartNo);
	boolean addCart(MemberVO mvo);
}
