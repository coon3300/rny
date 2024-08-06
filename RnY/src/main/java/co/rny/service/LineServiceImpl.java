package co.rny.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.rny.common.DataSource;
import co.rny.mapper.LineMapper;
import co.rny.vo.LineVO;

public class LineServiceImpl implements LineService{
	
	/**
	SqlSession sqlSession = DataSource.getInstance().openSession(true); // 자동 커밋.
	LineMapper mapper = sqlSession.getMapper(LineMapper.class);
	
	@Override
	public List<LineVO> lineList() {
		return mapper.selectList();
	}
	 * 
	 */

    @Override
    public List<LineVO> lineList() {
        try (SqlSession sqlSession = DataSource.getInstance().openSession(false)) {
        	
            LineMapper mapper = sqlSession.getMapper(LineMapper.class);
            
            List<LineVO> result = mapper.selectList();
            
            sqlSession.commit();
            
            return result;
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

	@Override
	public String lineName(int lineNo) {
        try (SqlSession sqlSession = DataSource.getInstance().openSession(false)) {
        	
            LineMapper mapper = sqlSession.getMapper(LineMapper.class);
            
            String result = mapper.selectLineName(lineNo);
            
            sqlSession.commit();
            
            return result;
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}
	
}
