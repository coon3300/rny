package co.rny.vo;

import java.util.Date;

import lombok.Data;

@Data
public class WishListVO {

	//WishVO
		private String wishNo; // 위시 번호
	
	//MemberVO
		private String userNo;        // 회원 번호
	    private String userId;     // 회원 아이디
	    private String userPw;    // 회원 비밀번호
	    private String userName;   // 회원 이름
	    private String userNick; // 회원 닉네임
	    private Date userBirth; // 회원 생년월일
	    private String userPhone;  // 회원 전화번호
	    private String userEmail;  // 회원 이메일
	    private String userAdd; // 회원 주소
	    private int userPoint;     // 회원 포인트
	    private int userCoupon;     // 회원 포인트
	    private Date userDate;    // 가입일자
	    private String responsibility;  // 회원
	
	//ItemVO
		private int itemNo;          // 상품 번호
	    private int lineNo;          // 라인 번호
	    private String itemCode;     // 상품 코드
	    private String itemName;     // 상품 이름
	    private String itemDesc;     // 상품 설명
	    private int itemPrice;       // 상품 가격
	    private String itemImage;    // 상품 이미지
	    private String itemPetSize;  // 애완동물 크기
	    private String itemPetAgeRange; // 애완동물 연령대
	    private String itemPetBreed; // 애완동물 품종
	    private int itemStock;       // 재고 수량
	    private Date createdDate;    // 생성일
	    private Date updatedDate;    // 수정일
	    private Date disabledDate;   // 비활성화일
	    private int isDisabled;      // 비활성화 여부
}
