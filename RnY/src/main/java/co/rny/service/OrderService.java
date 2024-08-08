package co.rny.service;

import java.util.List;

import co.rny.vo.OrderVO;

public interface OrderService {
	List<OrderVO> orderList();
	public List<OrderVO> ordering(String id);
}
