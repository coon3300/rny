package co.rny.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.rny.common.DataSource;
import co.rny.mapper.CartMapper;
import co.rny.vo.CartVO;

public class CartServiceImpl implements CartService {
	SqlSession sqlSession = //
			DataSource.getInstance().openSession(true); //true 넣으면 자동 커밋됨.
	CartMapper mapper = sqlSession.getMapper(CartMapper.class);
	
	@Override
	public List<CartVO> cartList() {
		return mapper.cart();
	}
}
