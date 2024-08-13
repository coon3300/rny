package co.rny.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private String userNo; // 회원 고유번호
	private String userId; // 회원 아이디
	private int reviewNum; // 게시글 번호
	private String reviewTitle; // 리뷰 제목
	private String reviewContent; // 리뷰 내용
	private String reviewImage; // 리뷰 사진
	private Date reviewDate; // 작성일자
	private int reviewLike; // 좋아요

}
