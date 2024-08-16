package co.rny.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.rny.common.DataSource;
import co.rny.mapper.OrderMapper;
import co.rny.vo.OrderVO;

public class OrderServiceImpl implements OrderService {
	SqlSession sqlSession = //
			DataSource.getInstance().openSession(true); //true 넣으면 자동 커밋됨.
	OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);

	

	@Override
	public List<OrderVO> getCartItems(String id) {
			return mapper.getCartItems(id);
		}

	@Override
    public void saveOrder(OrderVO order) {
            mapper.saveOrder(order);
        }
        
	@Override
	public List<OrderVO> getOrdersByUserId(String id) {
		return mapper.selectOrdersByUserId(id);
	}

}
	public boolean ordered(OrderVO ovo) {
	    try {
	        mapper.insertOrder(ovo);
	        mapper.insertOrderDetail(ovo);
	        mapper.deleteCart(ovo.getUserNo());
	        return true;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}}
