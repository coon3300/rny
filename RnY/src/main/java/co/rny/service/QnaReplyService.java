package co.rny.service;

import java.util.List;

import co.rny.vo.QnaReplyVO;

public interface QnaReplyService {
	boolean qnaReply(QnaReplyVO qvo); //댓글 등록
	List<QnaReplyVO> qreplyList(QnaReplyVO qre); // 댓글 목록
}
