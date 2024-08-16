package co.rny.mapper;

import java.util.List;
import co.rny.vo.OrderVO;

public interface OrderMapper {
    List<OrderVO> getCartItems(String id); // 장바구니에서 주문할 상품을 가져오는 메서드
    void saveOrder(OrderVO order); // 주문을 저장하는 메서드
    List<OrderVO> selectOrdersByUserId(String id);

}
