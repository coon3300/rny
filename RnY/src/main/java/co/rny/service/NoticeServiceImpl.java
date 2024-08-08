package co.rny.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.rny.common.DataSource;
import co.rny.mapper.NoticeMapper;
import co.rny.vo.NoticeVO;

public class NoticeServiceImpl implements NoticeService {
	SqlSession sqlSession = //
			DataSource.getInstance().openSession(true);
	NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);

	@Override
	public List<NoticeVO> noticeList() {
		return mapper.noticeList();
	}

	@Override
	public NoticeVO selectNotice(int noticeNum) {
		return mapper.selectNotice(noticeNum);
	}
}
