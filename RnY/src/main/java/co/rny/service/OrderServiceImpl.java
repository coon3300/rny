package co.rny.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.rny.common.DataSource;
import co.rny.mapper.OrderMapper;
import co.rny.vo.OrderVO;

public class OrderServiceImpl implements OrderService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true); // true 넣으면 자동 커밋됨.
	OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);

	  @Override
	    public List<OrderVO> getOrderList(String userNo) {
	        return mapper.selectOrderList(userNo);
	    }

	    @Override
	    public int addOrder(OrderVO ovo) {
	        // TODO Auto-generated method stub
	        return mapper.insertOrder(ovo);
	    }

	    @Override
	    public int addOrderDetail(OrderVO ovo) {
	        // TODO Auto-generated method stub
	        return mapper.insertOrderDetail(ovo);
	    }

	    @Override
	    public List<OrderVO> myOrderList(String userNo) {
	        return mapper.getMyOrderList(userNo);
	    }

	    @Override
	    public List<OrderVO> myOrderDetailList(int orderNo) {
	        return mapper.getMyOrderDetailList(orderNo);
	    }

	    public boolean processOrder(String fullName, String phone, String address, String detailAddress, String orderMemo,
	            String productNos, String productImgs, String productNames, String productPrices, String quantities,
	            String shippingCost, String totalAmount) {




	        return true; 

	    }
}