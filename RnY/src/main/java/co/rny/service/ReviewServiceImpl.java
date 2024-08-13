package co.rny.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.rny.common.DataSource;
import co.rny.mapper.ReviewMapper;
import co.rny.vo.ReviewVO;


public class ReviewServiceImpl implements ReviewService{
	SqlSession sqlSession = //
			DataSource.getInstance().openSession(true);
	ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);

	@Override
	public List<ReviewVO> reviewList(String page) {
		return mapper.reviewList(page);
	}
	@Override
	public int totalCnt() {
		return mapper.totalCnt();
	}
	@Override
	public boolean reviewLike(int reviewNum) {
		return mapper.reviewLike(reviewNum) == 1 ;
	}
}

