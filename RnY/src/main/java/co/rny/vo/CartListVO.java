package co.rny.vo;

import lombok.Data;

@Data
public class CartListVO {
    private int cartNo;   // 장바구니 번호
    private String userNo;   // 사용자 번호
    private int itemNo; // 아이템 번호 
    private String itemName;          // 아이템 이름
    private int itemPrice;     // 아이템 가격
    private String itemImage;         // 아이템 이미지 URL
    private int quantity;     // 장바구니 항목 수량
    private String itemDesc;
    
    private String userId;
}
