package co.rny.vo;

import java.util.Date;

import lombok.Data;

@Data
public class QnaReplyVO {
private String userNo; // 회원고유번호
private int qnaNum; // 게시글번호
private int qreplynum; // 댓글번호
private String qreplyContent; // 댓글 내용
private Date qrepltDate; // 댓글 작성일자


}
