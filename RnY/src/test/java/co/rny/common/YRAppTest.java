package co.rny.common;

import co.rny.service.OrderService;
import co.rny.service.OrderServiceImpl;
import co.rny.vo.OrderVO;

public class YRAppTest {
	public static void main(String[] args) {

//		SqlSession sqlSession = DataSource.getInstance().openSession(true); // 자동 커밋.
//		WishMapper mapper = sqlSession.getMapper(WishMapper.class);
//		mapper.wish().forEach(wish -> {
//			System.out.println(wish);
//		});

		// System.out.println(mapper.wish());

//		SqlSession sqlSession = DataSource.getInstance().openSession(true); // 자동 커밋.
//		OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
//		
		OrderVO ovo = new OrderVO();
		ovo.setUserNo("A102");

		//OrderService svc = new OrderServiceImpl();
		//svc.ordered(ovo);
//		System.out.println(mapper.wishheart("user02"));

	}
}
