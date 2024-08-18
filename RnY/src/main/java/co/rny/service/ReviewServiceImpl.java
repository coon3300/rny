package co.rny.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.rny.common.DataSource;
import co.rny.common.SearchVO;
import co.rny.mapper.ReviewMapper;
import co.rny.vo.ReviewVO;

public class ReviewServiceImpl implements ReviewService {
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
		return mapper.reviewLike(reviewNum) == 1;
	}

	@Override
	public ReviewVO selectReview(int reviewNum) {
		return mapper.selectReview(reviewNum);
	}

	public List<ReviewVO> getReviewsByItemNo(SearchVO search) {
		return mapper.selectReviewDetail(search); // 리뷰목록 상세페이지에 연결
	}

//	@Override
//	public int addReview(ReviewVO addReview) {
//		return mapper.addReview(addReview); // 리뷰등록
//	}
	
	@Override
	public boolean addReview(ReviewVO rvo) {
		return mapper.addReview(rvo)==1; // 리뷰등록
	}

	@Override
	public int reviewTotalCnt(int itemNo) {
		return mapper.totalReviewCnt(itemNo);
	}

	@Override
	public boolean removeReview(int reviewNum) {
		return mapper.deleteReview(reviewNum) == 1;

	}
	
}
