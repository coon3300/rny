package co.rny.vo;

import lombok.Data;

@Data
public class CartVO extends MemberVO {
	private String cartNo;
	private int cartCnt;
}
