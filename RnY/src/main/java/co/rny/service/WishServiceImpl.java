package co.rny.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.rny.common.DataSource;
import co.rny.mapper.WishMapper;
import co.rny.vo.WishVO;

public class WishServiceImpl implements WishService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true); // true 넣으면 자동 커밋됨.
	WishMapper mapper = sqlSession.getMapper(WishMapper.class);
		@Override
		public List<WishVO> wishlist() {
			return mapper.wish();
		}
}
