package co.rny.service;

import java.util.List;

import co.rny.vo.BasketVO;

public interface BasketService {
	boolean addBasket(String logid, int itemNo, int quantity);
	List<BasketVO> basketList(String logid);
	List<BasketVO> buyList(String logid);
	boolean checkBasket(String logid);
	boolean makeBasket(String logid);
	
	boolean delBasket(String logid);
	int delBasketDetail(String logid);
}
