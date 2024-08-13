package co.rny.service;

import java.util.List;

import co.rny.vo.ReviewVO;

public interface ReviewService {
	List<ReviewVO> reviewList(String page); 
	int totalCnt();
	boolean reviewLike(int reviewNum);

}
