package co.rny.vo;

import java.util.Date;

import lombok.Data;

@Data
public class QnaListVO {
	private String userNo; // 회원 고유번호
	private int qnaNum; // 게시판 번호
	private String qnaTitle; // 게시판 제목
	private String qnaContent; // 게시판 내용
	private String qnaAnswer; // 답변
	private String qnaImage; // 사진 
	private Date qnaDate; // 업로드 날짜
	private Date qnaAnswerDate; // 답변 업로드 날짜

}
