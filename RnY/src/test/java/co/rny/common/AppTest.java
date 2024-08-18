package co.rny.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.rny.mapper.MemberMapper;
import co.rny.service.ReviewService;
import co.rny.service.ReviewServiceImpl;
import co.rny.vo.ReviewVO;

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

		SqlSession sqlSession = DataSource.getInstance().openSession(true); // 자동 커밋.
		LineMapper mapper = sqlSession.getMapper(LineMapper.class);
		
		
		System.out.println(mapper.selectCurrval());
		System.out.println("종료.");
		 * 
		 */
		
		/*
		SqlSession sqlSession = DataSource.getInstance().openSession(true); // 자동 커밋.
		ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
		
		SearchVO search = new SearchVO();
		search.setItemNo(1612);
		search.setPage(1);
		
		System.out.println(mapper.selectReviewDetail(search));
		System.out.println("종료.");
		 */
		/*
		SqlSession sqlSession = DataSource.getInstance().openSession(true); // 자동 커밋.
		ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
		
		ReviewVO rvo = new ReviewVO();
		
		rvo.setItemNo(1612);
		rvo.setUserId("admin01");
		rvo.setUserNo("A104");
		rvo.setReviewContent("내용");
		rvo.setReviewTitle("내용");

		
		System.out.println(mapper.addReview(rvo));
		System.out.println("종료.");
		 * 
		 */
		
		SqlSession sqlSession = DataSource.getInstance().openSession(true); // 자동 커밋.
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		System.out.println(mapper.userCheck("user1"));
		
		SearchVO search = new SearchVO();
		search.setItemNo(1612);
		search.setPage(1);
		
		ReviewService svc = new ReviewServiceImpl();
		svc.getReviewsByItemNo(search).forEach(ele -> {
			System.out.println(ele);
		});
	}
	
}
