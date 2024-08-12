package co.rny.vo;

import java.util.Date;

import lombok.Data;

@Data
public class QnaReplyVO {
private String userId; // 회원아이디
private int qnaNum; // 게시글번호
private int qreplyNum; // 댓글번호
private String qreplyContent; // 댓글 내용
private Date qreplyDate; // 댓글 작성일자


}
