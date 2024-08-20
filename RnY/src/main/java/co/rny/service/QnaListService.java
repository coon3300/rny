package co.rny.service;

import java.util.List;

import co.rny.vo.QnaListVO;

public interface QnaListService {
	List<QnaListVO> qnaList(); // 글목록
	QnaListVO selectQna(int qnaNum);
	int qnaCnt(); 
	List<QnaListVO> qnaPaging(int page);

}
