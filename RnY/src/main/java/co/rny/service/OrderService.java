package co.rny.service;

import java.util.List;
import co.rny.vo.OrderVO;

public interface OrderService {
    void saveOrder(OrderVO order); // 주문을 저장하는 메서드
    List<OrderVO> getOrdersByUserId(String id);
    List<OrderVO> getCartItems(String id);
}
