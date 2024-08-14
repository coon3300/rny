package co.rny.mapper;

import java.util.List;

import co.rny.vo.NoticeVO;

public interface NoticeMapper {
	List<NoticeVO> noticeList(String page);
	NoticeVO selectNotice(int noticeNum);
	int totalCnt();
	List<NoticeVO> noticeAdm(String page);// 관리자 리스트
	NoticeVO noticeAdmDetail(int noticeNum);//관리자용
	boolean noticeAdmAdd(NoticeVO notice);// 공지사항 등록
	
	
	
}
