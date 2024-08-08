package co.rny.vo;

import java.util.Date;

import lombok.Data;

@Data
public class QnaReplyVO {
private String userNo;
private int qnaNum;
private String qreplyContent;
private Date qrepltDate;

}
