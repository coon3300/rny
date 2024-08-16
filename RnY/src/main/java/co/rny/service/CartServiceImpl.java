package co.rny.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.rny.common.DataSource;
import co.rny.mapper.CartMapper;
import co.rny.vo.CartVO;
import co.rny.vo.MemberVO;

public class CartServiceImpl implements CartService {
	SqlSession sqlSession = //
			DataSource.getInstance().openSession(true); //true 넣으면 자동 커밋됨.
	CartMapper mapper = sqlSession.getMapper(CartMapper.class);
	
	@Override
	public List<CartVO> cartList(String id) {
		return mapper.cart(id);
	}
	@Override
	public boolean removeCart(int CartNo) {
		return mapper.deleteCart(CartNo) == 1;
	}
	@Override
	public boolean addCart(MemberVO mvo) {
		return mapper.plusCart(mvo) == 1;
	}
	@Override
	public CartVO getCartItem(String userNo, String itemNo) {
		return mapper.selectCartItem(userNo, itemNo);
	}

	@Override
	public void updateCartCount(CartVO cart) {
		mapper.updateCartCount(cart);
	}
}
