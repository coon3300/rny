package co.rny.mapper;

import java.util.List;

import co.rny.vo.LineVO;

public interface LineMapper {

	List<LineVO> selectList();

	String selectLineName(int lineNo);
}
