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
	    public void addOrder(OrderVO order) {
	        mapper.insertOrder(order);
	    }

	    @Override
	    public void addOrderDetail(OrderVO orderDetail) {
	    	mapper.insertOrderDetail(orderDetail);
	    }

	    @Override
	    public OrderVO getOrderByNo(int orderNo) {
	        return mapper.selectOrderByNo(orderNo);
	    }

	    @Override
	    public List<OrderVO> getOrderDetailsByOrderNo(int orderNo) {
	        return mapper.selectOrderDetailsByOrderNo(orderNo);
	    }

	    @Override
	    public List<OrderVO> getAllOrders() {
	        return mapper.selectAllOrders();
	    }

	    @Override
	    public void deleteOrder(int orderNo) {
	    	mapper.deleteOrder(orderNo);
	    }

	}
