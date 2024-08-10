package co.rny.vo;

import lombok.Data;

@Data
public class OrderVO extends CartVO {
	private String orderNo;
	private String orderDate;
	private int orderCnt;
}
