package co.rny.vo;

import lombok.Data;

@Data
public class OrderVO extends CartVO {
	private String orderNo;
	private String orderDate;
	private String orderName;
	private String orderAdd;
	private String orderPhone;
	private String orderEmail;
	private String orderMessage;
}
