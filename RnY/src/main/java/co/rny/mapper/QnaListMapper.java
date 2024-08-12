package co.rny.mapper;

import java.util.List;

import co.rny.vo.QnaListVO;

public interface QnaListMapper {
	List<QnaListVO> qnaList(); // 목록보기
	QnaListVO selectQna(int qnaNum);
	int qnaCnt();
	List<QnaListVO> qnaPaging(int page); //목록 페이징
	boolean replyDel(int qno);

}
