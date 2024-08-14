package co.rny.service;

import java.util.List;

import co.rny.vo.NoticeVO;

public interface NoticeService {
	List<NoticeVO> noticeList(String page);
	NoticeVO selectNotice(int noticeNum);
	int totalCnt();
	List<NoticeVO> noticeAdm(String page); //관리자용 리스트 페이지
	NoticeVO noticeAdmDetail(int noticeNum); // 관리자용 
	boolean noticeAdmAdd(NoticeVO notice);// 공지사항 등록
}
