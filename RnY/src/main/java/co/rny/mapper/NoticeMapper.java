package co.rny.mapper;

import java.util.List;

import co.rny.vo.NoticeVO;

public interface NoticeMapper {
	List<NoticeVO> noticeList(String page);
	NoticeVO selectNotice(int noticeNum);
	int totalCnt();
	
	
}
