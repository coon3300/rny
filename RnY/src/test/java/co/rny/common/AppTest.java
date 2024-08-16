package co.rny.common;

import org.apache.ibatis.session.SqlSession;

import co.rny.mapper.LineMapper;

public class AppTest {

	public static void main(String[] args) {
		/*
		SqlSession sqlSession = DataSource.getInstance().openSession(true); // 자동 커밋.
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		SearchVO search = new SearchVO();
		search.setLineNo(11);
		search.setPage(1);
		mapper.selectLinePaging(search).forEach(ele -> {
			
			System.out.println(ele);
		});

		System.out.println("종료.");
		 * 
		 */
		
		SqlSession sqlSession = DataSource.getInstance().openSession(true); // 자동 커밋.
		LineMapper mapper = sqlSession.getMapper(LineMapper.class);

		
		System.out.println(mapper.selectCurrval());
	}
	
}
