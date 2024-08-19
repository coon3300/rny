package co.rny.mapper;

import java.util.List;

import co.rny.vo.BuyVO;

public interface BuyMapper {
	int insertBuy(String logid);
	int insertBuyDetail(String logid);
	List<BuyVO> selectList(String logid);
	List<BuyVO> selectListDetail(int buyNo);
}
