package co.rny.vo;

import lombok.Data;

@Data
public class OrderVO {
	private String orderNo;
	private String orderDate;
	private int orderPrice;
	private int orderCnt;
}
