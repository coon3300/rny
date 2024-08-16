package co.rny.service;


import java.util.List;

import co.rny.common.SearchVO;
import co.rny.vo.LineVO;

public interface LineService {

	List<LineVO> lineList();
	String lineName(int lineNo);
	List<LineVO> lineListSearched(SearchVO search);
	int totalCount(SearchVO search);
	LineVO lineSelectedAll(int lineNo);
	boolean modifyLine(LineVO line);
	boolean deleteLine(LineVO line);
	boolean deleteLineCancel(LineVO line);
}
