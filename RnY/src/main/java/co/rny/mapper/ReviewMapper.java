package co.rny.mapper;

import java.util.List;

import co.rny.vo.ReviewVO;

public interface ReviewMapper {
	List<ReviewVO> reviewList(String page);
	int totalCnt();
	int reviewLike(int reviewNum);
	ReviewVO selectReview(int reviewNum);

}
