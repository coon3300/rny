-- 2. line 테이블
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
CREATE SEQUENCE seq_line_no INCREMENT BY 1 START WITH 1 MINVALUE 1 NOMAXVALUE NOCYCLE NOCACHE NOORDER;

ALTER TABLE tbl_line
ADD CONSTRAINT uk_tbl_line_line_name UNIQUE (line_name);

ALTER TABLE tbl_line
ADD CONSTRAINT fk_tbl_line_line_parent_no FOREIGN KEY (line_parent_no) REFERENCES tbl_line(line_no);

-- 3. item 테이블
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


-- 2. tbl_line
DECLARE
    v_level2_count NUMBER := 8;
    v_level3_count NUMBER;
    v_level4_count NUMBER;
    v_parent_no NUMBER;
    v_level2_no NUMBER;
    v_level3_no NUMBER;
BEGIN
    INSERT INTO tbl_line (line_no, line_parent_no, line_name, line_desc)
    VALUES (seq_line_no.NEXTVAL, NULL, '최상위 라인', '최상위 라인 설명');
    v_parent_no := seq_line_no.CURRVAL;
    FOR i IN 1..v_level2_count LOOP
        INSERT INTO tbl_line (line_no, line_parent_no, line_name, line_desc)
        VALUES (seq_line_no.NEXTVAL, v_parent_no, '상위 라인 ' || i, '상위 라인 설명 ' || i);        
        v_level2_no := seq_line_no.CURRVAL;
        v_level3_count := FLOOR(DBMS_RANDOM.VALUE(3, 6));
        FOR j IN 1..v_level3_count LOOP
            INSERT INTO tbl_line (line_no, line_parent_no, line_name, line_desc)
            VALUES (seq_line_no.NEXTVAL, v_level2_no, '하위 라인 ' || i || '-' || j, '하위 라인 설명 ' || i || '-' || j);            
            v_level3_no := seq_line_no.CURRVAL;
            v_level4_count := FLOOR(DBMS_RANDOM.VALUE(3, 6));
            FOR k IN 1..v_level4_count LOOP
                INSERT INTO tbl_line (line_no, line_parent_no, line_name, line_desc)
                VALUES (seq_line_no.NEXTVAL, v_level3_no, '사이드 라인 ' || i || '-' || j || '-' || k, '사이드 라인 설명 ' || i || '-' || j || '-' || k);
            END LOOP;
        END LOOP;
    END LOOP;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('tbl_line 데이터 입력 완료.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('tbl_line 최종 오류: ' || SQLERRM);
        ROLLBACK;
END;
/



-- 3. tbl_item (tbl_line 참조)
DECLARE
  v_current_i NUMBER;
  v_max_line_no NUMBER;
BEGIN
  SELECT MAX(line_no) INTO v_max_line_no FROM tbl_line;
  
  FOR i IN 1..5000 LOOP
    v_current_i := i;
    BEGIN
      INSERT INTO tbl_item (
        item_no, line_no, item_code, item_name, item_desc, item_price, 
        item_image, item_pet_size, item_pet_age_range, item_pet_breed, item_stock
      ) VALUES (
        seq_item_no.NEXTVAL,
        FLOOR(DBMS_RANDOM.VALUE(1, v_max_line_no + 1)),
        '상품' || LPAD(i, 4, '0'),
        '상품명' || i,
        '상품 설명 ' || i,
        ROUND(DBMS_RANDOM.VALUE(1000, 100000), -2),
        '이미지_' || i || '.jpg',
        CASE FLOOR(DBMS_RANDOM.VALUE(1, 4))
          WHEN 1 THEN '소형'
          WHEN 2 THEN '중형'
          ELSE '대형'
        END,
        CASE FLOOR(DBMS_RANDOM.VALUE(1, 4))
          WHEN 1 THEN '강아지'
          WHEN 2 THEN '성견'
          ELSE '노견'
        END,
        CASE FLOOR(DBMS_RANDOM.VALUE(1, 6))
          WHEN 1 THEN '래브라도 리트리버'
          WHEN 2 THEN '저먼 셰퍼드'
          WHEN 3 THEN '골든 리트리버'
          WHEN 4 THEN '불독'
          ELSE '푸들'
        END,
        FLOOR(DBMS_RANDOM.VALUE(0, 1000))
      );
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('tbl_item 데이터 입력 중 오류 발생 (i = ' || i || '): ' || SQLERRM);
    END;
  END LOOP;
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('tbl_item 데이터 입력 완료.');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('tbl_item 최종 오류: ' || SQLERRM);
    ROLLBACK;
END;
/
