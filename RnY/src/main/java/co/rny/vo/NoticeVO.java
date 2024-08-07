package co.rny.vo;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {

	private String userNo; // 회원고유번호
	private int noticeNum; // 공지사항 번호
	private String noticeTitle; // 공지사항 제목
	private String noticeContent; // 공지사항 내용
	private String noticeImage; // 공지사항 이미지
	private Date noticeDate; // 업로드 날짜

}
