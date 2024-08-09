package co.rny.vo;

import lombok.Data;

@Data
public class OrderVO extends MemberVO {
	private String orderNo;
	private String orderDate;
	private int orderPrice;
}
