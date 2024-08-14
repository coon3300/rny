package co.rny.mapper;

import java.util.List;

import co.rny.vo.CartVO;
import co.rny.vo.MemberVO;

public interface CartMapper {
	List<CartVO> cart(String id);
	int deleteCart(int cno);
	int plusCart(MemberVO mvo);
}
