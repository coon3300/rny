package co.rny.mapper;

import java.util.List;

import co.rny.common.SearchVO;
import co.rny.vo.LineVO;

public interface LineMapper {

	List<LineVO> selectList();
	List<LineVO> selectListPaging(SearchVO search);
	int selectTotalCount(SearchVO search);
	String selectLineName(int lineNo);
}
