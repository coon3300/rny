create table tbl_notice ( -- 공지사항 테이블
user_no VARCHAR2(20) PRIMARY KEY, --회원 고유번호
notice_num number(38) not null, -- 공지사항 번호
notice_title VARCHAR2(300) not null, -- 공지사항 제목
notice_content VARCHAR2(3000) not null, -- 공지사항 내용
notice_image VARCHAR2(300), -- 사진
notice_date date DEFAULT sysdate -- 업로드 날짜
);

create table tbl_QNA ( -- QnA테이블
user_no VARCHAR2(20) PRIMARY KEY, --회원 고유번호
qna_num number(38) not null, --게시판 번호
qna_title VARCHAR2(300) not null, --게시판 제목
qna_content VARCHAR2(3000) not null, -- 게시판 내용
qna_answer VARCHAR2(3000) not null,-- 답변
qna_image VARCHAR2(300), -- 사진
qna_date date DEFAULT sysdate, -- 업로드 날짜
qna_answerdate date DEFAULT sysdate -- 답변업로드 날짜
);

create table tbl_qnareply ( -- QnA 댓글 테이블
user_no VARCHAR2(20) PRIMARY KEY, --회원 고유번호
qna_num number(38) not null, --게시판번호(댓글달리는)
qreply_num number(38) not null, -- 댓글번호
qreply_content VARCHAR2(3000) not null, -- 댓글 내용
qreply_date date DEFAULT sysdate -- 업로드 날짜
);


create table tbl_review ( --리뷰테이블
user_no VARCHAR2(20) PRIMARY KEY, --회원 고유번호
review_num number(38) not null, -- 리뷰 번호
review_title VARCHAR2(300) not null, -- 리뷰제목
review_content VARCHAR2(3000) not null,-- 리뷰 내용
review_image VARCHAR2(300),-- 사진
review_date date DEFAULT sysdate, -- 업로드날짜
review_comment VARCHAR2(800) not null -- 리뷰 댓글


);

commit;

insert into tbl_notice (user_no, notice_num, notice_title, notice_content, notice_image,notice_date)
values ('admin01',01,'공지사항 테스트','공지사항 테스트내용','notice001.jpg',sysdate);

insert into tbl_notice (user_no, notice_num, notice_title, notice_content, notice_image,notice_date)
values ('admin02',02,'공지사항 테스트','공지사항 테스트내용','notice002.jpg',sysdate);

insert into tbl_notice (user_no, notice_num, notice_title, notice_content, notice_image,notice_date)
values ('admin03',03,'공지사항 테스트','공지사항 테스트내용','notice003.jpg',sysdate);

insert into tbl_notice (user_no, notice_num, notice_title, notice_content, notice_image,notice_date)
values ('admin04',04,'공지사항 테스트','공지사항 테스트내용','notice004.jpg',sysdate);
