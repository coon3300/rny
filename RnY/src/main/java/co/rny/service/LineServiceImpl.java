package co.rny.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.rny.common.DataSource;
import co.rny.common.SearchVO;
import co.rny.mapper.LineMapper;
import co.rny.vo.LineVO;

public class LineServiceImpl implements LineService{
	
	SqlSession sqlSession = DataSource.getInstance().openSession(true); // 자동 커밋.
	LineMapper mapper = sqlSession.getMapper(LineMapper.class);
	
	@Override
	public List<LineVO> lineList() {
		return mapper.selectList();
	}

	@Override
	public String lineName(int lineNo) {
        return mapper.selectLineName(lineNo);
	}

	@Override
	public List<LineVO> lineListSearched(SearchVO search) {
		return mapper.selectListPaging(search);
	}

	@Override
	public int totalCount(SearchVO search) {
		return mapper.selectTotalCount(search);
	}

	@Override
	public LineVO lineSelectedAll(int lineNo) {
		return mapper.selectOneAll(lineNo);
	}

	@Override
	public boolean modifyLine(LineVO line) {
		return mapper.updateLine(line) == 1;

	}

	@Override
	public boolean deleteLine(LineVO line) {
		return mapper.updateLineDisabled(line) == 1;

	}

	@Override
	public boolean deleteLineCancel(LineVO line) {
		return mapper.updateLineEnabled(line) == 1;

	}

	@Override
	public boolean addLine(LineVO line) {
		return mapper.insertLine(line) == 1;

	}

	@Override
	public int lineCurrval() {
		return mapper.selectCurrval();
	}
}
