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
	int selectTotalCount(SearchVO search);
	ItemVO selectOne(int itemNo);
	List<Map<String, Object>> itemMapList();
}
