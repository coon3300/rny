package co.rny.service;

import java.util.List;

import co.rny.vo.ReviewVO;

public interface ReviewService {
	List<ReviewVO> reviewList(String page); //글목록
	int totalCnt();
	boolean reviewLike(int reviewNum);
	ReviewVO selectReview(int reviewNum); //상세
}
