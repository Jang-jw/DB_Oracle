
-- DROP TABLE TB_CHAT CASCADE CONSTRAINTS ;

-- 테이블 생성 SQL - tb_chat
CREATE TABLE tb_chat
(
    chat_id         VARCHAR2(30)    NOT NULL ,
    chat_room_id         VARCHAR2(30)    NOT NULL ,
    chat_content    VARCHAR2(4000)  DEFAULT '내용을 입력해 주세요~^*^', 
    todo_status     VARCHAR2(20)    DEFAULT 'true' , 
    todo_date       VARCHAR2(30)    DEFAULT SYSDATE 
);

SELECT * FROM TB_CHAT ;

COMMIT ;

-- 아이디1 채팅룸2 채팅내용
SELECT * FROM TB_CHAT
 WHERE CHAT_ID = '아이디 1'
   AND CHAT_ROOM_ID = '채팅룸 2' ;
   
   