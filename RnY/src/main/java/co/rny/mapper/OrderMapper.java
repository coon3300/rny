package co.rny.mapper;

import java.util.List;
import co.rny.vo.OrderVO;

public interface OrderMapper {

    // 주문 추가
    void insertOrder(OrderVO order);

    // 주문 상세 추가
    void insertOrderDetail(OrderVO orderDetail);

    // 주문 조회
    OrderVO selectOrderByNo(int orderNo);

    // 주문 상세 조회
    List<OrderVO> selectOrderDetailsByOrderNo(int orderNo);

    // 모든 주문 조회
    List<OrderVO> selectAllOrders();

    // 주문 삭제
    void deleteOrder(int orderNo);
}