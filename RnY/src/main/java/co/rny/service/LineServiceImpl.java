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
		// TODO Auto-generated method stub
		return mapper.selectTotalCount(search);
	}
	
}
