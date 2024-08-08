package co.rny.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.rny.common.DataSource;
import co.rny.mapper.QnaListMapper;
import co.rny.vo.QnaListVO;

public class QnaListServiceImpl implements QnaListService {
	SqlSession sqlSession = //
			DataSource.getInstance().openSession(true);
	QnaListMapper mapper = sqlSession.getMapper(QnaListMapper.class);

	@Override
	public List<QnaListVO> qnaList() {
		return mapper.qnaList();
	}

	@Override
	public QnaListVO selectQna(int qnaNum) {
		return mapper.selectQna(qnaNum);
	}

}
