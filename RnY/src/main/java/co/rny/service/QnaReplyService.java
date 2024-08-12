package co.rny.service;

import java.util.List;

import co.rny.vo.QnaListVO;
import co.rny.vo.QnaReplyVO;

public interface QnaReplyService {
	boolean qnaReply(QnaReplyVO qvo); // 댓글 등록
	List<QnaReplyVO> qreplyList(QnaListVO qre); // 댓글 목록
}
