package co.rny.mapper;

import java.util.List;
import java.util.Map;

import co.rny.common.SearchVO;
import co.rny.vo.ItemVO;

public interface ItemMapper {

	List<ItemVO> selectList(int lineNo);
	List<ItemVO> selectListRelated();
	List<ItemVO> selectItemRelated(int lineNo);
	//List<ItemVO> selectListSearched(String keyword);
	List<ItemVO> selectListPaging(SearchVO search);
	List<ItemVO> selectListPagingAll(SearchVO search);
	List<ItemVO> selectLinePaging(SearchVO search);
	int selectTotalCount(SearchVO search);
	int selectTotalCountLine(SearchVO search);
	int selectTotalCountAll(SearchVO search);
	ItemVO selectOne(int itemNo);
	ItemVO selectOneAll(int itemNo);
	List<Map<String, Object>> itemMapList();
	int updateItem(ItemVO item);
	int updateItemDisabled(ItemVO item);
	int updateItemEnabled(ItemVO item);
	int insertItem(ItemVO item);

	
}
