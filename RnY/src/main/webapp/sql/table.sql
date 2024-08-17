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
    item_code VARCHAR2(100) DEFAULT '0',
    item_name VARCHAR2(100) NOT NULL,
    item_desc VARCHAR2(500),
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




-- 간식 카테고리 (11)
-- 강아지용 덴탈껌 (line_no: 101)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 101, '0', '강아지용 덴탈껌 S', '작은 견종을 위한 치아 건강 덴탈껌입니다.', 12000, 'image1.jpg', 'small', '전 연령', '소형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 101, '0', '강아지용 덴탈껌 M', '중형견을 위한 치아 건강 덴탈껌입니다.', 15000, 'image1.jpg', 'medium', '전 연령', '중형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 101, '0', '강아지용 덴탈껌 L', '대형견을 위한 치아 건강 덴탈껌입니다.', 18000, 'image1.jpg', 'large', '전 연령', '대형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 101, '0', '강아지용 덴탈껌 치킨맛', '치킨 맛이 나는 치아 건강 덴탈껌입니다.', 16000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 101, '0', '강아지용 덴탈껌 비프맛', '소고기 맛이 나는 치아 건강 덴탈껌입니다.', 16000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 101, '0', '강아지용 덴탈껌 양고기맛', '양고기 맛이 나는 치아 건강 덴탈껌입니다.', 17000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 101, '0', '강아지용 덴탈껌 채소맛', '채소 맛이 나는 치아 건강 덴탈껌입니다.', 15000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 101, '0', '강아지용 덴탈껌 퍼피', '어린 강아지를 위한 부드러운 덴탈껌입니다.', 14000, 'image1.jpg', 'free size', '퍼피', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 101, '0', '강아지용 덴탈껌 시니어', '노령견을 위한 부드러운 덴탈껌입니다.', 16000, 'image1.jpg', 'free size', '시니어', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 101, '0', '강아지용 덴탈껌 저알러지', '알러지가 있는 강아지를 위한 덴탈껌입니다.', 18000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

-- 강아지 비스켓 (line_no: 102)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 102, '0', '강아지 비스켓 오리지널', '클래식한 맛의 강아지 비스켓입니다.', 10000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 102, '0', '강아지 비스켓 치즈맛', '치즈 맛이 나는 강아지 비스켓입니다.', 11000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 102, '0', '강아지 비스켓 고구마맛', '고구마 맛이 나는 강아지 비스켓입니다.', 11000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 102, '0', '강아지 비스켓 연어맛', '연어 맛이 나는 강아지 비스켓입니다.', 12000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 102, '0', '강아지 비스켓 당근맛', '당근 맛이 나는 강아지 비스켓입니다.', 10500, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 102, '0', '강아지 비스켓 미니', '작은 크기의 강아지 비스켓입니다.', 9500, 'image2.jpg', 'small', '전 연령', '소형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 102, '0', '강아지 비스켓 대용량', '대용량 패키지의 강아지 비스켓입니다.', 18000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 102, '0', '강아지 비스켓 저지방', '다이어트 중인 강아지를 위한 저지방 비스켓입니다.', 12000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 102, '0', '강아지 비스켓 곡물프리', '곡물 알러지가 있는 강아지를 위한 비스켓입니다.', 13000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 102, '0', '강아지 비스켓 혼합맛', '다양한 맛이 섞인 강아지 비스켓 모음입니다.', 14000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

-- 수제간식 (line_no: 103)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 103, '0', '수제 강아지 쿠키 오리지널', '건강한 재료로 만든 수제 강아지 쿠키입니다.', 15000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 103, '0', '수제 강아지 쿠키 땅콩버터', '땅콩버터 맛 수제 강아지 쿠키입니다.', 16000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 103, '0', '수제 강아지 쿠키 치즈', '치즈 맛 수제 강아지 쿠키입니다.', 16000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 103, '0', '수제 강아지 머핀', '신선한 과일이 들어간 수제 강아지 머핀입니다.', 18000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 103, '0', '수제 강아지 케이크', '강아지 생일을 위한 특별한 수제 케이크입니다.', 25000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 103, '0', '수제 강아지 육포', '국내산 소고기로 만든 수제 육포입니다.', 20000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 103, '0', '수제 강아지 치킨 져키', '국내산 닭가슴살로 만든 수제 져키입니다.', 18000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 103, '0', '수제 강아지 야채칩', '건강한 야채로 만든 수제 야채칩입니다.', 14000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 103, '0', '수제 강아지 요구르트 트릿', '프로바이오틱스가 풍부한 요구르트 트릿입니다.', 17000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

-- 육포/사사미 (line_no: 104)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 104, '0', '소고기 육포 오리지널', '100% 소고기로 만든 육포입니다.', 20000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 104, '0', '소고기 육포 치즈맛', '치즈 풍미가 가미된 소고기 육포입니다.', 22000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 104, '0', '닭가슴살 사사미', '부드러운 닭가슴살 사사미입니다.', 18000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 104, '0', '오리 육포', '담백한 오리 육포입니다.', 23000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 104, '0', '연어 육포', '오메가3가 풍부한 연어 육포입니다.', 25000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 104, '0', '양고기 육포', '특별한 양고기로 만든 육포입니다.', 24000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 104, '0', '칠면조 육포', '저지방 칠면조 육포입니다.', 21000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 104, '0', '소고기 육포 대용량', '대용량 패키지의 소고기 육포입니다.', 35000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 104, '0', '믹스 육포 세트', '다양한 종류의 육포를 한 번에 즐길 수 있는 세트입니다.', 30000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

-- 캔/파우치 (line_no: 105)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 105, '0', '강아지 습식사료 소고기맛', '영양 만점 소고기맛 캔 사료입니다.', 3000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 105, '0', '강아지 습식사료 닭고기맛', '부드러운 닭고기맛 캔 사료입니다.', 3000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 105, '0', '강아지 습식사료 연어맛', '오메가3가 풍부한 연어맛 캔 사료입니다.', 3500, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 105, '0', '강아지 습식사료 양고기맛', '특별한 양고기맛 캔 사료입니다.', 3500, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 105, '0', '강아지 파우치 소고기n야채', '신선한 야채가 들어간 소고기맛 파우치입니다.', 2500, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 105, '0', '강아지 파우치 닭고기n고구마', '영양 만점 닭고기와 고구마 파우치입니다.', 2500, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 105, '0', '강아지 파우치 연어n감자', '피부 건강에 좋은 연어와 감자 파우치입니다.', 3000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 105, '0', '강아지 습식사료 퍼피용', '성장기 강아지를 위한 특별 레시피 캔 사료입니다.', 3500, 'image9.jpg', 'free size', '퍼피', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 105, '0', '강아지 습식사료 시니어용', '노령견을 위한 부드러운 질감의 캔 사료입니다.', 3500, 'image1.jpg', 'free size', '시니어', '전 품종', 100);

-- 기타간식 (line_no: 106)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 106, '0', '강아지 요구르트', '유산균이 풍부한 강아지용 요구르트입니다.', 5000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 106, '0', '강아지 치즈 큐브', '칼슘이 풍부한 치즈 큐브 간식입니다.', 7000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 106, '0', '강아지 과일 젤리', '신선한 과일로 만든 젤리 간식입니다.', 6000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 106, '0', '강아지 야채 스틱', '각종 야채로 만든 건강 간식입니다.', 5500, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 106, '0', '강아지 껌 믹스', '다양한 맛의 껌을 한 번에 즐길 수 있는 세트입니다.', 10000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 106, '0', '강아지 치킨 팝콘', '닭가슴살로 만든 팝콘 모양의 간식입니다.', 8000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 106, '0', '강아지 치약 껌', '치아 건강에 좋은 치약 맛 껌입니다.', 9000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 106, '0', '강아지 무염 건조 오징어', '저염 처리된 건조 오징어 간식입니다.', 11000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 106, '0', '강아지 당근 칩', '바삭한 당근으로 만든 건강 간식입니다.', 7500, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

-- 고양이간식 (line_no: 107)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 107, '0', '고양이 츄르', '고양이가 좋아하는 부드러운 츄르 간식입니다.', 1500, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 107, '0', '고양이 동결건조 간식', '영양 손실 없는 동결건조 생선 간식입니다.', 9000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 107, '0', '고양이 캣닢', '고양이의 스트레스 해소에 좋은 캣닢입니다.', 5000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 107, '0', '고양이 참치 큐브', '신선한 참치로 만든 큐브 형태의 간식입니다.', 7000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 107, '0', '고양이 치킨 트릿', '부드러운 닭가슴살로 만든 트릿입니다.', 6500, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 107, '0', '고양이 연어 스틱', '오메가3가 풍부한 연어 스틱 간식입니다.', 8000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 107, '0', '고양이 닭간 트릿', '영양가 높은 닭간으로 만든 트릿입니다.', 7500, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 107, '0', '고양이 크리미 수프', '부드러운 크림 수프 형태의 간식입니다.', 2000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 107, '0', '고양이 치즈 볼', '치즈를 함유한 바삭한 볼 형태의 간식입니다.', 6000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

-- 건식사료 (line_no: 201)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 201, '0', '프리미엄 강아지 사료', '영양 균형이 잡힌 프리미엄 건식사료입니다.', 50000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 201, '0', '퍼피 전용 사료', '성장기 강아지를 위한 특별 배합 사료입니다.', 55000, 'image3.jpg', 'free size', '퍼피', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 201, '0', '시니어 전용 사료', '노령견을 위한 저칼로리 사료입니다.', 53000, 'image4.jpg', 'free size', '시니어', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 201, '0', '곡물 프리 사료', '알러지가 있는 강아지를 위한 곡물 없는 사료입니다.', 60000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 201, '0', '다이어트 사료', '체중 관리가 필요한 강아지를 위한 저지방 사료입니다.', 52000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 201, '0', '소형견 전용 사료', '작은 입자의 소형견 맞춤 사료입니다.', 48000, 'image7.jpg', 'small', '전 연령', '소형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 201, '0', '대형견 전용 사료', '큰 입자의 대형견 맞춤 사료입니다.', 58000, 'image8.jpg', 'large', '전 연령', '대형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 201, '0', '피부n피모 케어 사료', '피부와 털 건강에 좋은 성분이 함유된 사료입니다.', 56000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 201, '0', '관절 케어 사료', '관절 건강에 도움을 주는 성분이 함유된 사료입니다.', 57000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 201, '0', '치아 케어 사료', '치아 건강에 좋은 성분이 함유된 사료입니다.', 54000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

-- 습식사료 (line_no: 202)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 202, '0', '프리미엄 습식사료 소고기맛', '영양가 높은 소고기 습식사료입니다.', 3500, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 202, '0', '프리미엄 습식사료 닭고기맛', '부드러운 닭고기 습식사료입니다.', 3500, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 202, '0', '프리미엄 습식사료 연어맛', '오메가3가 풍부한 연어 습식사료입니다.', 4000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 202, '0', '퍼피 전용 습식사료', '성장기 강아지를 위한 영양 습식사료입니다.', 3800, 'image6.jpg', 'free size', '퍼피', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 202, '0', '시니어 전용 습식사료', '노령견을 위한 부드러운 습식사료입니다.', 3800, 'image7.jpg', 'free size', '시니어', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 202, '0', '다이어트 습식사료', '체중 관리가 필요한 강아지를 위한 저칼로리 습식사료입니다.', 3700, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 202, '0', '소화기 케어 습식사료', '소화가 잘되는 재료로 만든 습식사료입니다.', 4000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 202, '0', '알러지 케어 습식사료', '알러지 반응이 적은 재료로 만든 습식사료입니다.', 4200, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 202, '0', '습식사료 믹스팩', '다양한 맛을 즐길 수 있는 습식사료 세트입니다.', 15000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

-- 우유/분유 (line_no: 203)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 203, '0', '강아지 전용 우유', '소화가 잘되는 강아지용 우유입니다.', 3000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 203, '0', '퍼피 전용 분유', '성장기 강아지를 위한 영양 분유입니다.', 25000, 'image4.jpg', 'free size', '퍼피', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 203, '0', '락토프리 강아지 우유', '유당을 제거한 소화가 잘되는 우유입니다.', 3500, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 203, '0', '고양이 전용 우유', '고양이를 위해 특별히 제조된 우유입니다.', 3000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 203, '0', '강아지 요구르트 NEW', '유산균이 풍부한 강아지용 요구르트입니다.', 4000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 203, '0', '강아지 두유', '식물성 단백질이 풍부한 강아지용 두유입니다.', 3500, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 203, '0', '강아지 치즈 우유', '칼슘이 풍부한 치즈 맛 우유입니다.', 3500, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 203, '0', '강아지 과일 요구르트', '과일 맛이 나는 요구르트입니다.', 4000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 203, '0', '강아지 곡물 우유', '곡물을 넣어 만든 영양 우유입니다.', 3500, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

-- 강아지영양제 (line_no: 204)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 204, '0', '종합 영양제', '강아지의 전반적인 건강을 위한 종합 영양제입니다.', 30000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 204, '0', '관절 영양제', '관절 건강에 도움을 주는 영양제입니다.', 35000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 204, '0', '피부 영양제', '피부와 모질 개선에 도움을 주는 영양제입니다.', 32000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 204, '0', '눈 건강 영양제', '눈 건강에 도움을 주는 영양제입니다.', 28000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 204, '0', '장 건강 영양제', '소화기 건강에 도움을 주는 프로바이오틱스 영양제입니다.', 25000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 204, '0', '치아 영양제', '치아와 구강 건강에 도움을 주는 영양제입니다.', 22000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 204, '0', '노령견 전용 영양제', '노령견의 전반적인 건강을 위한 영양제입니다.', 38000, 'image9.jpg', 'free size', '시니어', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 204, '0', '퍼피 전용 영양제', '성장기 강아지를 위한 종합 영양제입니다.', 33000, 'image1.jpg', 'free size', '퍼피', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 204, '0', '면역력 강화 영양제', '면역력 증진에 도움을 주는 영양제입니다.', 29000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 204, '0', '칼슘 영양제', '뼈와 치아 건강에 도움을 주는 칼슘 영양제입니다.', 26000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

-- 고양이사료 (line_no: 205)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 205, '0', '프리미엄 고양이 건식사료', '영양 균형이 잡힌 프리미엄 고양이 사료입니다.', 45000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 205, '0', '키튼 전용 사료', '성장기 고양이를 위한 특별 배합 사료입니다.', 48000, 'image5.jpg', 'free size', '키튼', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 205, '0', '시니어 고양이 사료', '노령 고양이를 위한 저칼로리 사료입니다.', 47000, 'image6.jpg', 'free size', '시니어', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 205, '0', '실내 고양이용 사료', '실내에서 생활하는 고양이를 위한 사료입니다.', 46000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 205, '0', '헤어볼 케어 사료', '헤어볼 배출에 도움을 주는 사료입니다.', 49000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 205, '0', '체중 관리용 고양이 사료', '체중 관리가 필요한 고양이를 위한 저지방 사료입니다.', 47000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 205, '0', '그레인프리 고양이 사료', '곡물 알러지가 있는 고양이를 위한 사료입니다.', 52000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 205, '0', '고양이 습식사료', '수분 섭취가 부족한 고양이를 위한 습식사료입니다.', 2500, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 205, '0', '피부n피모 케어 고양이 사료', '피부와 털 건강에 좋은 성분이 함유된 사료입니다.', 50000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 205, '0', '고양이 사료 샘플러 팩', '다양한 종류의 고양이 사료를 맛볼 수 있는 샘플러 팩입니다.', 15000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

-- 드라이기 (line_no: 301)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 301, '0', '저소음 반려동물 드라이기', '소음이 적은 반려동물 전용 드라이기입니다.', 80000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 301, '0', '2단계 온도조절 드라이기', '온도를 2단계로 조절할 수 있는 드라이기입니다.', 70000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 301, '0', '핸즈프리 드라이기 스탠드', '양손을 자유롭게 사용할 수 있는 드라이기 스탠드입니다.', 30000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 301, '0', '휴대용 미니 드라이기', '여행시 편리한 소형 드라이기입니다.', 40000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 301, '0', '프로페셔널 펫 드라이기', '전문가용 고성능 드라이기입니다.', 150000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 301, '0', '따뜻한 바람 전용 드라이기', '차가운 바람 없이 따뜻한 바람만 나오는 드라이기입니다.', 60000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 301, '0', '음이온 케어 드라이기', '음이온으로 모발 관리가 가능한 드라이기입니다.', 90000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 301, '0', '강력 송풍 드라이기', '대형견에게 적합한 강력한 바람의 드라이기입니다.', 100000, 'image3.jpg', 'large', '전 연령', '대형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 301, '0', '온도감지 안전 드라이기', '과열 방지 기능이 있는 안전한 드라이기입니다.', 85000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

-- 발톱관리용품 (line_no: 302)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 302, '0', '기본형 발톱깎이', '사용하기 쉬운 기본형 발톱깎이입니다.', 15000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 302, '0', '안전 가드 발톱깎이', '과도한 절삭을 방지하는 안전 가드가 있는 발톱깎이입니다.', 20000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 302, '0', '전동 발톱 그라인더', '부드럽게 발톱을 갈 수 있는 전동 그라인더입니다.', 35000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 302, '0', '발톱 사포', '발톱을 부드럽게 다듬을 수 있는 사포입니다.', 5000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 302, '0', '발톱 가위', '곡선 모양의 날카로운 발톱 가위입니다.', 18000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 302, '0', '발톱 관리 세트', '다양한 발톱 관리 도구가 포함된 세트입니다.', 40000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 302, '0', '발톱 영양제', '발톱 건강에 도움을 주는 영양제입니다.', 25000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 302, '0', '발톱 미용 장갑', '발톱을 자연스럽게 갈 수 있는 미용 장갑입니다.', 12000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 302, '0', '발톱 염색제', '발톱을 예쁘게 꾸밀 수 있는 안전한 염색제입니다.', 15000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

-- 브러시 (line_no: 303)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 303, '0', '기본형 슬리커 브러시', '일반적인 털 관리용 슬리커 브러시입니다.', 15000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 303, '0', '부드러운 핀 브러시', '민감한 피부의 반려동물을 위한 부드러운 핀 브러시입니다.', 18000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 303, '0', '이중모 브러시', '겉털과 속털 관리가 동시에 가능한 이중모 브러시입니다.', 22000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 303, '0', '고무 브러시', '목욕 시 사용하기 좋은 마사지 효과가 있는 고무 브러시입니다.', 12000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 303, '0', '장모용 레이크 코움', '긴 털을 가진 반려동물을 위한 레이크 코움입니다.', 20000, 'image9.jpg', 'free size', '전 연령', '장모종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 303, '0', '언더코트 레이크', '속털 제거에 효과적인 언더코트 레이크입니다.', 25000, 'image1.jpg', 'free size', '전 연령', '이중모종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 303, '0', '셀프 클리닝 브러시', '사용 후 쉽게 청소할 수 있는 셀프 클리닝 브러시입니다.', 28000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 303, '0', '전기 브러시', '자동으로 회전하는 전기 브러시입니다.', 35000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 303, '0', '미니 브러시', '얼굴이나 발 등 세밀한 부위 관리용 미니 브러시입니다.', 10000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

-- 샤워기/타월 (line_no: 304)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 304, '0', '핸드헬드 펫 샤워기', '손에 쥐고 사용하는 편리한 펫 전용 샤워기입니다.', 25000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 304, '0', '샤워 헤드 어댑터', '일반 샤워기에 연결하여 사용하는 펫 전용 어댑터입니다.', 15000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 304, '0', '360도 회전 샤워기', '모든 방향에서 물을 뿌릴 수 있는 360도 회전 샤워기입니다.', 30000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 304, '0', '마사지 샤워기', '마사지 효과가 있는 샤워기입니다.', 28000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 304, '0', '초흡수 펫 타월', '물 흡수력이 뛰어난 대형 타월입니다.', 20000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 304, '0', '마이크로파이버 타월', '부드럽고 흡수력 좋은 마이크로파이버 타월입니다.', 18000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 304, '0', '펫 가운', '목욕 후 입힐 수 있는 흡수력 좋은 가운입니다.', 25000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 304, '0', '샤워 방수 앞치마', '목욕 시 착용하는 방수 앞치마입니다.', 15000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 304, '0', '발 세척 컵', '반려동물의 발을 씻기는데 편리한 컵입니다.', 10000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

-- 이발기/가위 (line_no: 305)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 305, '0', '저소음 펫 이발기', '조용한 모터로 작동하는 반려동물용 이발기입니다.', 50000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 305, '0', '무선 충전식 이발기', '편리한 무선 사용이 가능한 충전식 이발기입니다.', 60000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 305, '0', '전문가용 펫 미용 가위', '날카로운 날을 가진 전문가용 미용 가위입니다.', 40000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 305, '0', '슬라이딩 커트 가위', '털을 얇게 정리할 수 있는 슬라이딩 커트 가위입니다.', 35000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 305, '0', '안전 팁 장착 이발기', '피부 보호를 위한 안전 팁이 장착된 이발기입니다.', 55000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 305, '0', '다양한 길이 콤 세트', '다양한 길이 조절이 가능한 콤 세트입니다.', 20000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 305, '0', '전문가용 펫 미용 세트', '이발기, 가위 등이 포함된 전문가용 미용 세트입니다.', 100000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 305, '0', '초보자용 펫 미용 키트', '초보자도 쉽게 사용할 수 있는 미용 키트입니다.', 70000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 305, '0', '미용 가위 세트', '다양한 용도의 가위가 포함된 세트입니다.', 45000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

-- 기타미용용품 (line_no: 306)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 306, '0', '펫 전용 샴푸', '저자극성 펫 전용 샴푸입니다.', 15000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 306, '0', '펫 컨디셔너', '모질 개선에 도움을 주는 펫 전용 컨디셔너입니다.', 18000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 306, '0', '귀 세정제', '귀 건강 관리를 위한 세정제입니다.', 12000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 306, '0', '눈물 자국 제거제', '눈물 자국을 효과적으로 제거하는 전용 제품입니다.', 14000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 306, '0', '발바닥 보습제', '건조한 발바닥을 위한 보습 제품입니다.', 16000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 306, '0', '펫 칫솔 세트', '구강 관리를 위한 칫솔과 치약 세트입니다.', 10000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 306, '0', '펫 향수', '은은한 향의 반려동물용 향수입니다.', 20000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 306, '0', '털 염색제', '안전한 성분으로 만든 펫 전용 염색제입니다.', 25000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 306, '0', '미용 테이블', '가정에서 사용하기 좋은 접이식 미용 테이블입니다.', 80000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

-- 레인코트 (line_no: 401)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 401, '0', '기본형 펫 레인코트', '심플한 디자인의 방수 레인코트입니다.', 20000, 'image5.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 401, '0', '반사 스트립 레인코트', '야간 산책 시 안전한 반사 스트립이 부착된 레인코트입니다.', 25000, 'image6.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 401, '0', '강아지 우비 점프슈트', '전신을 감싸는 올인원 타입의 우비입니다.', 30000, 'image7.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 401, '0', '고양이용 레인코트', '고양이를 위해 특별히 디자인된 레인코트입니다.', 22000, 'image8.jpg', 'small', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 401, '0', '큰 강아지용 레인코트', '대형견을 위한 넉넉한 사이즈의 레인코트입니다.', 35000, 'image9.jpg', 'large', '전 연령', '대형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 401, '0', '귀여운 동물 모양 레인코트', '동물 캐릭터 디자인의 귀여운 레인코트입니다.', 28000, 'image1.jpg', 'small', '전 연령', '소형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 401, '0', '통기성 레인코트', '통기성이 좋은 소재로 만든 레인코트입니다.', 27000, 'image2.jpg', 'medium', '전 연령', '전 품종', 100);


INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 401, '0', '접이식 휴대용 레인코트', '작게 접어 휴대하기 편리한 레인코트입니다.', 23000, 'image3.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 401, '0', '레인부츠 세트 레인코트', '발을 보호하는 부츠가 포함된 레인코트 세트입니다.', 40000, 'image4.jpg', 'medium', '전 연령', '전 품종', 100);

-- 신발/양말 (line_no: 402)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 402, '0', '기본형 강아지 부츠', '일반적인 산책용 강아지 부츠입니다.', 25000, 'image5.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 402, '0', '방수 강아지 신발', '우천시 사용하기 좋은 방수 기능의 신발입니다.', 30000, 'image6.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 402, '0', '미끄럼 방지 양말', '실내에서 미끄러지지 않도록 도와주는 양말입니다.', 15000, 'image7.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 402, '0', '발바닥 보호 패드', '뜨거운 지면으로부터 발을 보호하는 패드입니다.', 20000, 'image8.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 402, '0', '겨울용 방한 부츠', '추운 날씨에 발을 따뜻하게 보호하는 부츠입니다.', 35000, 'image9.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 402, '0', '야광 신발', '야간 산책시 안전을 위한 야광 기능이 있는 신발입니다.', 28000, 'image1.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 402, '0', '털신', '실내에서 착용하기 좋은 부드러운 털신입니다.', 18000, 'image2.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 402, '0', '강아지 운동화', '활동적인 강아지를 위한 운동화 스타일의 신발입니다.', 32000, 'image3.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 402, '0', '발가락 양말', '각 발가락을 보호하는 디자인의 양말입니다.', 12000, 'image4.jpg', 'medium', '전 연령', '전 품종', 100);

-- 외투 (line_no: 403)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 403, '0', '기본 강아지 패딩', '따뜻한 기본형 강아지 패딩입니다.', 35000, 'image5.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 403, '0', '강아지 바람막이', '가벼운 외출용 바람막이 재킷입니다.', 28000, 'image6.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 403, '0', '강아지 플리스 자켓', '부드럽고 따뜻한 플리스 소재의 자켓입니다.', 30000, 'image7.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 403, '0', '강아지 코트', '고급스러운 디자인의 강아지 코트입니다.', 40000, 'image8.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 403, '0', '강아지 조끼', '간편하게 입힐 수 있는 조끼형 외투입니다.', 25000, 'image9.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 403, '0', '강아지 후드티', '캐주얼한 스타일의 후드 달린 외투입니다.', 27000, 'image1.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 403, '0', '강아지 야상', '멋스러운 디자인의 야상 스타일 외투입니다.', 38000, 'image2.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 403, '0', '강아지 트렌치코트', '세련된 디자인의 트렌치코트 스타일 외투입니다.', 42000, 'image3.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 403, '0', '강아지 덩크스', '따뜻하고 귀여운 덩크스 스타일의 외투입니다.', 33000, 'image4.jpg', 'medium', '전 연령', '전 품종', 100);

-- 원피스/올인원 (line_no: 404)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 404, '0', '기본 강아지 원피스', '심플한 디자인의 강아지 원피스입니다.', 25000, 'image5.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 404, '0', '강아지 올인원 잠옷', '편안한 착용감의 올인원 잠옷입니다.', 30000, 'image6.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 404, '0', '강아지 데님 원피스', '스타일리시한 데님 소재의 원피스입니다.', 28000, 'image7.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 404, '0', '강아지 니트 원피스', '따뜻한 니트 소재의 원피스입니다.', 32000, 'image8.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 404, '0', '강아지 올인원 레인코트', '비 올 때 입히기 좋은 올인원 레인코트입니다.', 35000, 'image9.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 404, '0', '강아지 프릴 원피스', '귀여운 프릴 장식이 있는 원피스입니다.', 27000, 'image1.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 404, '0', '강아지 스트라이프 원피스', '시원한 느낌의 스트라이프 패턴 원피스입니다.', 26000, 'image2.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 404, '0', '강아지 올인원 수영복', '물놀이할 때 입히기 좋은 올인원 수영복입니다.', 33000, 'image3.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 404, '0', '강아지 체크 원피스', '클래식한 체크 패턴의 원피스입니다.', 29000, 'image4.jpg', 'medium', '전 연령', '전 품종', 100);

-- 코스튬 (line_no: 405)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 405, '0', '강아지 산타 코스튬', '크리스마스 시즌용 귀여운 산타 코스튬입니다.', 25000, 'image5.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 405, '0', '강아지 경찰관 코스튬', '멋진 경찰관 모습의 코스튬입니다.', 28000, 'image6.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 405, '0', '강아지 슈퍼히어로 코스튬', '인기 슈퍼히어로 캐릭터 코스튬입니다.', 30000, 'image7.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 405, '0', '강아지 공룡 코스튬', '귀여운 공룡 모양의 코스튬입니다.', 32000, 'image8.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 405, '0', '강아지 해적 코스튬', '모험심 넘치는 해적 스타일의 코스튬입니다.', 27000, 'image9.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 405, '0', '강아지 토끼 코스튬', '부드러운 토끼 귀가 달린 귀여운 코스튬입니다.', 26000, 'image1.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 405, '0', '강아지 학사모 코스튬', '졸업식이나 기념일에 어울리는 학사모 코스튬입니다.', 23000, 'image2.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 405, '0', '강아지 요리사 코스튬', '귀여운 요리사 모습의 코스튬입니다.', 29000, 'image3.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 405, '0', '강아지 왕자님 코스튬', '고급스러운 왕자님 스타일의 코스튬입니다.', 35000, 'image4.jpg', 'medium', '전 연령', '전 품종', 100);

-- 셔츠/상의 (line_no: 406)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 406, '0', '강아지 기본 티셔츠', '심플한 디자인의 기본 티셔츠입니다.', 15000, 'image5.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 406, '0', '강아지 폴로 셔츠', '단정한 스타일의 폴로 셔츠입니다.', 20000, 'image6.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 406, '0', '강아지 스트라이프 셔츠', '시원해 보이는 스트라이프 패턴의 셔츠입니다.', 18000, 'image7.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 406, '0', '강아지 후드 티셔츠', '캐주얼한 스타일의 후드 티셔츠입니다.', 22000, 'image8.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 406, '0', '강아지 니트 스웨터', '따뜻한 니트 소재의 스웨터입니다.', 25000, 'image9.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 406, '0', '강아지 체크 셔츠', '클래식한 체크 패턴의 셔츠입니다.', 19000, 'image1.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 406, '0', '강아지 래쉬가드', '수영이나 물놀이 시 입히는 래쉬가드입니다.', 23000, 'image2.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 406, '0', '강아지 프린트 티셔츠', '다양한 프린트가 있는 티셔츠입니다.', 17000, 'image3.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 406, '0', '강아지 터틀넥 스웨터', '목을 따뜻하게 감싸주는 터틀넥 스웨터입니다.', 24000, 'image4.jpg', 'medium', '전 연령', '전 품종', 100);

-- 기타패션용품 (line_no: 407)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 407, '0', '강아지 모자 NEW', '자외선 차단 기능이 있는 강아지용 모자입니다.', 15000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 407, '0', '강아지 선글라스', '강한 햇빛으로부터 눈을 보호하는 선글라스입니다.', 12000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 407, '0', '강아지 스카프', '멋스러운 스타일링을 위한 강아지용 스카프입니다.', 10000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 407, '0', '강아지 넥타이', '특별한 날 착용하기 좋은 귀여운 넥타이입니다.', 8000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 407, '0', '강아지 머리띠', '귀여운 디자인의 강아지용 머리띠입니다.', 7000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 407, '0', '강아지 목도리', '추운 날씨에 목을 따뜻하게 해주는 목도리입니다.', 13000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 407, '0', '강아지 장갑', '발을 보호해주는 귀여운 장갑입니다.', 9000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 407, '0', '강아지 헤어핀', '귀여운 디자인의 강아지용 헤어핀 세트입니다.', 6000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 407, '0', '강아지 안경', '렌즈 없는 귀여운 패션 안경입니다.', 11000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

-- 구강위생용품 (line_no: 501)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 501, '0', '강아지 칫솔', '부드러운 모가 있는 강아지용 칫솔입니다.', 5000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 501, '0', '강아지 치약 NEW', '강아지를 위한 안전한 성분의 치약입니다.', 8000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 501, '0', '강아지 구강 스프레이', '입 냄새 제거에 효과적인 구강 스프레이입니다.', 12000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 501, '0', '강아지 치석 제거제', '치석 제거에 도움을 주는 액체형 제품입니다.', 15000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 501, '0', '강아지 구강 세정 물티슈', '간편하게 사용할 수 있는 구강 전용 물티슈입니다.', 7000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 501, '0', '강아지 치실', '치아 사이 청소에 효과적인 강아지용 치실입니다.', 9000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 501, '0', '강아지 구강 세정제', '물에 섞어 사용하는 액체형 구강 세정제입니다.', 13000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 501, '0', '강아지 치석 제거 장난감', '놀면서 치석을 제거할 수 있는 장난감입니다.', 11000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 501, '0', '강아지 혀 클리너', '혀를 깨끗이 청소할 수 있는 전용 도구입니다.', 6000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

-- 기저귀 (line_no: 502)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 502, '0', '강아지 일회용 기저귀 소형', '소형 강아지를 위한 편리한 일회용 기저귀입니다.', 15000, 'image5.jpg', 'small', '전 연령', '소형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 502, '0', '강아지 일회용 기저귀 중형', '중형 강아지를 위한 편리한 일회용 기저귀입니다.', 18000, 'image6.jpg', 'medium', '전 연령', '중형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 502, '0', '강아지 일회용 기저귀 대형', '대형 강아지를 위한 편리한 일회용 기저귀입니다.', 20000, 'image7.jpg', 'large', '전 연령', '대형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 502, '0', '강아지 천 기저귀', '재사용 가능한 친환경 천 기저귀입니다.', 25000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 502, '0', '강아지 기저귀 커버', '천 기저귀와 함께 사용하는 방수 커버입니다.', 12000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 502, '0', '강아지 배변 팬티', '배변 훈련 중인 강아지를 위한 팬티형 기저귀입니다.', 22000, 'image1.jpg', 'free size', '퍼피', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 502, '0', '강아지 생리대', '암컷 강아지의 위생 관리를 위한 전용 생리대입니다.', 16000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 502, '0', '강아지 기저귀 밴드', '기저귀를 고정시키는 데 사용하는 밴드입니다.', 8000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 502, '0', '강아지 기저귀 처리백', '사용한 기저귀를 위생적으로 처리할 수 있는 봉투입니다.', 5000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

-- 배변봉투 (line_no: 503)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 503, '0', '기본형 배변봉투', '산책 시 사용하는 기본적인 배변봉투입니다.', 5000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 503, '0', '친환경 배변봉투', '자연분해되는 소재로 만든 친환경 배변봉투입니다.', 7000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 503, '0', '향기나는 배변봉투', '사용 시 좋은 향이 나는 배변봉투입니다.', 6000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 503, '0', '대형 배변봉투', '대형견의 배변 처리에 적합한 큰 사이즈의 봉투입니다.', 8000, 'image8.jpg', 'large', '전 연령', '대형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 503, '0', '컬러풀 배변봉투', '다양한 색상의 배변봉투 세트입니다.', 5500, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 503, '0', '두꺼운 배변봉투', '튼튼하고 두꺼운 재질의 배변봉투입니다.', 7500, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 503, '0', '배변봉투 디스펜서', '배변봉투를 편리하게 보관하고 꺼낼 수 있는 디스펜서입니다.', 10000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 503, '0', '배변봉투 홀더', '리드줄에 부착할 수 있는 배변봉투 홀더입니다.', 8000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 503, '0', '대용량 배변봉투 세트', '한 번에 많은 양을 구매할 수 있는 대용량 세트입니다.', 15000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

-- 배변판 (line_no: 504)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 504, '0', '기본형 배변판', '실내에서 사용하는 기본적인 배변판입니다.', 20000, 'image5.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 504, '0', '대형 배변판', '대형견을 위한 넓은 크기의 배변판입니다.', 30000, 'image6.jpg', 'large', '전 연령', '대형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 504, '0', '소형 배변판', '소형견이나 고양이를 위한 작은 크기의 배변판입니다.', 15000, 'image7.jpg', 'small', '전 연령', '소형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 504, '0', '접이식 배변판', '휴대가 편리한 접이식 배변판입니다.', 25000, 'image8.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 504, '0', '자동 세척 배변판', '자동으로 세척되는 편리한 배변판입니다.', 80000, 'image9.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 504, '0', '인조잔디 배변판', '인조잔디가 깔린 자연스러운 느낌의 배변판입니다.', 35000, 'image1.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 504, '0', '높은 테두리 배변판', '소변이 밖으로 튀는 것을 방지하는 높은 테두리의 배변판입니다.', 28000, 'image2.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 504, '0', '향균 처리된 배변판', '항균 처리가 되어 있어 위생적인 배변판입니다.', 32000, 'image3.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 504, '0', '다단 배변판', '여러 마리의 반려동물을 위한 다단 구조의 배변판입니다.', 50000, 'image4.jpg', 'medium', '전 연령', '전 품종', 100);

-- 배변패드 (line_no: 505)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 505, '0', '기본형 배변패드', '일반적인 사용에 적합한 기본 배변패드입니다.', 15000, 'image5.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 505, '0', '대형 배변패드', '대형견이나 많은 양의 배변을 위한 큰 사이즈 패드입니다.', 25000, 'image6.jpg', 'large', '전 연령', '대형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 505, '0', '향균 배변패드', '박테리아 증식을 억제하는 향균 처리된 패드입니다.', 18000, 'image7.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 505, '0', '탈취 배변패드', '특수 탈취 성분이 함유된 냄새 제거에 효과적인 패드입니다.', 20000, 'image8.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 505, '0', '울트라 흡수 배변패드', '대용량 흡수가 가능한 고성능 패드입니다.', 22000, 'image9.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 505, '0', '천연 bamboo 배변패드', '친환경 bamboo 소재로 만든 생분해성 패드입니다.', 30000, 'image1.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 505, '0', 'washable 배변패드', '세탁 가능한 재사용 배변패드입니다.', 35000, 'image2.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 505, '0', '향기나는 배변패드', '은은한 향기가 나는 기분 좋은 패드입니다.', 19000, 'image3.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 505, '0', '접착형 배변패드', '바닥에 고정할 수 있는 접착 스트립이 있는 패드입니다.', 21000, 'image4.jpg', 'medium', '전 연령', '전 품종', 100);

-- 탈취/소독제 (line_no: 506)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 506, '0', '다목적 펫 탈취제', '반려동물 전용 다목적 탈취제입니다.', 15000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 506, '0', '강력 소독 스프레이', '강력한 살균 효과가 있는 소독 스프레이입니다.', 18000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 506, '0', '천연 성분 탈취제', '천연 성분으로 만든 안전한 탈취제입니다.', 20000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 506, '0', '롤온 타입 탈취제', '간편하게 사용할 수 있는 롤온 타입 탈취제입니다.', 12000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 506, '0', '항균 물티슈', '탈취와 소독이 동시에 가능한 항균 물티슈입니다.', 8000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 506, '0', '발바닥 전용 소독제', '산책 후 발바닥 소독에 특화된 제품입니다.', 14000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 506, '0', '대용량 리필 탈취제', '경제적인 대용량 리필 탈취제입니다.', 25000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 506, '0', '옷장용 탈취 걸이', '옷장이나 신발장에 걸어두는 탈취 제품입니다.', 10000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 506, '0', '무향 탈취제', '민감한 반려동물을 위한 무향 탈취제입니다.', 16000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

-- 눈/귀 위생용품 (line_no: 507)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 507, '0', '눈물 자국 제거제 NEW', '눈물 자국을 효과적으로 제거하는 전용 제품입니다.', 15000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 507, '0', '귀 세정제 NEW', '귀 속 이물질을 안전하게 제거하는 세정제입니다.', 18000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 507, '0', '눈 세척액', '눈을 부드럽게 세척하는 안전한 세척액입니다.', 20000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 507, '0', '귀 청소용 솜', '귀 청소에 특화된 부드러운 솜입니다.', 8000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 507, '0', '눈물 얼룩 제거 물티슈', '간편하게 사용할 수 있는 눈물 얼룩 제거 물티슈입니다.', 12000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 507, '0', '귀 건조 파우더', '귀 세척 후 사용하는 건조용 파우더입니다.', 14000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 507, '0', '눈 주변 털 정리 가위', '눈 주변 털을 안전하게 정리할 수 있는 전용 가위입니다.', 25000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 507, '0', '귀 청소용 핀셋', '귀 속 이물질을 안전하게 제거할 수 있는 핀셋입니다.', 10000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 507, '0', '눈/귀 케어 세트', '눈과 귀 관리에 필요한 제품들을 모은 종합 세트입니다.', 35000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

-- 넥카라 (line_no: 508)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 508, '0', '기본형 넥카라', '편안한 착용감의 기본 넥카라입니다.', 12000, 'image5.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 508, '0', '부드러운 넥카라', '극세사 소재의 부드러운 넥카라입니다.', 15000, 'image6.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 508, '0', '투명 넥카라', '시야를 방해하지 않는 투명 넥카라입니다.', 18000, 'image7.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 508, '0', '풍선형 넥카라', '공기를 넣어 사용하는 풍선형 넥카라입니다.', 20000, 'image8.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 508, '0', '조절 가능한 넥카라', '크기 조절이 가능한 넥카라입니다.', 16000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 508, '0', '패션 넥카라', '귀여운 디자인의 패션 넥카라입니다.', 22000, 'image1.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 508, '0', '대형견용 넥카라', '대형견을 위한 큰 사이즈의 넥카라입니다.', 25000, 'image2.jpg', 'large', '전 연령', '대형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 508, '0', '소형견용 넥카라', '소형견을 위한 작은 사이즈의 넥카라입니다.', 14000, 'image3.jpg', 'small', '전 연령', '소형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 508, '0', '넥카라 커버', '기존 넥카라에 씌우는 부드러운 커버입니다.', 10000, 'image4.jpg', 'medium', '전 연령', '전 품종', 100);

-- 해충방지용품 (line_no: 509)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 509, '0', '강아지용 해충 방지 목걸이', '효과적인 해충 방지 목걸이입니다.', 15000, 'image5.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 509, '0', '천연 성분 해충 방지 스프레이', '천연 성분으로 만든 안전한 해충 방지 스프레이입니다.', 20000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 509, '0', '해충 방지 패치', '옷에 부착하여 사용하는 해충 방지 패치입니다.', 12000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 509, '0', '초음파 해충 퇴치기', '초음파로 해충을 퇴치하는 휴대용 기기입니다.', 30000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 509, '0', '해충 방지 샴푸', '해충을 방지하는 효과가 있는 샴푸입니다.', 18000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 509, '0', '해충 방지 팔찌', '반려동물용 해충 방지 팔찌입니다.', 10000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 509, '0', '해충 방지 베드', '해충을 방지하는 성분이 처리된 침대입니다.', 40000, 'image2.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 509, '0', '해충 방지 목욕 타월', '해충 방지 성분이 함유된 목욕 타월입니다.', 15000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 509, '0', '해충 방지 밴드', '발목에 착용하는 해충 방지 밴드입니다.', 8000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

-- 고양이 화장실 (line_no: 510)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 510, '0', '기본형 고양이 화장실', '심플한 디자인의 기본 고양이 화장실입니다.', 20000, 'image5.jpg', 'medium', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 510, '0', '후드형 고양이 화장실', '프라이버시를 보장하는 후드형 화장실입니다.', 30000, 'image6.jpg', 'medium', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 510, '0', '자동 청소 고양이 화장실', '자동으로 청소되는 편리한 화장실입니다.', 150000, 'image7.jpg', 'medium', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 510, '0', '대형 고양이 화장실', '대형 고양이나 다묘 가정을 위한 큰 사이즈 화장실입니다.', 40000, 'image8.jpg', 'large', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 510, '0', '탑엔트리 고양이 화장실', '위에서 들어가는 형태의 화장실로 모래 흩어짐을 줄여줍니다.', 35000, 'image9.jpg', 'medium', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 510, '0', '반투명 고양이 화장실', '내부가 살짝 보이는 반투명 소재의 화장실입니다.', 25000, 'image1.jpg', 'medium', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 510, '0', '코너형 고양이 화장실', '공간 활용에 좋은 코너형 디자인의 화장실입니다.', 28000, 'image2.jpg', 'medium', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 510, '0', '화장실 매트', '화장실 주변 바닥을 보호하는 매트입니다.', 15000, 'image3.jpg', 'free size', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 510, '0', '고양이 화장실 탈취제', '화장실 냄새를 효과적으로 제거하는 탈취제입니다.', 12000, 'image4.jpg', 'free size', '전 연령', '고양이', 100);

-- 고양이 모래 (line_no: 511)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 511, '0', '벤토나이트 고양이 모래', '뛰어난 응고력의 벤토나이트 모래입니다.', 20000, 'image5.jpg', 'free size', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 511, '0', '두부 모래', '친환경적인 두부로 만든 고양이 모래입니다.', 25000, 'image6.jpg', 'free size', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 511, '0', '천연 우드 펠렛', '천연 나무로 만든 친환경 고양이 모래입니다.', 18000, 'image7.jpg', 'free size', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 511, '0', '실리카겔 모래', '흡수력이 뛰어난 실리카겔 모래입니다.', 30000, 'image8.jpg', 'free size', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 511, '0', '옥수수 모래', '옥수수 알갱이로 만든 자연 분해되는 모래입니다.', 22000, 'image9.jpg', 'free size', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 511, '0', '파쇄 신문지 모래', '재활용 신문지로 만든 경제적인 모래입니다.', 15000, 'image1.jpg', 'free size', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 511, '0', '크리스탈 모래', '무향, 무취의 크리스탈 타입 모래입니다.', 28000, 'image2.jpg', 'free size', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 511, '0', '향기나는 모래', '은은한 향이 나는 고양이 모래입니다.', 23000, 'image3.jpg', 'free size', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 511, '0', '대용량 고양이 모래', '경제적인 대용량 패키지 고양이 모래입니다.', 35000, 'image4.jpg', 'free size', '전 연령', '고양이', 100);

-- 기타고양이위생용품 (line_no: 512)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 512, '0', '고양이 배변 스콥', '위생적인 고양이 배변 처리용 스콥입니다.', 10000, 'image5.jpg', 'free size', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 512, '0', '고양이 발바닥 세정제', '산책 후 발바닥 세정에 좋은 전용 세정제입니다.', 15000, 'image6.jpg', 'free size', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 512, '0', '고양이 귀 세정제', '귀 위생 관리를 위한 전문 세정제입니다.', 18000, 'image7.jpg', 'free size', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 512, '0', '고양이 털 제거 롤러', '의류나 가구의 고양이 털을 쉽게 제거하는 롤러입니다.', 12000, 'image8.jpg', 'free size', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 512, '0', '고양이 발톱 깎이', '안전하게 발톱을 깎을 수 있는 전용 깎이입니다.', 20000, 'image9.jpg', 'free size', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 512, '0', '고양이 구강 청결제', '구강 건강을 위한 액체형 구강 청결제입니다.', 16000, 'image1.jpg', 'free size', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 512, '0', '고양이 눈물 자국 제거제', '눈물 자국을 효과적으로 제거하는 전용 제품입니다.', 14000, 'image2.jpg', 'free size', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 512, '0', '고양이 털뭉치 제거제', '삼킨 털뭉치 배출에 도움을 주는 연고형 제품입니다.', 22000, 'image3.jpg', 'free size', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 512, '0', '고양이 위생 장갑', '위생적인 고양이 케어를 위한 일회용 장갑입니다.', 8000, 'image4.jpg', 'free size', '전 연령', '고양이', 100);

-- 급수기 (line_no: 601)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 601, '0', '기본형 급수기', '심플한 디자인의 기본 급수기입니다.', 15000, 'image5.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 601, '0', '자동 급수기', '물이 자동으로 공급되는 편리한 급수기입니다.', 30000, 'image6.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 601, '0', '분수형 급수기', '흐르는 물을 좋아하는 반려동물을 위한 분수형 급수기입니다.', 40000, 'image7.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 601, '0', '대용량 급수기', '대형견이나 다묘 가정을 위한 대용량 급수기입니다.', 25000, 'image8.jpg', 'large', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 601, '0', '휴대용 급수기', '외출 시 사용하기 좋은 휴대용 급수기입니다.', 12000, 'image9.jpg', 'small', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 601, '0', '스테인리스 급수기', '위생적인 스테인리스 소재의 급수기입니다.', 20000, 'image1.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 601, '0', '세라믹 급수기', '고급스러운 디자인의 세라믹 급수기입니다.', 35000, 'image2.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 601, '0', '살균 기능 급수기', 'UV 살균 기능이 있는 고급형 급수기입니다.', 50000, 'image3.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 601, '0', '급수기 필터', '급수기용 교체 필터입니다.', 8000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

-- 급식기 (line_no: 602)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 602, '0', '기본형 급식기', '심플한 디자인의 기본 급식기입니다.', 10000, 'image5.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 602, '0', '자동 급식기', '정해진 시간에 자동으로 사료를 공급하는 급식기입니다.', 50000, 'image6.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 602, '0', '스테인리스 급식기', '위생적인 스테인리스 소재의 급식기입니다.', 15000, 'image7.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 602, '0', '세라믹 급식기', '고급스러운 디자인의 세라믹 급식기입니다.', 25000, 'image8.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 602, '0', '슬로우 피딩 급식기', '과식을 방지하는 슬로우 피딩 디자인의 급식기입니다.', 20000, 'image9.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 602, '0', '2in1 급식기', '사료와 물을 동시에 담을 수 있는 2in1 급식기입니다.', 18000, 'image1.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 602, '0', '고양이 수염 보호 급식기', '고양이 수염 스트레스를 줄여주는 넓은 디자인의 급식기입니다.', 22000, 'image2.jpg', 'medium', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 602, '0', '높이 조절 급식기', '반려동물의 크기에 맞게 높이를 조절할 수 있는 급식기입니다.', 30000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 602, '0', '휴대용 급식기', '외출 시 사용하기 좋은 접이식 휴대용 급식기입니다.', 12000, 'image4.jpg', 'small', '전 연령', '전 품종', 100);

-- 정수기 (line_no: 603)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 603, '0', '기본형 펫 정수기', '심플한 디자인의 기본 반려동물용 정수기입니다.', 50000, 'image5.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 603, '0', '대용량 펫 정수기', '대형견이나 다묘 가정을 위한 대용량 정수기입니다.', 80000, 'image6.jpg', 'large', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 603, '0', 'UV 살균 펫 정수기', 'UV 살균 기능이 있는 고급형 정수기입니다.', 100000, 'image7.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 603, '0', '스테인리스 펫 정수기', '위생적인 스테인리스 소재의 정수기입니다.', 70000, 'image8.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 603, '0', '분수형 펫 정수기', '흐르는 물을 좋아하는 반려동물을 위한 분수형 정수기입니다.', 60000, 'image9.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 603, '0', '스마트 펫 정수기', '물 교체 시기를 알려주는 스마트 기능이 있는 정수기입니다.', 120000, 'image1.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 603, '0', '세라믹 펫 정수기', '고급스러운 디자인의 세라믹 정수기입니다.', 90000, 'image2.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 603, '0', '휴대용 펫 정수기', '외출 시 사용하기 좋은 휴대용 정수기입니다.', 40000, 'image3.jpg', 'small', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 603, '0', '정수기 필터', '펫 정수기용 교체 필터입니다.', 15000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

-- 사료보관통 (line_no: 604)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 604, '0', '기본형 사료 보관통', '심플한 디자인의 기본 사료 보관통입니다.', 20000, 'image5.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 604, '0', '대용량 사료 보관통', '대량의 사료를 보관할 수 있는 대용량 보관통입니다.', 35000, 'image6.jpg', 'large', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 604, '0', '밀폐형 사료 보관통', '습기를 차단하는 밀폐형 사료 보관통입니다.', 25000, 'image7.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 604, '0', '계량컵 내장 사료 보관통', '계량컵이 내장된 편리한 사료 보관통입니다.', 28000, 'image8.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 604, '0', '이동식 사료 보관통', '바퀴가 달려 이동이 편리한 사료 보관통입니다.', 30000, 'image9.jpg', 'large', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 604, '0', '스테인리스 사료 보관통', '위생적인 스테인리스 소재의 사료 보관통입니다.', 40000, 'image1.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 604, '0', '투명 사료 보관통', '내용물을 쉽게 확인할 수 있는 투명 사료 보관통입니다.', 22000, 'image2.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 604, '0', '스택형 사료 보관통', '여러 개를 쌓아 사용할 수 있는 스택형 사료 보관통입니다.', 18000, 'image3.jpg', 'small', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 604, '0', '자동 배출 사료 보관통', '버튼 하나로 사료를 쉽게 배출할 수 있는 보관통입니다.', 45000, 'image4.jpg', 'medium', '전 연령', '전 품종', 100);

-- 가슴줄 (line_no: 701)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 701, '0', '기본형 가슴줄', '심플한 디자인의 기본 가슴줄입니다.', 15000, 'image5.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 701, '0', '패딩 가슴줄', '착용감이 좋은 패딩 처리된 가슴줄입니다.', 20000, 'image6.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 701, '0', '반사 가슴줄', '야간 산책 시 안전한 반사 재질의 가슴줄입니다.', 18000, 'image7.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 701, '0', '가죽 가슴줄', '고급스러운 가죽 소재의 가슴줄입니다.', 30000, 'image8.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 701, '0', '조절 가능 가슴줄', '사이즈 조절이 가능한 가슴줄입니다.', 22000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 701, '0', '하네스형 가슴줄', '전체적으로 몸을 감싸는 하네스형 가슴줄입니다.', 25000, 'image1.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 701, '0', '강아지 유니폼 가슴줄', '귀여운 유니폼 디자인의 가슴줄입니다.', 28000, 'image2.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 701, '0', '쿨링 가슴줄', '여름철 사용하기 좋은 쿨링 기능의 가슴줄입니다.', 23000, 'image3.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 701, '0', '대형견용 가슴줄', '대형견을 위한 튼튼한 가슴줄입니다.', 35000, 'image4.jpg', 'large', '전 연령', '대형견', 100);

-- 리드줄 (line_no: 702)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 702, '0', '기본형 리드줄', '견고한 나일론 소재의 기본 리드줄입니다.', 12000, 'image5.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 702, '0', '자동 리드줄', '버튼으로 길이 조절이 가능한 자동 리드줄입니다.', 25000, 'image6.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 702, '0', '반사 리드줄', '야간 산책 시 안전한 반사 재질의 리드줄입니다.', 15000, 'image7.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 702, '0', '가죽 리드줄', '고급스러운 가죽 소재의 리드줄입니다.', 30000, 'image8.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 702, '0', '다중 리드줄', '여러 마리의 반려동물을 동시에 산책시킬 수 있는 리드줄입니다.', 35000, 'image9.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 702, '0', '긴 리드줄', '넓은 공간에서 자유롭게 뛰어놀 수 있는 긴 리드줄입니다.', 20000, 'image1.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 702, '0', '패딩 핸들 리드줄', '손잡이 부분에 패딩 처리된 편안한 리드줄입니다.', 18000, 'image2.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 702, '0', '탄성 리드줄', '충격을 흡수하는 탄성 소재의 리드줄입니다.', 22000, 'image3.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 702, '0', '초경량 리드줄', '가벼워서 장시간 산책에 적합한 리드줄입니다.', 16000, 'image4.jpg', 'medium', '전 연령', '전 품종', 100);

-- 목걸이/인식표 (line_no: 703)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 703, '0', '기본형 목걸이', '심플한 디자인의 기본 목걸이입니다.', 10000, 'image5.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 703, '0', '가죽 목걸이', '고급스러운 가죽 소재의 목걸이입니다.', 25000, 'image6.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 703, '0', 'LED 목걸이', '야간 산책 시 안전한 LED 라이트 내장 목걸이입니다.', 20000, 'image7.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 703, '0', '방울 목걸이', '귀여운 방울이 달린 고양이용 목걸이입니다.', 8000, 'image8.jpg', 'small', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 703, '0', '인식표 세트', '이름과 연락처를 각인할 수 있는 인식표 세트입니다.', 15000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 703, '0', 'QR코드 인식표', 'QR코드로 상세 정보를 저장할 수 있는 스마트 인식표입니다.', 18000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 703, '0', '실리콘 목걸이', '부드럽고 가벼운 실리콘 소재의 목걸이입니다.', 12000, 'image2.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 703, '0', '패션 목걸이', '스타일리시한 디자인의 패션 목걸이입니다.', 22000, 'image3.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 703, '0', '안전 분리 목걸이', '긴급 상황 시 쉽게 분리되는 안전 목걸이입니다.', 16000, 'image4.jpg', 'medium', '전 연령', '전 품종', 100);

-- 목줄 (line_no: 704)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 704, '0', '기본형 목줄', '편안한 착용감의 기본 목줄입니다.', 15000, 'image5.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 704, '0', '가죽 목줄', '고급스러운 가죽 소재의 목줄입니다.', 30000, 'image6.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 704, '0', '조절 가능 목줄', '사이즈 조절이 가능한 실용적인 목줄입니다.', 20000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 704, '0', '패딩 목줄', '부드러운 패딩 처리된 편안한 목줄입니다.', 25000, 'image8.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_name, item_code, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 704, '0', '반사 목줄', '야간 산책 시 안전한 반사 재질의 목줄입니다.', 18000, 'image9.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 704, '0', '패션 목줄', '스타일리시한 디자인의 패션 목줄입니다.', 22000, 'image1.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 704, '0', '대형견용 목줄', '대형견을 위한 튼튼한 목줄입니다.', 28000, 'image2.jpg', 'large', '전 연령', '대형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 704, '0', '소형견용 목줄', '소형견에게 적합한 가벼운 목줄입니다.', 16000, 'image3.jpg', 'small', '전 연령', '소형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 704, '0', '고양이용 목줄', '고양이를 위한 안전 분리 기능이 있는 목줄입니다.', 19000, 'image4.jpg', 'small', '전 연령', '고양이', 100);

-- 유모차 (line_no: 705)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 705, '0', '기본형 반려동물 유모차', '심플한 디자인의 기본 유모차입니다.', 100000, 'image5.jpg', 'medium', '전 연령', '전 품종', 50);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 705, '0', '대형 반려동물 유모차', '대형견이나 다두 반려동물을 위한 넓은 유모차입니다.', 150000, 'image6.jpg', 'large', '전 연령', '대형견', 50);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 705, '0', '접이식 반려동물 유모차', '간편하게 접을 수 있는 휴대용 유모차입니다.', 120000, 'image7.jpg', 'medium', '전 연령', '전 품종', 50);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 705, '0', '3륜 반려동물 유모차', '안정적인 주행이 가능한 3륜 유모차입니다.', 130000, 'image8.jpg', 'medium', '전 연령', '전 품종', 50);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 705, '0', '2층 반려동물 유모차', '여러 마리의 반려동물을 위한 2층 구조 유모차입니다.', 180000, 'image9.jpg', 'medium', '전 연령', '전 품종', 50);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 705, '0', 'all-in-one 반려동물 유모차', '유모차, 카시트, 캐리어 기능을 겸한 다기능 유모차입니다.', 200000, 'image1.jpg', 'medium', '전 연령', '전 품종', 50);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 705, '0', '경량 반려동물 유모차', '가벼워서 들고 다니기 편리한 유모차입니다.', 110000, 'image2.jpg', 'small', '전 연령', '소형견', 50);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 705, '0', '오프로드 반려동물 유모차', '험한 길에서도 사용 가능한 튼튼한 바퀴의 유모차입니다.', 170000, 'image3.jpg', 'medium', '전 연령', '전 품종', 50);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 705, '0', '고양이용 유모차', '고양이 전용 디자인의 안전한 유모차입니다.', 140000, 'image4.jpg', 'small', '전 연령', '고양이', 50);

-- 이동가방/이동장 (line_no: 706)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 706, '0', '기본형 이동가방', '심플한 디자인의 기본 이동가방입니다.', 30000, 'image5.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 706, '0', '백팩형 이동가방', '등에 메고 다닐 수 있는 백팩 스타일의 이동가방입니다.', 45000, 'image6.jpg', 'small', '전 연령', '소형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 706, '0', '캐리어형 이동장', '견고한 플라스틱 소재의 캐리어형 이동장입니다.', 50000, 'image7.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 706, '0', '휴대용 소프트 케이지', '접이식 구조의 휴대용 소프트 케이지입니다.', 40000, 'image8.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 706, '0', '어깨끈 이동가방', '어깨에 메고 다닐 수 있는 스트랩 형태의 이동가방입니다.', 35000, 'image9.jpg', 'small', '전 연령', '소형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 706, '0', '캐리어 겸용 카시트', '차량용 카시트로도 사용 가능한 이동장입니다.', 60000, 'image1.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 706, '0', '대형견용 이동장', '대형견을 위한 넓은 공간의 이동장입니다.', 70000, 'image2.jpg', 'large', '전 연령', '대형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 706, '0', '투명 창 이동가방', '통풍이 잘되는 투명 창이 있는 이동가방입니다.', 38000, 'image3.jpg', 'small', '전 연령', '소형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 706, '0', '고양이 전용 이동장', '고양이의 특성을 고려한 디자인의 이동장입니다.', 42000, 'image4.jpg', 'medium', '전 연령', '고양이', 100);

-- 차량용캐리어/시트 (line_no: 707)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 707, '0', '기본형 차량용 캐리어', '차량에 안전하게 고정할 수 있는 기본형 캐리어입니다.', 50000, 'image5.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 707, '0', '안전벨트 연결 카시트', '차량 안전벨트와 연결하여 사용하는 카시트입니다.', 60000, 'image6.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 707, '0', '부스터 시트', '작은 반려동물을 위한 높이 조절 가능한 부스터 시트입니다.', 45000, 'image7.jpg', 'small', '전 연령', '소형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 707, '0', '해먹형 카시트', '차량 뒷좌석에 설치하는 해먹 형태의 카시트입니다.', 55000, 'image8.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 707, '0', '다기능 차량용 캐리어', '이동장과 카시트 기능을 겸비한 다기능 제품입니다.', 70000, 'image9.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 707, '0', '차량용 안전망', '트렁크에 설치하여 반려동물을 안전하게 보호하는 안전망입니다.', 40000, 'image1.jpg', 'large', '전 연령', '대형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 707, '0', '앞좌석용 카시트', '조수석에 설치 가능한 전용 카시트입니다.', 65000, 'image2.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 707, '0', '2인용 카시트', '두 마리의 반려동물을 동시에 태울 수 있는 넓은 카시트입니다.', 80000, 'image3.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 707, '0', '차량용 슬링백', '가벼운 소형견을 위한 차량용 슬링백입니다.', 35000, 'image4.jpg', 'small', '전 연령', '소형견', 100);

-- 입마개 (line_no: 708)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 708, '0', '기본형 입마개', '통풍이 잘되는 기본적인 메쉬 소재 입마개입니다.', 15000, 'image5.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 708, '0', '실리콘 입마개', '부드러운 실리콘 소재로 제작된 입마개입니다.', 18000, 'image6.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 708, '0', '가죽 입마개', '고급스러운 가죽 소재의 입마개입니다.', 25000, 'image7.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 708, '0', '대형견용 입마개', '대형견을 위해 특별히 설계된 튼튼한 입마개입니다.', 22000, 'image8.jpg', 'large', '전 연령', '대형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 708, '0', '소형견용 입마개', '작은 견종에 맞게 제작된 경량 입마개입니다.', 14000, 'image9.jpg', 'small', '전 연령', '소형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 708, '0', '조절 가능한 입마개', '크기 조절이 가능한 다용도 입마개입니다.', 20000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 708, '0', '반사 스트립 입마개', '야간 산책 시 안전을 위한 반사 스트립이 부착된 입마개입니다.', 19000, 'image2.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 708, '0', '통풍형 입마개', '호흡이 편안한 통풍 설계 입마개입니다.', 17000, 'image3.jpg', 'medium', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 708, '0', '훈련용 입마개', '행동 교정 훈련에 적합한 특수 설계 입마개입니다.', 23000, 'image4.jpg', 'medium', '전 연령', '전 품종', 100);

-- 공/원반 (line_no: 801)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 801, '0', '기본 테니스 공', '강아지와 놀기 좋은 기본 테니스 공입니다.', 5000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 801, '0', '고무 공', '튼튼한 고무 소재로 만든 씹기 좋은 공입니다.', 8000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 801, '0', '플라잉 디스크', '던지고 물어오기 놀이에 적합한 플라잉 디스크입니다.', 12000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 801, '0', '물에 뜨는 공', '수영할 때 사용하기 좋은 부력 있는 공입니다.', 10000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 801, '0', '노즈워크 공', '간식을 넣어 두뇌 활동을 자극하는 노즈워크 공입니다.', 15000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 801, '0', '발광 공', '어두운 곳에서도 잘 보이는 LED 발광 공입니다.', 13000, 'image1.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 801, '0', '소프트 공', '실내 놀이에 적합한 부드러운 소재의 공입니다.', 7000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 801, '0', '럭비 공 모양 장난감', '물기 쉬운 럭비 공 모양의 장난감입니다.', 9000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 801, '0', '치카 공', '치아 건강에 좋은 특수 재질의 치카 공입니다.', 11000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

-- 인형 (line_no: 802)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 802, '0', '강아지 봉제 인형', '부드러운 촉감의 강아지 모양 봉제 인형입니다.', 15000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 802, '0', '삑삑이 인형', '눌렀을 때 소리나는 삑삑이 내장 인형입니다.', 12000, 'image6.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 802, '0', '로프 인형', '씹기 좋은 로프 소재로 만든 인형입니다.', 18000, 'image7.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 802, '0', '라텍스 인형', '씹기 좋고 튼튼한 라텍스 소재 인형입니다.', 20000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 802, '0', '노즈워크 인형', '간식을 숨길 수 있는 노즈워크용 인형입니다.', 22000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 802, '0', '고양이 캣닢 인형', '캣닢이 들어있는 고양이용 인형입니다.', 14000, 'image1.jpg', 'free size', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 802, '0', '대형 쿠션 인형', '안고 자기 좋은 대형 쿠션 인형입니다.', 25000, 'image2.jpg', 'large', '전 연령', '대형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 802, '0', '소리나는 동물 인형', '움직이면 동물 소리가 나는 인형입니다.', 16000, 'image3.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 802, '0', '치석 제거 인형', '씹으면서 치석 제거에 도움을 주는 인형입니다.', 19000, 'image4.jpg', 'free size', '전 연령', '전 품종', 100);

-- 터널/큐브 (line_no: 803)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 803, '0', '기본형 터널', '접이식 구조의 기본 놀이 터널입니다.', 25000, 'image5.jpg', 'medium', '전 연령', '전 품종', 50);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 803, '0', 'Y자형 터널', '3방향으로 뻗은 Y자 모양의 터널입니다.', 35000, 'image6.jpg', 'medium', '전 연령', '전 품종', 50);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 803, '0', '숨숨집 큐브', '숨기 좋은 정육면체 모양의 큐브입니다.', 20000, 'image7.jpg', 'small', '전 연령', '소형견', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 803, '0', '캣타워 터널', '캣타워에 연결 가능한 터널입니다.', 30000, 'image8.jpg', 'medium', '전 연령', '고양이', 50);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 803, '0', '대형 플레이 큐브', '여러 개의 구멍이 있는 대형 놀이 큐브입니다.', 40000, 'image9.jpg', 'large', '전 연령', '대형견', 30);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 803, '0', '투명 터널', '반려동물의 움직임을 볼 수 있는 투명 터널입니다.', 28000, 'image1.jpg', 'medium', '전 연령', '전 품종', 50);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 803, '0', '폼폼 장식 터널', '재미있는 폼폼 장식이 달린 터널입니다.', 32000, 'image2.jpg', 'medium', '전 연령', '전 품종', 50);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 803, '0', '텐트형 큐브', '텐트처럼 펼쳤다 접을 수 있는 큐브입니다.', 27000, 'image3.jpg', 'medium', '전 연령', '전 품종', 50);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 803, '0', '매트 일체형 터널', '바닥 매트가 포함된 안전한 터널입니다.', 38000, 'image4.jpg', 'medium', '전 연령', '전 품종', 50);

-- 훈련용품 (line_no: 804)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 804, '0', '클리커', '클리커 트레이닝을 위한 기본 클리커입니다.', 5000, 'image5.jpg', 'free size', '전 연령', '전 품종', 200);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 804, '0', '훈련용 간식 파우치', '훈련 시 간식을 보관할 수 있는 파우치입니다.', 15000, 'image6.jpg', 'free size', '전 연령', '전 품종', 150);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 804, '0', '애질리티 장애물 세트', '애질리티 훈련을 위한 기본 장애물 세트입니다.', 80000, 'image7.jpg', 'free size', '전 연령', '전 품종', 50);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 804, '0', '호루라기', '원거리 훈련에 유용한 호루라기입니다.', 8000, 'image8.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 804, '0', '훈련용 롱 리드줄', '원거리 훈련에 적합한 긴 리드줄입니다.', 25000, 'image9.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 804, '0', '행동 교정 스프레이', '원하지 않는 행동을 교정하는 데 사용되는 스프레이입니다.', 12000, 'image1.jpg', 'free size', '전 연령', '전 품종', 80);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 804, '0', '훈련용 더미', '물어오기 훈련에 사용되는 더미입니다.', 18000, 'image2.jpg', 'medium', '전 연령', '전 품종', 70);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 804, '0', '포터블 훈련 매트', '실내외에서 사용 가능한 휴대용 훈련 매트입니다.', 30000, 'image3.jpg', 'free size', '전 연령', '전 품종', 60);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 804, '0', '훈련용 타깃 스틱', '목표물 지시에 사용되는 타깃 스틱입니다.', 10000, 'image4.jpg', 'free size', '전 연령', '전 품종', 90);

-- 기타장난감 (line_no: 805)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 805, '0', '강아지 퍼즐 장난감', '두뇌 발달에 도움을 주는 퍼즐 장난감입니다.', 20000, 'image5.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 805, '0', '노즈워크 매트', '간식을 숨겨 후각을 자극하는 노즈워크 매트입니다.', 25000, 'image6.jpg', 'free size', '전 연령', '전 품종', 80);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 805, '0', '터그 로프', '잡아당기기 놀이에 적합한 튼튼한 로프 장난감입니다.', 15000, 'image7.jpg', 'free size', '전 연령', '전 품종', 120);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 805, '0', '고양이 낚시대 NEW', '고양이와 놀아주기 좋은 깃털 달린 낚시대입니다.', 12000, 'image8.jpg', 'free size', '전 연령', '고양이', 150);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 805, '0', '자동 레이저 포인터', '고양이의 사냥 본능을 자극하는 자동 레이저 포인터입니다.', 30000, 'image9.jpg', 'free size', '전 연령', '고양이', 70);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 805, '0', '물놀이용 장난감', '수영장이나 해변에서 사용할 수 있는 물에 뜨는 장난감입니다.', 18000, 'image1.jpg', 'free size', '전 연령', '전 품종', 90);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 805, '0', '스낵 볼', '간식을 넣어 굴리며 놀 수 있는 장난감입니다.', 16000, 'image2.jpg', 'free size', '전 연령', '전 품종', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 805, '0', '고무 치킨', '소리나는 고무 재질의 치킨 모양 장난감입니다.', 10000, 'image3.jpg', 'free size', '전 연령', '전 품종', 130);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 805, '0', '플라잉 스퀘커', '날아가면서 소리나는 장난감입니다.', 14000, 'image4.jpg', 'free size', '전 연령', '전 품종', 110);

-- 캣타워 (line_no: 806)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 806, '0', '기본형 캣타워', '기본적인 구조의 실용적인 캣타워입니다.', 80000, 'image5.jpg', 'medium', '전 연령', '고양이', 50);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 806, '0', '대형 캣타워', '여러 마리의 고양이가 함께 사용할 수 있는 대형 캣타워입니다.', 150000, 'image6.jpg', 'large', '전 연령', '고양이', 30);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 806, '0', '창문형 캣타워', '창문에 부착하여 사용하는 공간 절약형 캣타워입니다.', 70000, 'image7.jpg', 'small', '전 연령', '고양이', 40);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 806, '0', '캣휠 일체형 캣타워', '운동을 위한 캣휠이 포함된 캣타워입니다.', 200000, 'image8.jpg', 'medium', '전 연령', '고양이', 20);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 806, '0', '우드 캣타워', '내추럴한 디자인의 원목 캣타워입니다.', 120000, 'image9.jpg', 'medium', '전 연령', '고양이', 35);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 806, '0', '캣타워 해먹', '캣타워에 부착 가능한 편안한 해먹입니다.', 25000, 'image1.jpg', 'free size', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 806, '0', '캣타워 스크래쳐 리필', '캣타워의 스크래쳐를 교체할 수 있는 리필입니다.', 15000, 'image2.jpg', 'free size', '전 연령', '고양이', 150);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 806, '0', '미니 캣타워', '작은 공간에 적합한 소형 캣타워입니다.', 50000, 'image3.jpg', 'small', '전 연령', '고양이', 60);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 806, '0', '모듈형 캣타워', '필요에 따라 구조를 변경할 수 있는 모듈형 캣타워입니다.', 180000, 'image4.jpg', 'medium', '전 연령', '고양이', 25);

-- 고양이스크래쳐 (line_no: 807)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 807, '0', '기본형 스크래쳐', '튼튼한 재질의 기본 기둥형 스크래쳐입니다.', 20000, 'image5.jpg', 'free size', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 807, '0', '판형 스크래쳐', '바닥에 놓고 사용하는 평평한 형태의 스크래쳐입니다.', 15000, 'image6.jpg', 'free size', '전 연령', '고양이', 120);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 807, '0', '소파형 스크래쳐', '고양이가 앉아서 긁을 수 있는 소파 모양의 스크래쳐입니다.', 35000, 'image7.jpg', 'medium', '전 연령', '고양이', 80);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 807, '0', '삼각형 스크래쳐', '공간을 적게 차지하는 삼각형 모양의 스크래쳐입니다.', 25000, 'image8.jpg', 'small', '전 연령', '고양이', 90);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 807, '0', '터널형 스크래쳐', '터널 기능이 있는 스크래쳐로 놀이와 긁기를 동시에 할 수 있습니다.', 40000, 'image9.jpg', 'medium', '전 연령', '고양이', 70);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 807, '0', '벽걸이형 스크래쳐', '벽에 부착하여 사용하는 공간 절약형 스크래쳐입니다.', 30000, 'image1.jpg', 'free size', '전 연령', '고양이', 85);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 807, '0', '골판지 스크래쳐', '교체가 쉬운 친환경 골판지 재질의 스크래쳐입니다.', 12000, 'image2.jpg', 'free size', '전 연령', '고양이', 150);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 807, '0', '원형 스크래쳐', '360도 어느 방향에서나 긁을 수 있는 원형 스크래쳐입니다.', 28000, 'image3.jpg', 'medium', '전 연령', '고양이', 75);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 807, '0', '캣닢 스크래쳐', '캣닢이 포함되어 고양이의 관심을 끄는 스크래쳐입니다.', 22000, 'image4.jpg', 'free size', '전 연령', '고양이', 100);

-- 고양이장난감 (line_no: 808)
INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 808, '0', '깃털 낚시대', '흔들면 재미있게 움직이는 깃털 달린 낚시대입니다.', 10000, 'image5.jpg', 'free size', '전 연령', '고양이', 150);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 808, '0', '레이저 포인터', '고양이의 사냥 본능을 자극하는 레이저 포인터입니다.', 15000, 'image6.jpg', 'free size', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 808, '0', '캣닢 쿠션', '캣닢이 들어있어 고양이가 좋아하는 작은 쿠션입니다.', 8000, 'image7.jpg', 'free size', '전 연령', '고양이', 200);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 808, '0', '자동 레이저 장난감', '자동으로 움직이는 레이저 빔으로 고양이와 놀아줍니다.', 25000, 'image8.jpg', 'free size', '전 연령', '고양이', 80);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 808, '0', '터널 장난감', '고양이가 들어가서 놀 수 있는 접이식 터널입니다.', 20000, 'image9.jpg', 'free size', '전 연령', '고양이', 100);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 808, '0', '삑삑이 쥐 인형', '쥐 모양의 소리나는 장난감입니다.', 7000, 'image1.jpg', 'free size', '전 연령', '고양이', 180);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 808, '0', '고양이 공 세트', '방울이 들어있는 다양한 크기의 공 세트입니다.', 12000, 'image2.jpg', 'free size', '전 연령', '고양이', 120);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 808, '0', '전동 나비 장난감', '나비처럼 움직이는 전동 장난감입니다.', 18000, 'image3.jpg', 'free size', '전 연령', '고양이', 90);

INSERT INTO tbl_item (item_no, line_no, item_code, item_name, item_desc, item_price, item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock)
VALUES (seq_item_no.NEXTVAL, 808, '0', '캣닢 버블', '터지면 캣닢 향이 나는 비눗방울 장난감입니다.', 9000, 'image4.jpg', 'free size', '전 연령', '고양이', 150);

UPDATE tbl_item
SET item_image = 'line/' || line_no || 'a.jpg';

UPDATE tbl_item
SET    updated_date = SYSDATE
WHERE  MOD(item_no, 23) = 0;

commit;
