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
	public List<OrderVO> orderList() { 
		return mapper.buy();
	}
}
