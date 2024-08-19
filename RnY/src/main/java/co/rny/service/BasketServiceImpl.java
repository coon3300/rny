package co.rny.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.rny.common.DataSource;
import co.rny.mapper.BasketMapper;
import co.rny.vo.BasketVO;

public class BasketServiceImpl implements BasketService{
	
	SqlSession sqlSession = DataSource.getInstance().openSession(true); // 자동 커밋.
	BasketMapper mapper = sqlSession.getMapper(BasketMapper.class);
	
	@Override
	public boolean addBasket(String logid, int itemNo, int quantity) {
		return mapper.insertBasketDetail(logid, itemNo, quantity) == 1;

	}

	@Override
	public List<BasketVO> basketList(String logid) {
		return mapper.selectList(logid);
	}
	
	@Override
	public List<BasketVO> buyList(String logid) {
		return mapper.selectListBuy(logid);
	}

	@Override
	public boolean checkBasket(String logid) {
		return mapper.selectIsBasket(logid) == 1;
	}

	@Override
	public boolean makeBasket(String logid) {
		return mapper.insertBasket(logid) == 1;
	}

	@Override
	public boolean delBasket(String logid) {
		return mapper.updateBasket(logid) == 1;
	}

	@Override
	public int delBasketDetail(String logid) {
		return mapper.updateBasketDetail(logid);

	}

}
