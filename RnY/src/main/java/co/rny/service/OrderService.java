package co.rny.service;

import java.util.List;

import co.rny.vo.OrderVO;

public interface OrderService {
	List<OrderVO> orderList();
	public List<OrderVO> listOrder(String id);
	boolean ordered(OrderVO ovo);
}
