package co.rny.service;


import java.util.List;

import co.rny.common.SearchVO;
import co.rny.vo.LineVO;

public interface LineService {

	List<LineVO> lineList();
	String lineName(int LineNo);
	List<LineVO> lineListSearched(SearchVO search);
	int totalCount(SearchVO search);
	
}
