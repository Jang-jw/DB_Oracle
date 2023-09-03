
-- DROP TABLE TB_CHAT CASCADE CONSTRAINTS ;

-- ���̺� ���� SQL - tb_chat
CREATE TABLE tb_chat
(
    chat_id         VARCHAR2(30)    NOT NULL ,
    chat_room_id         VARCHAR2(30)    NOT NULL ,
    chat_content    VARCHAR2(4000)  DEFAULT '������ �Է��� �ּ���~^*^', 
    todo_status     VARCHAR2(20)    DEFAULT 'true' , 
    todo_date       VARCHAR2(30)    DEFAULT SYSDATE 
);

SELECT * FROM TB_CHAT ;

COMMIT ;

-- ���̵�1 ä�÷�2 ä�ó���
SELECT * FROM TB_CHAT
 WHERE CHAT_ID = '���̵� 1'
   AND CHAT_ROOM_ID = 'ä�÷� 2' ;
   
   