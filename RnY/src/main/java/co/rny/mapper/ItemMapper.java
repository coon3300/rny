package co.rny.mapper;

import java.util.List;

import co.rny.vo.ItemVO;

public interface ItemMapper {

	List<ItemVO> selectList(int lineNo);
	List<ItemVO> selectListRelated();
	ItemVO selectOne(int itemNo);
	
}
