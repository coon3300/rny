package co.rny.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.rny.common.DataSource;
import co.rny.mapper.BuyMapper;
import co.rny.vo.BuyVO;

public class BuyServiceImpl implements BuyService{
	
	SqlSession sqlSession = DataSource.getInstance().openSession(true); // 자동 커밋.
	BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
	@Override
	public boolean addBuy(String logid) {
		return mapper.insertBuy(logid) == 1;
	}
	@Override
	public int addBuyDetail(String logid) {
		return mapper.insertBuyDetail(logid);

	}
	@Override
	public List<BuyVO> buyList(String logid) {
		return mapper.selectList(logid);

	}
	@Override
	public List<BuyVO> buyListDetail(int buyNO) {
		return mapper.selectListDetail(buyNO);
		
	}
}
