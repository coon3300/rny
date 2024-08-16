package co.rny.service;

import java.util.List;

import co.rny.vo.OrderVO;

public interface OrderService {
	 // 주문 추가
    void addOrder(OrderVO order);

    // 주문 상세 추가
    void addOrderDetail(OrderVO orderDetail);

    // 주문 조회
    OrderVO getOrderByNo(int orderNo);

    // 주문 상세 조회
    List<OrderVO> getOrderDetailsByOrderNo(int orderNo);

    // 모든 주문 조회
    List<OrderVO> getAllOrders();

    // 주문 삭제
    void deleteOrder(int orderNo);
    // 사용자의 주문 목록 조회

}