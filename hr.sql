
-- DROP TABLE TB_TODO CASCADE CONSTRAINTS ;
-- DROP TABLE TB_MEMBER CASCADE CONSTRAINTS ;

CREATE TABLE tb_member
(
    mb_id         VARCHAR2(30)     NOT NULL, 
    mb_pw         VARCHAR2(30)     NULL, 
    mb_phone      VARCHAR2(20)     NULL, 
    mb_nick       VARCHAR2(20)     NULL, 
    mb_img        VARCHAR2(600)    NULL, 
    created_at    DATE             NULL, 
     PRIMARY KEY (mb_id)
);

-- ���̺� ���� SQL - tb_todo
CREATE TABLE tb_todo
(
    todo_seq        NUMBER(15, 0), 
    todo_id         VARCHAR2(30)    NOT NULL ,
    todo_content    VARCHAR2(4000)  DEFAULT '������ �Է��� �ּ���~^*^', 
    todo_status     VARCHAR2(20)    DEFAULT 'false' , 
    todo_date       VARCHAR2(30)    DEFAULT SYSDATE , 
    PRIMARY KEY (todo_seq)
);

CREATE TABLE TB_TODOCM 
(
  TODOCM_SEQ NUMBER(15, 0) 
, TODOCM_CONTENT VARCHAR2(4000) DEFAULT '^*^'
, TODOCM_STATUS VARCHAR2(20) DEFAULT 'true'
, TODOCM_DATE DATE DEFAULT SYSDATE 
, PRIMARY KEY (TODOCM_SEQ) 
);

CREATE SEQUENCE tb_todocm_SEQ
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER tb_todocm_AI_TRG
BEFORE INSERT ON tb_todocm 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_todocm_SEQ.NEXTVAL
    INTO :NEW.todocm_seq
    FROM DUAL;
END;
/

COMMENT ON COLUMN TB_TODOCM.TODOCM_SEQ IS '������ ����';
COMMENT ON COLUMN TB_TODOCM.TODOCM_CONTENT IS '������ ����';
COMMENT ON COLUMN TB_TODOCM.TODOCM_STATUS IS '������ ����';

SELECT * FROM TB_MEMBER ;
SELECT * FROM TB_CALENDAR ;
SELECT * FROM TB_TODO ORDER BY TODO_SEQ DESC ;
SELECT * FROM TB_TODOCM  ORDER BY TODOCM_SEQ ;

-- ������ ���� SQL - tb_todo.todo_seq
CREATE SEQUENCE tb_todo_SEQ
START WITH 1
INCREMENT BY 1;

-- Ʈ���� ���� SQL - tb_todo.todo_seq
CREATE OR REPLACE TRIGGER tb_todo_AI_TRG
BEFORE INSERT ON tb_todo 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_todo_SEQ.NEXTVAL
    INTO :NEW.todo_seq
    FROM DUAL;
END;
/

-- DROP TRIGGER tb_todo_AI_TRG; 

-- DROP SEQUENCE tb_todo_SEQ; 

SELECT * FROM TB_TODO ;

DELETE FROM TB_TODO ; 

COMMIT ;

INSERT INTO TB_TODO (
        TODO_SEQ,
        TODO_ID,
        TODO_CONTENT,
        TODO_STATUS
        ) VALUES (
        TB_TODO_SEQ.NEXTVAL,
        'TEST_ID',
        'TEST',
        'FALSE'
        ) ;

SELECT * FROM TB_TODO ;
        
COMMIT ;

ALTER TABLE TB_TODO DROP COLUMN todo_color ;

ALTER TABLE TB_TODO ADD todo_id VARCHAR2(30) ;
ALTER TABLE TB_TODO ADD todo_date DATE DEFAULT SYSDATE ;

ALTER TABLE TB_TODO MODIFY todo_id NOT NULL ;
ALTER TABLE TB_TODO MODIFY todo_status DEFAULT 'false' ;

SELECT * FROM TB_TODO ;

-- Auto Increment�� ���� Sequence �߰� SQL - tb_todo.todo_seq
CREATE SEQUENCE tb_todo_SEQ
START WITH 1
INCREMENT BY 1;

INSERT INTO TB_TODO (
        TODO_CONTENT
        ) VALUES (
        'TEST'
        ) ;

SELECT * FROM TB_TODO ;
        
COMMIT ;

-- Auto Increment�� ���� Trigger �߰� SQL - tb_todo.todo_seq
CREATE OR REPLACE TRIGGER tb_todo_AI_TRG
BEFORE INSERT ON tb_todo 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_todo_SEQ.NEXTVAL
    INTO :NEW.todo_seq
    FROM DUAL;
END;
/

INSERT INTO TB_TODO (
        TODO_CONTENT
        ) VALUES (
        'TEST'
        ) ;

SELECT * FROM TB_TODO ORDER BY TODO_SEQ DESC ;

DELETE FROM TB_TODO ;
        
COMMIT ;

-- ���̺� Comment ���� SQL - tb_todo
COMMENT ON TABLE tb_todo IS '���� ���';

-- �÷� Comment ���� SQL - tb_todo.todo_seq
COMMENT ON COLUMN tb_todo.todo_seq IS '���� ����';

-- �÷� Comment ���� SQL - tb_todo.todo_content
COMMENT ON COLUMN tb_todo.todo_content IS '���� ����';

-- �÷� Comment ���� SQL - tb_todo.cal_seq
COMMENT ON COLUMN tb_todo.cal_seq IS '���� ����';

-- �÷� Comment ���� SQL - tb_todo.todo_status
COMMENT ON COLUMN tb_todo.todo_status IS '���� ����';

-- �÷� Comment ���� SQL - tb_todo.todo_color
COMMENT ON COLUMN tb_todo.todo_color IS '���� ����';

-- Foreign Key ���� SQL - tb_todo(cal_seq) -> tb_calender(cal_seq)
ALTER TABLE tb_todo
    ADD CONSTRAINT FK_tb_todo_cal_seq_tb_calender FOREIGN KEY (cal_seq)
        REFERENCES tb_calender (cal_seq) ;

-- Foreign Key ���� SQL - tb_todo(cal_seq)
-- ALTER TABLE tb_todo
-- DROP CONSTRAINT FK_tb_todo_cal_seq_tb_calender;

-- DROP TRIGGER tb_todo_AI_TRG; 

-- DROP SEQUENCE tb_todo_SEQ; 




DROP TABLE MEMBER ;

-- ȸ�������� ������ TABLE : MEMBER 
-- COLUMNS : ID, PW, GENDER, NICK, TEL 

CREATE TABLE MEMBER (
                    ID VARCHAR2(50),
                    PW VARCHAR2(50) NOT NULL,
                    GENDER VARCHAR2(5) NOT NULL,
                    NICK VARCHAR2(50) UNIQUE,
                    TEL VARCHAR2(50) NOT NULL,
                    
                    CONSTRAINT MEMBER_ID_PK PRIMARY KEY(ID)
                    ) ; 
                    
SELECT * FROM MEMBER ;
commit ;

update MEMBER 
  	   set pw = '123'
  	     , gender = '��'
  	     , tel = '12345'
  	 where id = '123' ;
     
     select * from msg_member ;

select email, pw from MSG_MEMBER where 
	email = 123
	and pw = 123 ;
    
insert into msg_member values (
'smhrd',
'123',
'123',
'123'
) ;

commit ;


		update MSG_MEMBER set
		pw = '123',
		tel = '123',
		address = '123'
		where email = '1'
		and pw = '1' ;

COMMIT ;        

rollback ;

DROP SEQUENCE MSG_IDX_SEQ ;

CREATE SEQUENCE MSG_IDX_SEQ
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 999999
    NOCACHE
    NOCYCLE ;
    
DROP TABLE MSG_BOARD ;

CREATE TABLE MSG_BOARD (
       IDX NUMBER,
       TITLE VARCHAR2(50) NOT NULL,
       WRITER VARCHAR2(50) NOT NULL,
       CONTENT VARCHAR2(1000) NOT NULL,
       IMG VARCHAR2(100),
       INDATE DATE DEFAULT SYSDATE,
       COUNT NUMBER DEFAULT 0,
       
       CONSTRAINT MSG_IDX_PK PRIMARY KEY (IDX),
       CONSTRAINT MSG_WRITER_FK FOREIGN KEY (WRITER) REFERENCES MSG_MEMBER(EMAIL) 
       ) ;
       
SELECT * FROM MSG_MEMBER ;
SELECT * FROM MSG_BOARD 
 ORDER BY IDX DESC ;
 //-- where writer = 'smhrd' ;

INSERT INTO MSG_BOARD (
            IDX
          , TITLE
          , WRITER
          , CONTENT
          ) VALUES (
            MSG_IDX_SEQ.NEXTVAL
          , '�Խ��� �����5'
          , 'smhrd'
          , '��ſ� JSP �Խ��� �����'
          ) ;
          
DELETE FROM MSG_BOARD ;

SELECT * FROM MSG_BOARD 
 ORDER BY IDX DESC ;

COMMIT ; 
