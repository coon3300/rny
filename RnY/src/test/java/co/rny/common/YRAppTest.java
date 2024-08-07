package co.rny.common;

import org.apache.ibatis.session.SqlSession;

import co.rny.mapper.WishMapper;

public class YRAppTest {
	public static void main(String[] args) {
		
		SqlSession sqlSession = DataSource.getInstance().openSession(true); // 자동 커밋.
		WishMapper mapper = sqlSession.getMapper(WishMapper.class);
		mapper.wish().forEach(wish -> {
			System.out.println(wish);
		});
		
		//System.out.println(mapper.wish());
	}
}
