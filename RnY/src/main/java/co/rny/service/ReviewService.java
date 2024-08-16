package co.rny.service;

import java.util.List;

import co.rny.vo.ReviewVO;

public interface ReviewService {
	List<ReviewVO> reviewList(String page); //글목록
	int totalCnt();
	boolean reviewLike(int reviewNum);
	ReviewVO selectReview(int reviewNum); //상세
	List<ReviewVO> getReviewsByItemNo(int itemNo); // 아이템상세에 리뷰 목록 출력
}
