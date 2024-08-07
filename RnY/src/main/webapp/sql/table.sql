-- 2. line 테이블 생성
CREATE TABLE tbl_line (
    line_no NUMBER,
    line_parent_no NUMBER,
    line_name VARCHAR2(100) NOT NULL,
    line_desc VARCHAR(100),    
    created_date DATE DEFAULT SYSDATE NOT NULL, 
    updated_date DATE DEFAULT SYSDATE NOT NULL, 
    disabled_date DATE, 
    is_disabled NUMBER(1) DEFAULT 0,
    CONSTRAINT pk_line_no PRIMARY KEY (line_no)
);
CREATE SEQUENCE seq_line_no INCREMENT BY 1 START WITH 1000 MINVALUE 1 NOMAXVALUE NOCYCLE NOCACHE NOORDER;

ALTER TABLE tbl_line
ADD CONSTRAINT uk_tbl_line_line_name UNIQUE (line_name);

ALTER TABLE tbl_line
ADD CONSTRAINT fk_tbl_line_line_parent_no FOREIGN KEY (line_parent_no) REFERENCES tbl_line(line_no);





-- 3. item 테이블 생성
CREATE TABLE tbl_item (
    item_no NUMBER,
    line_no NUMBER,
    item_code VARCHAR2(100) DEFAULT '0' NOT NULL,
    item_name VARCHAR2(100) NOT NULL,
    item_desc VARCHAR2(500) NOT NULL,
    item_price NUMBER(10) NOT NULL,
    item_image VARCHAR2(200),
    item_pet_size VARCHAR2(20),
    item_pet_age_range VARCHAR2(50),
    item_pet_breed VARCHAR2(100),    
    item_stock NUMBER DEFAULT 0 NOT NULL,
    created_date DATE DEFAULT SYSDATE NOT NULL,
    updated_date DATE DEFAULT SYSDATE NOT NULL,
    disabled_date DATE,
    is_disabled NUMBER(1) DEFAULT 0,
    CONSTRAINT pk_item_no PRIMARY KEY (item_no)

);
CREATE SEQUENCE seq_item_no INCREMENT BY 1 START WITH 1 MINVALUE 1 NOMAXVALUE NOCYCLE NOCACHE NOORDER;

CREATE INDEX idx_tbl_item_item_name ON tbl_item(item_name);
CREATE INDEX idx_tbl_item_line_no ON tbl_item(line_no);

ALTER TABLE tbl_item
ADD CONSTRAINT fk_tbl_line_line_no FOREIGN KEY (line_no) REFERENCES tbl_line(line_no);

ALTER TABLE tbl_item
ADD CONSTRAINT uk_tbl_item_item_name UNIQUE (item_name);




-- 2. line 테이블 insert

insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (1,null,'root','1',0);

insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (11,1,'간식','1-1',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (12,1,'사료','1-2',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (13,1,'미용용품','1-3',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (14,1,'패션용품','1-4',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (15,1,'위생용품','1-5',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (16,1,'식기/급수기','1-6',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (17,1,'외출용품','1-7',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (18,1,'장난감/훈련용품','1-8',0);



insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (101,11,'강아지껌','1-1-1',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (102,11,'비스켓/스낵','1-1-2',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (103,11,'수제간식','1-1-3',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (104,11,'육포/사사미','1-1-4',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (105,11,'캔/파우치','1-1-5',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (106,11,'기타간식','1-1-6',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (107,11,'고양이간식','1-1-7',0);


insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (201,12,'건식사료','1-2-1',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (202,12,'습식사료','1-2-2',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (203,12,'우유/분유','1-2-3',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (204,12,'강아지영양제','1-2-4',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (205,12,'고양이사료','1-2-5',0);

insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (301,13,'드라이기','1-3-1',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (302,13,'발톱관리용품','1-3-2',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (303,13,'브러시','1-3-3',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (304,13,'샤워기/타월','1-3-4',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (305,13,'이발기/가위','1-3-5',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (306,13,'기타미용용품','1-3-6',0);


insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (401,14,'레인코트','1-4-1',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (402,14,'신발/양말','1-4-2',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (403,14,'외투','1-4-3',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (404,14,'원피스/올인원','1-4-4',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (405,14,'코스튬','1-4-5',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (406,14,'셔츠/상의','1-4-6',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (407,14,'기타패션용품','1-4-6',0);


insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (501,15,'구강위생용품','1-5-1',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (502,15,'기저귀','1-5-2',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (503,15,'배변봉투','1-5-3',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (504,15,'배변판','1-5-4',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (505,15,'배변패드','1-5-5',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (506,15,'탈취/소독제','1-5-6',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (507,15,'눈/귀 위생용품','1-5-7',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (508,15,'넥카라','1-5-8',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (509,15,'해충방지용품','1-5-9',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (510,15,'고양이화장실','1-5-10',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (511,15,'고양이모래','1-5-11',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (512,15,'기타고양이위생용품','1-5-12',0);

insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (601,16,'급수기','1-6-1',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (602,16,'급식기','1-6-2',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (603,16,'정수기','1-6-3',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (604,16,'사료보관통','1-6-4',0);


insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (701,17,'가슴줄','1-7-1',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (702,17,'리드줄','1-7-2',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (703,17,'목걸이/인식표','1-7-3',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (704,17,'목줄','1-7-4',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (705,17,'유모차','1-7-5',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (706,17,'이동가방/이동장','1-7-6',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (707,17,'차량용캐리어/시트','1-7-7',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (708,17,'입마개','1-7-8',0);


insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (801,18,'공/원반','1-8-1',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (802,18,'인형','1-8-2',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (803,18,'터널/큐브','1-8-2',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (804,18,'훈련용품','1-8-3',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (805,18,'기타장난감','1-8-4',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (806,18,'캣타워','1-8-5',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (807,18,'고양이스크래쳐','1-8-6',0);
insert into tbl_line    (line_no, line_parent_no, line_name, line_desc, is_disabled)
values                  (808,18,'고양이장난감','1-8-7',0);





-- 3. item 테이블 insert
-- 간식 카테고리 (11)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 101, '0', '강아지용 덴탈껌', '치아 건강에 좋은 강아지 덴탈껌입니다.', 15000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 102, '0', '강아지 비스켓', '영양가 있는 강아지 비스켓입니다.', 10000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 103, '0', '수제 강아지 쿠키', '신선한 재료로 만든 수제 강아지 쿠키입니다.', 20000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 104, '0', '강아지 육포', '단백질이 풍부한 강아지 육포입니다.', 18000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 105, '0', '강아지 캔 간식', '영양 만점 강아지 캔 간식입니다.', 3000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 106, '0', '강아지 과일 간식', '신선한 과일로 만든 강아지 간식입니다.', 12000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 107, '0', '고양이 트릿', '맛있는 고양이용 트릿입니다.', 8000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

-- 사료 카테고리 (12)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 201, '0', '프리미엄 건식사료', '영양 균형이 잡힌 프리미엄 건식사료입니다.', 50000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 202, '0', '강아지 습식사료', '신선한 재료로 만든 강아지 습식사료입니다.', 4000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 203, '0', '강아지 우유', '소화가 잘되는 강아지 전용 우유입니다.', 15000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 204, '0', '강아지 종합영양제', '건강한 성장을 돕는 강아지 종합영양제입니다.', 30000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 205, '0', '고양이 사료', '영양 만점 고양이 전용 사료입니다.', 40000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

-- 미용용품 카테고리 (13)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 301, '0', '반려동물 드라이기', '저소음 반려동물 전용 드라이기입니다.', 80000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 302, '0', '강아지 발톱깎이', '안전한 강아지 발톱 관리 도구입니다.', 15000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 303, '0', '강아지 브러시', '부드러운 털 관리용 브러시입니다.', 20000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 304, '0', '강아지 샤워기', '편리한 강아지 전용 샤워기입니다.', 30000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 305, '0', '강아지 이발기', '저소음 강아지 전용 이발기입니다.', 50000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 306, '0', '강아지 향수', '은은한 향의 강아지 전용 향수입니다.', 25000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

-- 패션용품 카테고리 (14)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 401, '0', '강아지 레인코트', '방수 기능이 좋은 강아지 레인코트입니다.', 30000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 402, '0', '강아지 신발', '편안한 착용감의 강아지 신발입니다.', 20000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 403, '0', '강아지 패딩', '따뜻한 강아지용 겨울 패딩입니다.', 40000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 404, '0', '강아지 원피스', '귀여운 디자인의 강아지 원피스입니다.', 25000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 405, '0', '강아지 코스튬', '특별한 날을 위한 강아지 코스튬입니다.', 35000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 406, '0', '강아지 티셔츠', '시원한 소재의 강아지 여름 티셔츠입니다.', 18000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 407, '0', '강아지 모자', '자외선 차단 기능이 있는 강아지 모자입니다.', 15000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

-- 위생용품 카테고리 (15)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 501, '0', '강아지 치약', '구강 건강에 좋은 강아지 전용 치약입니다.', 10000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 502, '0', '강아지 기저귀', '흡수력이 좋은 강아지용 기저귀입니다.', 25000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 503, '0', '강아지 배변봉투', '친환경 소재의 강아지 배변봉투입니다.', 8000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 504, '0', '강아지 배변판', '쉽게 청소할 수 있는 강아지 배변판입니다.', 30000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 505, '0', '강아지 배변패드', '흡수력이 뛰어난 강아지 배변패드입니다.', 20000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 506, '0', '강아지 탈취제', '강력한 탈취 효과의 강아지용 탈취제입니다.', 15000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 507, '0', '강아지 귀 세정제', '안전한 성분의 강아지 귀 세정제입니다.', 18000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 508, '0', '강아지 넥카라', '편안한 착용감의 강아지 넥카라입니다.', 12000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 509, '0', '강아지 해충방지제', '안전한 성분의 강아지용 해충방지제입니다.', 22000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 510, '0', '고양이 화장실', '냄새 차단 기능이 있는 고양이 화장실입니다.', 40000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 511, '0', '고양이 모래', '뛰어난 흡수력의 고양이 모래입니다.', 25000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 512, '0', '고양이 발톱깎이', '안전한 고양이용 발톱깎이입니다.', 15000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

-- 식기/급수기 카테고리 (16)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 601, '0', '강아지 급수기', '위생적인 자동 급수기입니다.', 35000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 601, '0', '강아지 식기', '미끄럼 방지 기능이 있는 스테인리스 식기입니다.', 20000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 601, '0', '강아지 정수기', '깨끗한 물을 제공하는 강아지용 정수기입니다.', 80000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 601, '0', '강아지 사료 보관통', '신선도를 유지하는 밀폐형 사료 보관통입니다.', 30000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

-- 외출용품 카테고리 (17)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 701, '0', '강아지 가슴줄', '안전하고 편안한 착용감의 가슴줄입니다.', 25000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 702, '0', '강아지 리드줄', '탄력있는 소재의 리드줄입니다.', 18000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 703, '0', '강아지 인식표', '개인정보를 새길 수 있는 메탈 인식표입니다.', 15000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 704, '0', '강아지 목줄', '편안한 착용감의 목줄입니다.', 20000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 705, '0', '강아지 유모차', '편안한 승차감의 강아지 전용 유모차입니다.', 150000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 706, '0', '강아지 이동가방', '통풍이 잘되는 강아지 이동가방입니다.', 40000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 707, '0', '강아지 카시트', '안전한 차량 이동을 위한 강아지 카시트입니다.', 70000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 708, '0', '강아지 입마개', '통풍이 잘되는 안전한 입마개입니다.', 15000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

-- 장난감/훈련용품 카테고리 (18)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 801, '0', '강아지 공', '탄력있는 고무 재질의 강아지 공입니다.', 10000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 802, '0', '강아지 인형', '부드러운 촉감의 강아지 인형입니다.', 15000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 803, '0', '강아지 터널', '접이식 강아지 놀이 터널입니다.', 30000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 804, '0', '강아지 훈련용 클리커', '효과적인 훈련을 위한 클리커입니다.', 8000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 805, '0', '강아지 노즈워크 매트', '두뇌 발달에 좋은 노즈워크 매트입니다.', 25000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 806, '0', '고양이 캣타워', '견고하고 안정적인 대형 캣타워입니다.', 150000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 807, '0', '고양이 스크래쳐', '튼튼한 소재의 고양이 스크래쳐입니다.', 20000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 808, '0', '고양이 낚시대', '재미있는 움직임의 고양이 장난감입니다.', 12000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);







SELECT 
        level,
        lpad(' ', 4 * (LEVEL - 1)) || line_no as line,
        line_no,
        line_parent_no,
        line_name,
        line_desc,
        is_disabled
    FROM
        tbl_line
    WHERE   is_disabled = 0
    START WITH line_parent_no IS NULL
    CONNECT BY PRIOR line_no = line_parent_no
    ORDER BY LEVEL, line_parent_no, line_no;
    commit;
    
    		SELECT 
		    level,
		    line_no,
		    line_parent_no,
		    line_name
		FROM
		    tbl_line
    WHERE   is_disabled = 0    
		START WITH line_parent_no IS NULL
		CONNECT BY PRIOR line_no = line_parent_no
		ORDER BY LEVEL, line_parent_no, line_no  		;
  
    commit;
