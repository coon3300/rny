package co.rny.mapper;

import java.util.List;

import co.rny.vo.NoticeVO;

public interface NoticeMapper {
	List<NoticeVO> noticeList();
	NoticeVO selectNotice(int noticeNum);
}
