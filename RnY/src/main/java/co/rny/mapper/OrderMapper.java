package co.rny.mapper;

import java.util.List;

import co.rny.vo.OrderVO;

public interface OrderMapper {

	// 주문건 조회
    List<OrderVO> selectOrderList(String userNo);
     int insertOrder(OrderVO ovo);
     int insertOrderDetail(OrderVO ovo);

    // 마이페이지 주문내역 확인하기
    List<OrderVO> getMyOrderList(String userNo);
    List<OrderVO> getMyOrderDetailList(int orderNo);

}