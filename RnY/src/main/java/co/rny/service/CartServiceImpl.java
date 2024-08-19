package co.rny.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.rny.common.DataSource;
import co.rny.mapper.CartMapper;
import co.rny.vo.CartVO;

public class CartServiceImpl implements CartService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true); // true 넣으면 자동 커밋됨.
	CartMapper mapper = sqlSession.getMapper(CartMapper.class);
    
	@Override
    public List<CartVO> getCartList(String memberId) {
        return mapper.selectCartList(memberId);
    }

    @Override
    public boolean deleteCartList(String cartNo) {
        return mapper.deleteCartItem(cartNo) == 1; // 삭제 성공 여부 확인
    }

	@Override
	public boolean insertCartList(CartVO cartListVO) {
		return mapper.insertCartItem(cartListVO) == 1;
	}
	
}