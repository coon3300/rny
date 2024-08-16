package co.rny.service;

import org.apache.ibatis.session.SqlSession;
import co.rny.mapper.CartMapper;
import co.rny.vo.CartVO;
import co.rny.common.DataSource;
import java.util.List;

public class CartServiceImpl implements CartService {
    private final SqlSession sqlSession;
    private final CartMapper mapper;

    public CartServiceImpl() {
        // SqlSession을 초기화하고, 자동 커밋 설정
        this.sqlSession = DataSource.getInstance().openSession(true);
        this.mapper = sqlSession.getMapper(CartMapper.class);
    }

    @Override
    public List<CartVO> cartList(String userNo) {
        return mapper.selectCartList(userNo);
    }

    @Override
    public void deleteCartItem(int cartNo) {
        mapper.deleteCartItem(cartNo);
    }

    @Override
    public void addOrUpdateCartItem(CartVO cartItem) {
        CartVO existingItem = mapper.selectCartItem(cartItem.getCartNo());
        if (existingItem != null) {
            mapper.updateCartItem(cartItem);
        } else {
            mapper.insertCartItem(cartItem);
        }
    }
}