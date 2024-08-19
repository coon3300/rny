package co.rny.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.rny.common.DataSource;
import co.rny.mapper.CartListMapper;
import co.rny.vo.CartListVO;

public class CartListServiceImpl implements CartListService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
    CartListMapper mapper = sqlSession.getMapper(CartListMapper.class);

    @Override
    public List<CartListVO> getCartList(String memberId) {
        return mapper.selectCartList(memberId);
    }

    @Override
    public boolean deleteCartList(String cartNo) {
        return mapper.deleteCartItem(cartNo) == 1; // 삭제 성공 여부 확인
    }

	@Override
	public boolean insertCartList(CartListVO cartListVO) {
		return mapper.insertCartItem(cartListVO) == 1;
	}
}
