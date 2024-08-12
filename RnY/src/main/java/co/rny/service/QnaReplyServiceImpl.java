package co.rny.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.rny.common.DataSource;
import co.rny.mapper.QnaReplyMapper;
import co.rny.vo.QnaListVO;
import co.rny.vo.QnaReplyVO;

public class QnaReplyServiceImpl implements QnaReplyService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	QnaReplyMapper mapper = sqlSession.getMapper(QnaReplyMapper.class);

	@Override
	public boolean qnaReply(QnaReplyVO qvo) {
		return mapper.qnareply(qvo) == 1; // 댓글 등록
	}

	@Override
	public List<QnaReplyVO> qreplyList(QnaListVO qre) {
		return mapper.qreplyList(qre); // 댓글 목록
	}

}
