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
	public List<NoticeVO> noticeList(String page) {
		return mapper.noticeList(page);
	}

	public NoticeVO selectNotice(int noticeNum) {
		return mapper.selectNotice(noticeNum);

	}

	@Override
	public int totalCnt() {
		return mapper.totalCnt();
	}

	@Override
	public List<NoticeVO> noticeAdm(String page) {
		return mapper.noticeAdm(page);
	}

	@Override
	public NoticeVO noticeAdmDetail(int noticeNum) {
		return mapper.noticeAdmDetail(noticeNum); // 관리자 상세보기
	}

	@Override
	public boolean noticeAdmAdd(NoticeVO notice) {
		return mapper.noticeAdmAdd(notice);
	}
}
