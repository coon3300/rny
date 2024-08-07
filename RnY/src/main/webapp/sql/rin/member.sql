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
					             user_point number(10), -- 포인트
					             user_coupon number(10), -- 쿠폰
                       user_date date default sysdate, -- 가입일자
                       responsibility varchar2(10)default 'user', -- 권한
                       CONSTRAINT pk_user_no PRIMARY key(user_no), -- 회원고유번호PK
                       CONSTRAINT uk_user_id UNIQUE(user_id), -- 아이디 유니크
                       CONSTRAINT uk_user_email UNIQUE (user_email)); -- 이메일 유니크
					   


-- 회원데이터 삽입
INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add) 
VALUES ('A' || seq_member.NEXTVAL, 'user1', '1111', '김동훈', '김대장', '1990-01-01', '010-1234-5678', 'user1@example.com', '서울특별시 강남구 테헤란로 123');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add)
VALUES('A' || seq_member.NEXTVAL, 'user2', '2222', '배은찬', '김감치', '1985-05-05', '010-2345-6789', 'user2@example.com', '서울특별시 서초구 서초대로 456');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add)
VALUES('A' || seq_member.NEXTVAL, 'user3', '3333', '하린아', '링링', '1995-12-12', '010-3456-7890', 'user3@example.com', '경기도 성남시 분당구 불정로 789');

INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add)
VALUES('A' || seq_member.NEXTVAL, 'user4', '4444', '하린아', '안옒', '1995-12-12', '010-3456-7890', 'user4@example.com', '경기도 성남시 분당구 불정로 789');
		
-- 관리자 데이터 삽입
INSERT INTO rny_member (user_no, user_id, user_pw, user_name, user_nick, user_birth, user_phone, user_email, user_add, responsibility)
VALUES('A' || seq_member.NEXTVAL, 'admin01', '1111', '이창호', '창호홈', '1988-02-12', '010-5678-7890', 'admin01@example.com', '경기도 성남시 분당구 불정로 789', 'admin');
        		

=======================================================================================

-- 주소관리 테이블
CREATE TABLE rny_address(
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