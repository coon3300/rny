create table tbl_notice ( -- 공지사항 테이블
user_no VARCHAR2(20) PRIMARY KEY, --회원 고유번호
user_id VARCHAR2(20)  not null, --회원 아이디
notice_num number(38) not null, -- 공지사항 번호
notice_title VARCHAR2(300) not null, -- 공지사항 제목
notice_content VARCHAR2(3000) not null, -- 공지사항 내용
notice_image VARCHAR2(300), -- 사진
notice_date date DEFAULT sysdate -- 업로드 날짜
);

create table tbl_QNA ( -- QnA테이블
user_no VARCHAR2(20) PRIMARY KEY, --회원 고유번호
user_id VARCHAR2(20)  not null, --회원 아이디
qna_type VARCHAR2(100) not null, -- 문의 타입
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
user_id VARCHAR2(20)  not null, --회원 아이디
qna_num number(38) not null, --게시판번호(댓글달리는)
qreply_num number(38) not null, -- 댓글번호
qreply_content VARCHAR2(3000) not null, -- 댓글 내용
qreply_date date DEFAULT sysdate -- 업로드 날짜
);

--리뷰테이블
CREATE TABLE tbl_review (
    review_num NUMBER PRIMARY KEY, -- 리뷰 번호 (고유 번호로 설정)
    user_no VARCHAR2(20), -- 회원 고유번호
    user_id VARCHAR2(20) NOT NULL, -- 회원 아이디
    item_no NUMBER NOT NULL, -- 아이템 넘버
    review_title VARCHAR2(300) NOT NULL, -- 리뷰제목
    review_content VARCHAR2(3000) NOT NULL, -- 리뷰 내용
    review_image VARCHAR2(300), -- 사진
    review_date DATE DEFAULT SYSDATE, -- 업로드날짜
    review_like NUMBER(38), -- 좋아요
    CONSTRAINT fk_review_user_no FOREIGN KEY (user_no) REFERENCES rny_member(user_no) -- user_no 외래키 설정
);

CREATE SEQUENCE review_seq
    START WITH 1        -- 시퀀스가 시작할 초기 값
    INCREMENT BY 1      -- 시퀀스가 증가할 값
    NOMAXVALUE          -- 최대값 없이 무한정 증가
    NOCYCLE             -- 최대값에 도달했을 때 시퀀스가 다시 1로 돌아가지 않음
    NOCACHE;            -- 시퀀스 값을 캐시하지 않음


--리뷰 데이터 삽입
INSERT INTO tbl_review (
    review_num, 
    user_no, 
    item_no, 
    user_id, 
    review_title, 
    review_content, 
    review_image, 
    review_date, 
    review_like
)
VALUES (
    review_seq.nextval,  -- 시퀀스를 사용하여 고유 번호 생성
    'A100', 
    1, 
    'user1', 
    '리뷰 제목', 
    '리뷰 내용', 
    NULL, 
    SYSDATE, 
    10
);
COMMIT;

select reply_seq.nextval from dual;
create sequence reply_seq;

drop table tbl_review purge; --테이블 지우기

insert into tbl_notice (user_no,user_id,notice_num, notice_title, notice_content, notice_image,notice_date)
values ('A104','admin01',01,'공지사항 테스트01','공지사항 테스트내용01','notice001.jpg',sysdate);

insert into tbl_notice (user_no, user_id, notice_num, notice_title, notice_content, notice_image,notice_date)
values ('A105','admin02',02,'공지사항 테스트02','공지사항 테스트내용02','notice002.jpg',sysdate);

insert into tbl_notice (user_no,user_id, notice_num, notice_title, notice_content, notice_image,notice_date)
values ('A106','admin03', 03,'공지사항 테스트03','공지사항 테스트내용03','notice003.jpg',sysdate);

insert into tbl_notice (user_no,user_id, notice_num, notice_title, notice_content, notice_image,notice_date)
values ('A107','admin04',04,'공지사항 테스트04','공지사항 테스트내용04','notice004.jpg',sysdate);

insert into tbl_notice (user_no,user_id, notice_num, notice_title, notice_content, notice_image,notice_date)
values ('A108','admin05','공지사항 테스트05','공지사항 테스트내용05','notice005.jpg',sysdate);

insert into tbl_notice (user_no,user_id, notice_num, notice_title, notice_content, notice_image,notice_date)
values ('A109','admin06','공지사항 테스트06','공지사항 테스트내용06','notice005.jpg',sysdate);

insert into tbl_notice (user_no,user_id, notice_num, notice_title, notice_content, notice_image,notice_date)
values ('A110','admin07','공지사항 테스트07','공지사항 테스트내용07','notice005.jpg',sysdate);


insert into tbl_QNA (user_no,user_id, qna_type ,qna_num, qna_title, qna_content,qna_answer, qna_image,qna_date,qna_answerdate)
values ('A104','user1','상품문의',01,'QnA 테스트01','QnA 테스트내용01','QnA 테스트내용01','qna001.jpg',sysdate,sysdate);

insert into tbl_QNA (user_no,user_id, qna_type ,qna_num, qna_title, qna_content,qna_answer, qna_image,qna_date,qna_answerdate)
values ('A105','user2','상품문의',02,'QnA 테스트02','QnA 테스트내용02','QnA 테스트내용02','qna001.jpg',sysdate,sysdate);

insert into tbl_QNA (user_no,user_id, qna_type ,qna_num, qna_title, qna_content,qna_answer, qna_image,qna_date,qna_answerdate)
values ('A106','user3','기타문의', 03,'QnA 테스트03','QnA 테스트내용03','QnA 테스트내용03','qna001.jpg',sysdate,sysdate);

insert into tbl_QNA (user_no,user_id, qna_type ,qna_num, qna_title, qna_content,qna_answer, qna_image,qna_date,qna_answerdate)
values ('A107','user4','배송문의',04,'QnA 테스트04','QnA 테스트내용04','QnA 테스트내용03','qna001.jpg',sysdate,sysdate);

insert into tbl_QNA (user_no,user_id, qna_type ,qna_num, qna_title, qna_content,qna_answer, qna_image,qna_date,qna_answerdate)
values ('A108','user5','환불문의',05,'QnA 테스트05','QnA 테스트내용05','QnA 테스트내용05','qna001.jpg',sysdate,sysdate);

insert into tbl_QNA (user_no,user_id, qna_type ,qna_num, qna_title, qna_content,qna_answer, qna_image,qna_date,qna_answerdate)
values ('A109','user6','배송문의',06,'QnA 테스트06','QnA 테스트내용06','QnA 테스트내용06','qna001.jpg',sysdate,sysdate);

insert into tbl_QNA (user_no,user_id, qna_type ,qna_num, qna_title, qna_content,qna_answer, qna_image,qna_date,qna_answerdate)
values ('A110','user7','기타문의',07,'QnA 테스트07','QnA 테스트내용07','QnA 테스트내용07','qna001.jpg',sysdate,sysdate);

insert into tbl_QNA (user_no,user_id, qna_type ,qna_num, qna_title, qna_content,qna_answer, qna_image,qna_date,qna_answerdate)
values ('A101','user2','환불문의',08,'QnA 테스트08','QnA 테스트내용08','QnA 테스트내용08','qna002.jpg',sysdate,sysdate);