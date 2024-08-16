package co.rny.vo;

import lombok.Data;

@Data
public class CartVO extends MemberVO {
    private String cartNo;      // 장바구니 항목 고유 번호
    private String userNo;      // 사용자 번호
    private int itemNo;         // 상품 번호
    private int cartCount;      // 상품 수량
}