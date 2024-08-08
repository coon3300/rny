package co.rny.service;

import java.util.List;

import co.rny.vo.QnaListVO;

public interface QnaListService {
	List<QnaListVO> qnaList();
	QnaListVO selectQna(int qnaNum);

}
