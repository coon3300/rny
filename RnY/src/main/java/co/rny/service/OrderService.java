package co.rny.service;

import java.util.List;

import co.rny.vo.OrderVO;

public interface OrderService {

	 List<OrderVO> getOrderList(String userNo);
	    //주문 넣는 것 
	    int addOrder(OrderVO ovo);
	    //주문 상세
	    int addOrderDetail(OrderVO ovo);

	    boolean processOrder(String fullName, 
	            String phone, String address, 
	            String detailAddress, String orderMemo, 
	            String productNos, String productImgs, 
	            String productNames, String productPrices, 
	            String quantities, String shippingCost, 
	            String totalAmount);

	    List<OrderVO> myOrderList(String userNo);
	    List<OrderVO> myOrderDetailList(int orderNo);
	
}