package co.rny.service;

import java.util.List;

import co.rny.vo.BuyVO;

public interface BuyService {
	boolean addBuy(String logid);
	int addBuyDetail(String logid);
//	List<BasketVO> basketList(String logid);
	List<BuyVO> buyList(String logid);
	List<BuyVO> buyListDetail(int buyNo);
//	boolean checkBasket(String logid);
//	boolean makeBasket(String logid);
}
