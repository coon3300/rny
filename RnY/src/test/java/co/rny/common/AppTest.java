package co.rny.common;

import org.apache.ibatis.session.SqlSession;

import co.rny.mapper.ItemMapper;
import co.rny.mapper.LineMapper;

public class AppTest {

	public static void main(String[] args) {

		/**
		SqlSession sqlSession = DataSource.getInstance().openSession(true); // 자동 커밋.
		ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
		mapper.selectList().forEach(product -> {
			System.out.println(product);
		});
		System.out.println(mapper.selectOne("P001").getPrdName());
		 * 
		 */
		
		/*
		SqlSession sqlSession = DataSource.getInstance().openSession(true); // 자동 커밋.
		CategoryMapper mapper = sqlSession.getMapper(CategoryMapper	.class);
		mapper.selectList().forEach(category -> {
			System.out.println(category);
		});
		 * 
		 */
		
		/**
		SqlSession sqlSession = DataSource.getInstance().openSession(true); // 자동 커밋.
		LineMapper mapper = sqlSession.getMapper(LineMapper	.class);
		mapper.selectList().forEach(line -> {
			System.out.println(line);
		});
		
		System.out.println(mapper.selectLineName(11));
		 * 
		 */
		
		SqlSession sqlSession = DataSource.getInstance().openSession(true); // 자동 커밋.
		ItemMapper mapper = sqlSession.getMapper(ItemMapper	.class);
		mapper.selectList(11).forEach(line -> {
			System.out.println(line);
		});
		
	}
}
