package co.rny.mapper;

import java.util.List;

import co.rny.common.SearchVO;
import co.rny.vo.ReviewVO;

public interface ReviewMapper {
	List<ReviewVO> reviewList(String page);
	int totalCnt();
	int reviewLike(int reviewNum);
	ReviewVO selectReview(int reviewNum);
	List<ReviewVO> selectReviewDetail(SearchVO search); // 아이템상세에 리뷰 목록 출력
	int addReview(ReviewVO addReview); // 리뷰등록	
	List<ReviewVO> getRecentReviews (String page);
	int totalReviewCnt(int itemNo); // 글번호 리뷰 갯수.
	int deleteReview(int reviewNum);


}
