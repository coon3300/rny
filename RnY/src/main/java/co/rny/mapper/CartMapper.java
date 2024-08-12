package co.rny.mapper;

import java.util.List;

import co.rny.vo.CartVO;

public interface CartMapper {
	List<CartVO> cart(String id);
	int deleteCart(int cno);
}
