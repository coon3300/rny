-- buy 테이블 생성
CREATE TABLE buy (
    buy_no NUMBER,
    user_no varchar2(30) NOT NULL,
    buy_status VARCHAR2(20) DEFAULT '결제완료', -- 
    buy_price NUMBER(10) NOT NULL,
    created_at DATE DEFAULT SYSDATE NOT NULL, -- 생성 날짜
    updated_at DATE DEFAULT SYSDATE NOT NULL, -- 마지막 업데이트 날짜
    deleted_at DATE, -- 삭제 날짜
    is_deleted NUMBER(1) DEFAULT 0 -- 삭제 여부 플래그
);
CREATE SEQUENCE seq_buy_no INCREMENT BY 1 START WITH 1 MINVALUE 1 NOMAXVALUE NOCYCLE NOCACHE NOORDER;


-- buy_detail 테이블 생성
CREATE TABLE buy_detail (
    buy_detail_no NUMBER,
    buy_no NUMBER NOT NULL,
    item_no NUMBER NOT NULL,
    item_cnt NUMBER NOT NULL,
    created_at DATE DEFAULT SYSDATE NOT NULL, -- 생성 날짜
    updated_at DATE DEFAULT SYSDATE NOT NULL, -- 마지막 업데이트 날짜
    deleted_at DATE, -- 삭제 날짜
    is_deleted NUMBER(1) DEFAULT 0 -- 삭제 여부 플래그
);

CREATE SEQUENCE seq_buy_detail_no INCREMENT BY 1 START WITH 1 MINVALUE 1 NOMAXVALUE NOCYCLE NOCACHE NOORDER;

-- basket 테이블 생성
CREATE TABLE basket (
    basket_no NUMBER,
    user_no varchar2(30) NOT NULL,
    created_at DATE DEFAULT SYSDATE NOT NULL, -- 생성 날짜
    updated_at DATE DEFAULT SYSDATE NOT NULL, -- 마지막 업데이트 날짜
    deleted_at DATE, -- 삭제 날짜
    is_deleted NUMBER(1) DEFAULT 0 -- 삭제 여부 플래그
);
CREATE SEQUENCE seq_basket_no INCREMENT BY 1 START WITH 1 MINVALUE 1 NOMAXVALUE NOCYCLE NOCACHE NOORDER;


-- basket_detail 테이블 생성
CREATE TABLE basket_detail (
    basket_detail_no NUMBER,
    basket_no NUMBER NOT NULL,
    item_no NUMBER NOT NULL,
    item_cnt NUMBER NOT NULL,
    created_at DATE DEFAULT SYSDATE NOT NULL, -- 생성 날짜
    updated_at DATE DEFAULT SYSDATE NOT NULL, -- 마지막 업데이트 날짜
    deleted_at DATE, -- 삭제 날짜
    is_deleted NUMBER(1) DEFAULT 0 -- 삭제 여부 플래그
);

CREATE SEQUENCE basket_detail_no INCREMENT BY 1 START WITH 1 MINVALUE 1 NOMAXVALUE NOCYCLE NOCACHE NOORDER;