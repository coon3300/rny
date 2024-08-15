package co.rny.common;

import org.apache.ibatis.session.SqlSession;

import co.rny.mapper.ItemMapper;
import co.rny.vo.ItemVO;

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
		ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
		ItemVO ivo = new ItemVO();
		ivo.setItemNo(2122);
		ivo.setLineNo(808);
		ivo.setItemCode("0");
		ivo.setItemName("캣닢 버블2");
		ivo.setItemDesc("터지면 캣닢 향이 나는 비눗방울 장난감입니다.");
		ivo.setItemPrice(9000);
		ivo.setItemStock(100);
		ivo.setItemImage("image4.jpg");
		
		if(mapper.updateItem(ivo)==1) {
			System.out.println("ok.");
		}
		
		

	}
}
