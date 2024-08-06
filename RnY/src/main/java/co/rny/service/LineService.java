package co.rny.service;


import java.util.List;

import co.rny.vo.LineVO;

public interface LineService {

	List<LineVO> lineList();
	String lineName(int LineNo);
}
