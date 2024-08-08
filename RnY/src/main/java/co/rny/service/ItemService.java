package co.rny.service;

import java.util.List;
import java.util.Map;

import co.rny.vo.ItemVO;

public interface ItemService {
	List<ItemVO> itemList(int lineNo);

	List<ItemVO> itemListRelated();
	
	ItemVO itemSelected(int itemNo);
	
	List<Map<String, Object>> itemMapList(int itemNo);


}
