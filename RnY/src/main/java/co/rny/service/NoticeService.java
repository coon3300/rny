package co.rny.service;

import java.util.List;

import co.rny.vo.NoticeVO;

public interface NoticeService {
	List<NoticeVO> noticeList();
	NoticeVO selectNotice(int noticeNum);
}
