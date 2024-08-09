package co.rny.mapper;

import java.util.List;

import co.rny.vo.OrderVO;

public interface OrderMapper {
	List<OrderVO> buy();
	List<OrderVO> orderList(String id);
}
