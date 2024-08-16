package co.rny.service;



import org.apache.ibatis.session.SqlSession;

import co.rny.common.DataSource;
import co.rny.mapper.OrderMapper;


public class OrderServiceImpl implements OrderService {
	SqlSession sqlSession = //
			DataSource.getInstance().openSession(true); //true 넣으면 자동 커밋됨.
	OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);



	}
