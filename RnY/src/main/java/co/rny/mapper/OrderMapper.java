package co.rny.mapper;

import java.util.List;

import co.rny.vo.OrderVO;

public interface OrderMapper {
	List<OrderVO> buy();
	List<OrderVO> orderList(String id);
	int ordered(OrderVO ovo); //보류.
	int insertOrder(OrderVO ovo);//새로 오더생성.
	int insertOrderDetail(OrderVO ovo);
	int deleteCart(String userNo);
}
