package co.rny.service;

import java.util.List;

import co.rny.vo.NoticeVO;

public interface NoticeService {
	List<NoticeVO> noticeList(String page);
	NoticeVO selectNotice(int noticeNum);
	int totalCnt();
}
