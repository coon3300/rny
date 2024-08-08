package co.rny.mapper;

import java.util.List;

import co.rny.vo.QnaListVO;

public interface QnaListMapper {
	List<QnaListVO> qnaList();
	QnaListVO selectQna(int qnaNum);
}
