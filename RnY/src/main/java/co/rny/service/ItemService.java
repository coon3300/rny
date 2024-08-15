package co.rny.service;

import java.util.List;
import java.util.Map;

import co.rny.common.SearchVO;
import co.rny.vo.ItemVO;

public interface ItemService {
	List<ItemVO> itemList(int lineNo);

	List<ItemVO> itemListRelated();
	
	List<ItemVO> itemInfoRelated(int lineNo);
	
	//List<ItemVO> itemListSearched(String keyword);
	
	List<ItemVO> itemListSearched(SearchVO search);
	
	List<ItemVO> itemListLine(SearchVO search);
	
	int totalCount(SearchVO search);
	
	int totalCountLine(SearchVO search);
	
	ItemVO itemSelected(int itemNo);
	
	List<Map<String, Object>> itemMapList(int itemNo);


}
