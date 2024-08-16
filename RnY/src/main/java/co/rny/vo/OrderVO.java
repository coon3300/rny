package co.rny.vo;

import java.util.Date;


import lombok.Data;

@Data
public class OrderVO {
	
	//오더
    private int orderNo;          // 주문번호
    private String userNo;        // 주문자
    private int orderPrice;       // 주문금액
    private Date orderDate;       // 주문일시
    private Date deliveryDate;    // 배송일시
    private Date cancelDate;      // 취소일시
    //오더디테일
    private int odNo;             // 주문상세번호
    private int itemNo;           // 상품번호
    private int odPrice;          // 주문상세가격
    private int odCnt;            // 주문수량
}
