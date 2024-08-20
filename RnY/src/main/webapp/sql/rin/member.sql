중간 프로젝트
-오라클 관리자에서 실행 후 생성 
create user rny03 identified by rny03; 
grant connect, resource to rny03;
alter user rny03 default tablespace users quota unlimited on users;

-- <user_no>시퀀스 생성
CREATE SEQUENCE seq_member START with 100
increment by 1; 

-- 회원관리 테이블
CREATE TABLE rny_member(
                       user_no varchar2(30), -- 회원고유번호
                       user_id varchar2(40) not null, -- 아이디
                       user_pw varchar2(100) not null, -- 비밀번호
                       user_name varchar2(20) not null, -- 이름
                       user_nick varchar2(30) not null, -- 닉네임
                       user_birth date not null, -- 생년월일
                       user_phone varchar2(30) not null, -- 폰번호
                       user_email varchar2(50) not null, -- 이메일
                       user_add varchar2(200) not null, -- 주소
                       main_add  varchar2(200),
                       user_date date default sysdate, -- 가입일자
                       responsibility varchar2(10)default 'user', -- 권한
                       CONSTRAINT pk_user_no PRIMARY key(user_no), -- 회원고유번호PK
                       CONSTRAINT uk_user_id UNIQUE(user_id), -- 아이디 유니크
                       CONSTRAINT uk_user_email UNIQUE (user_email)); -- 이메일 유니크					   


-- 회원데이터 삽입
INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user1', '1111', '변요한', '요한', '1990-01-01', '010-1234-5678', 'user1@example.com', '서울특별시 강남구 테헤란로 123');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user2', '1111', '이준호', '이군', '1991-02-02', '010-2345-6789', 'user2@example.com', '서울특별시 강남구 테헤란로 456');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user3', '1111', '박지성', '박캡틴', '1992-03-03', '010-3456-7890', 'user3@example.com', '서울특별시 강남구 테헤란로 789');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user4', '1111', '김연아', '연아퀸', '1993-04-04', '010-4567-8901', 'user4@example.com', '서울특별시 강남구 테헤란로 101');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user5', '1111', '손흥민', '흥민이', '1994-05-05', '010-5678-9012', 'user5@example.com', '서울특별시 강남구 테헤란로 202');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user6', '1111', '류현진', '류현', '1995-06-06', '010-6789-0123', 'user6@example.com', '서울특별시 강남구 테헤란로 303');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user7', '1111', '최지우', '지우', '1996-07-07', '010-7890-1234', 'user7@example.com', '서울특별시 강남구 테헤란로 404');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user8', '1111', '정우성', '우성', '1997-08-08', '010-8901-2345', 'user8@example.com', '서울특별시 강남구 테헤란로 505');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user9', '1111', '이영애', '영애', '1998-09-09', '010-9012-3456', 'user9@example.com', '서울특별시 강남구 테헤란로 606');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user10', '1111', '장동건', '동건', '1999-10-10', '010-0123-4567', 'user10@example.com', '서울특별시 강남구 테헤란로 707');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user11', '1111', '이민정', '민정', '1990-11-11', '010-1111-2222', 'user11@example.com', '서울특별시 강남구 테헤란로 808');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user12', '1111', '김수현', '수현', '1991-12-12', '010-2222-3333', 'user12@example.com', '서울특별시 강남구 테헤란로 909');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user13', '1111', '송혜교', '혜교', '1992-01-13', '010-3333-4444', 'user13@example.com', '서울특별시 강남구 테헤란로 1010');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user14', '1111', '정혜성', '혜성', '1993-02-14', '010-4444-5555', 'user14@example.com', '서울특별시 강남구 테헤란로 1111');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user15', '1111', '한지민', '지민', '1994-03-15', '010-5555-6666', 'user15@example.com', '서울특별시 강남구 테헤란로 1212');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user16', '1111', '강동원', '동원', '1995-04-16', '010-6666-7777', 'user16@example.com', '서울특별시 강남구 테헤란로 1313');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user17', '1111', '김우빈', '우빈', '1996-05-17', '010-7777-8888', 'user17@example.com', '서울특별시 강남구 테헤란로 1414');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user18', '1111', '박보검', '보검', '1997-06-18', '010-8888-9999', 'user18@example.com', '서울특별시 강남구 테헤란로 1515');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user19', '1111', '유아인', '아인', '1998-07-19', '010-9999-0000', 'user19@example.com', '서울특별시 강남구 테헤란로 1616');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user20', '1111', '공유', '공유', '1999-08-20', '010-0000-1111', 'user20@example.com', '서울특별시 강남구 테헤란로 1717');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user21', '1111', '송중기', '중기', '1990-09-21', '010-1111-2222', 'user21@example.com', '서울특별시 강남구 테헤란로 1818');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user22', '1111', '이종석', '종석', '1991-10-22', '010-2222-3333', 'user22@example.com', '서울특별시 강남구 테헤란로 1919');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user23', '1111', '김태희', '태희', '1992-11-23', '010-3333-4444', 'user23@example.com', '서울특별시 강남구 테헤란로 2020');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user24', '1111', '유재석', '재석', '1993-12-24', '010-4444-5555', 'user24@example.com', '서울특별시 강남구 테헤란로 2121');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user25', '1111', '박명수', '명수', '1994-01-25', '010-5555-6666', 'user25@example.com', '서울특별시 강남구 테헤란로 2222');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user26', '1111', '이효리', '효리', '1995-02-26', '010-6666-7777', 'user26@example.com', '서울특별시 강남구 테헤란로 2323');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user27', '1111', '정형돈', '형돈', '1996-03-27', '010-7777-8888', 'user27@example.com', '서울특별시 강남구 테헤란로 2424');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user28', '1111', '유상무', '상무', '1997-04-28', '010-8888-9999', 'user28@example.com', '서울특별시 강남구 테헤란로 2525');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user29', '1111', '김제동', '제동', '1998-05-29', '010-9999-0000', 'user29@example.com', '서울특별시 강남구 테헤란로 2626');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user30', '1111', '노홍철', '홍철', '1999-06-30', '010-0000-1111', 'user30@example.com', '서울특별시 강남구 테헤란로 2727');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user31', '1111', '하하', '하하', '1990-07-31', '010-1111-2222', 'user31@example.com', '서울특별시 강남구 테헤란로 2828');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user32', '1111', '박정민', '정민', '1991-08-01', '010-2222-3333', 'user32@example.com', '서울특별시 강남구 테헤란로 2929');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user33', '1111', '조인성', '인성', '1992-09-02', '010-3333-4444', 'user33@example.com', '서울특별시 강남구 테헤란로 3030');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user34', '1111', '고아라', '아라', '1993-10-03', '010-4444-5555', 'user34@example.com', '서울특별시 강남구 테헤란로 3131');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user35', '1111', '이청아', '청아', '1994-11-04', '010-5555-6666', 'user35@example.com', '서울특별시 강남구 테헤란로 3232');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user36', '1111', '박해진', '해진', '1995-12-05', '010-6666-7777', 'user36@example.com', '서울특별시 강남구 테헤란로 3333');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user37', '1111', '김지석', '지석', '1996-01-06', '010-7777-8888', 'user37@example.com', '서울특별시 강남구 테헤란로 3434');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user38', '1111', '김성오', '성오', '1997-02-07', '010-8888-9999', 'user38@example.com', '서울특별시 강남구 테헤란로 3535');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user39', '1111', '김우성', '우성', '1998-03-08', '010-9999-0000', 'user39@example.com', '서울특별시 강남구 테헤란로 3636');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user40', '1111', '박시후', '시후', '1999-04-09', '010-0000-1111', 'user40@example.com', '서울특별시 강남구 테헤란로 3737');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user41', '1111', '오지호', '지호', '1990-05-10', '010-1111-2222', 'user41@example.com', '서울특별시 강남구 테헤란로 3838');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user42', '1111', '장혁', '혁이', '1991-06-11', '010-2222-3333', 'user42@example.com', '서울특별시 강남구 테헤란로 3939');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user43', '1111', '정우성', '우성', '1992-07-12', '010-3333-4444', 'user43@example.com', '서울특별시 강남구 테헤란로 4040');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user44', '1111', '김희선', '희선', '1993-08-13', '010-4444-5555', 'user44@example.com', '서울특별시 강남구 테헤란로 4141');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user45', '1111', '김혜수', '혜수', '1994-09-14', '010-5555-6666', 'user45@example.com', '서울특별시 강남구 테헤란로 4242');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user46', '1111', '김하늘', '하늘', '1995-10-15', '010-6666-7777', 'user46@example.com', '서울특별시 강남구 테헤란로 4343');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user47', '1111', '김성수', '성수', '1996-11-16', '010-7777-8888', 'user47@example.com', '서울특별시 강남구 테헤란로 4444');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user48', '1111', '박진영', '진영', '1997-12-17', '010-8888-9999', 'user48@example.com', '서울특별시 강남구 테헤란로 4545');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user49', '1111', '이승기', '승기', '1998-01-18', '010-9999-0000', 'user49@example.com', '서울특별시 강남구 테헤란로 4646');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user50', '1111', '유노윤호', '윤호', '1999-02-19', '010-0000-1111', 'user50@example.com', '서울특별시 강남구 테헤란로 4747');
		
-- 관리자 데이터 삽입
INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add, responsibility)
VALUES('A' || seq_member.NEXTVAL, 'admin01', '1111', '이창호', '창호홈', '1988-02-12', '010-5678-7890', 'admin01@example.com', '경기도 성남시 분당구 불정로 789', 'admin');
        
SELECT * from rny_member;
		

=======================================================================================
CREATE SEQUENCE seq_address START with 100
increment by 1; 

-- 주소관리 테이블
CREATE TABLE rny_address(
	           main_add  varchar2(200),
                       user_no varchar2(30), -- 회원고유번호
                       add_name varchar2(30) not null, -- 주소지이름
                       recipient varchar2(20) not null, -- 수령인
                       add_phone varchar2(30) not null, -- 폰번호
                       new_address varchar2(200) not null, -- 새주소
                       CONSTRAINT fk_user_no FOREIGN KEY(user_no) REFERENCES rny_member(user_no)); 

-- 예제데이터
INSERT INTO rny_address (user_no, add_name, recipient, add_phone, new_address)
VALUES ('A100', '집', '홍길동', '010-1234-5678', '서울특별시 강남구 테헤란로 123');

INSERT INTO rny_address (user_no, add_name, recipient, add_phone, new_address)
VALUES ('A101', '회사', '김철수', '010-2345-6789', '서울특별시 서초구 서초대로 456');

INSERT INTO rny_address (user_no, add_name, recipient, add_phone, new_address)
VALUES ('A102', '친구집', '이영희', '010-3456-7890', '경기도 성남시 분당구 불정로 789');

SELECT * from rny_address;