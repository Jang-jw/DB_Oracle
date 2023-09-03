--
--
-- SELECT �⺻
-- 1. SQL �ǹ̿� ���� 

SELECT PAY_CARD_NO, JOIN_DY
    FROM TB_MEMBER 
    WHERE MEMBER_ID = 'BBBBB' ;

SELECT * 
    FROM TB_MEMBER ;
    
SELECT * -- �����͸���ũ 
    FROM MAPPING 
    WHERE ENG ='PAY' ; 
    
    
    
    
-- 2. SQL ���� ����

SELECT MEMBER_ID, MEMBER_NAME, GRADE_CD
    FROM TB_MEMBER
    WHERE GRADE_CD = 2 ; 
    
    
-- �ǽ�
    
SELECT MEMBER_NAME
     , GENDER
     , AGE 
    FROM TB_MEMBER ; 
    
SELECT GRADE_CD
     , GRADE_NAME 
    FROM TB_GRADE ; 
    
SELECT PRD_ID
     , PRD_NAME
     , PRD_INFO 
    FROM TB_PRD ; 
    
    
    
    
 -- 3. * �� DISTINCT, AS 
    
SELECT * 
    FROM TB_PRD ; 
    
SELECT * 
    FROM TB_MEMBER ; -- ���������� * �� �� ���� �ʴ´�. ��� �÷��� Ÿ���� �ϴ°� ����. 
    
SELECT DISTINCT PRD_TYPE -- �ߺ����� 
     FROM TB_PRD ; 
     
     
-- �ǽ�
     
SELECT DISTINCT GENDER
     FROM TB_MEMBER ; 
     
SELECT DISTINCT GRADE_CD
     FROM TB_MEMBER ;
     
SELECT MEMBER_ID AS M_ID 
     , MEMBER_NAME AS M_NAME
     , PAY_CARD_NO AS P_CARD
     FROM TB_MEMBER ; -- Ư�����ڴ� $ # _ �������� ���� 
     
     
-- NULL �̶�?


    
    
SELECT * 
     FROM TB_MEMBER
WHERE MEMBER_ID = 'HHHHH' ; -- NULL �� '���� �������� �ʾҽ��ϴ�.'��� ������ 

/*
INSERT INTO TB_MEMBER ( 
MEMBER_ID
, MEMBER_NAME
, PASSWD
, PAY_CARD_NO
, JOIN_DY
, GRADE_CD
, AGE
, DEL_YN 
) VALUES ( 
'JJJJJ'
, '���ο���'
, 'JJJJJ'
, 'AAAA-AAAA-AAAA-AAAA'
, '20230519'
, 1
, 30
, 'N'
) ;
*/


SELECT * 
     FROM TB_MEMBER
WHERE MEMBER_NAME = '�����H' ;




-- 5. �ڷ����� ���ͷ� 
-- �ǽ� 

CREATE TABLE �ڷ����׽�Ʈ ( --�ڷ����׽�Ʈ ��� �̸��� ���̺��� ����ϴ�. 
�����÷� VARCHAR2(10) , --�����÷� �̶�� �÷��� ������ �ڷ���(VARCHAR2)�ο�
�����÷� NUMBER , --�����÷� �̶�� �÷��� ������ �ڷ���(NUMBER) �ο�
��¥�÷� DATE ) ; --��¥�÷� �̶�� �÷��� ��¥�� �ڷ���(DATE) �ο�

/*
INSERT INTO �ڷ����׽�Ʈ ( �����÷� , �����÷� , ��¥�÷� ) VALUES ( 'A' , 1 , SYSDATE );
INSERT INTO �ڷ����׽�Ʈ ( �����÷� , �����÷� , ��¥�÷� ) VALUES ( 'A' , '3��' , SYSDATE );
INSERT INTO �ڷ����׽�Ʈ ( �����÷� , �����÷� , ��¥�÷� ) VALUES ( 'A' , 3 , 1 );
INSERT INTO �ڷ����׽�Ʈ ( �����÷� , �����÷� , ��¥�÷� ) VALUES ( 'BB' , '3' , SYSDATE );
*/


SELECT * FROM �ڷ����׽�Ʈ ;









--
--
-- SELECT ����&�Լ� 
-- 1. SELECT�� ���ͷ� ����ϱ�

SELECT PRD_ID
     , PRD_NAME
     , PRD_PRICE
     , 10 AS ����
FROM TB_PRD ; /* ��ǰ���̺� */ -- 19���� ������




-- 2. SELECT ���� ��Ģ�����ϱ�

SELECT PRD_ID
     PRD_NAME
     , PRD_PRICE
     , 5000
     , PRD_PRICE + 5000
  FROM TB_PRD ;
  
  
-- �ǽ�
  
SELECT PRD_ID
     , PRD_NAME
     , PRD_PRICE -- ��ǰ���� 
     , PRD_PRICE * 0.1 AS �ΰ���ġ�� 
     , PRD_PRICE + PRD_PRICE * 0.1 AS �ǸŰ���
  FROM TB_PRD ;
  
  
  
  
-- 3. SELECT ���� ����(||) �����ϱ�
  
SELECT GRADE_NAME || '(��޷���:' || GRADE_CD || ')' AS ��޸������
  FROM TB_GRADE ; /* ��� ���̺� */
  
SELECT * FROM TB_MEMBER ;


-- �ǽ� 

SELECT MEMBER_ID 
     || ' ȸ���� ī���ȣ�� ' 
     || PAY_CARD_NO 
     || ' �Դϴ�.' 
     AS ȸ��ī���ȣ
  FROM TB_MEMBER ;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
SELECT *
  FROM TB_PRD ; -- SHIFT F4 : �������� 
  
SELECT LOWER('ABCDE123@@') AS LOWER���
  FROM DUAL ; 
  
SELECT MEMBER_ID , PASSWD , LOWER(PASSWD) AS �н�����ҹ���
  FROM  TB_MEMBER ; 
  
SELECT PRD_ID
     , PRD_INFO
     , SUBSTR(PRD_INFO , 1 , 5) || '...' AS ��ǰ�������
  FROM TB_PRD
  WHERE PRD_TYPE = '����' ;
  
SELECT TRIM(' �ȳ��ϼ��� '), TRIM(  '��  ��  �� �� �� ')
  FROM DUAL ;
  
SELECT MEMBER_ID
     , PAY_CARD_NO
     , REPLACE(PAY_CARD_NO , '-' , '#') AS Ư������
  FROM TB_MEMBER
 WHERE GRADE_CD = 2 ;

-- ���� 

SELECT SUBSTR('https://smhrd.or.kr/' , 9 , 5) AS ���
  FROM DUAL ;

SELECT MEMBER_ID
     , MEMBER_NAME
     , JOIN_DY
     , SUBSTR(JOIN_DY , 1 , 4) AS ���Գ⵵ 
  FROM TB_MEMBER ;
  
SELECT MEMBER_ID
     , PAY_CARD_NO
     , REPLACE(PAY_CARD_NO , '-' , '/')
  FROM TB_MEMBER ; 
  
SELECT MOD(100, 8) AS ��������
     , MOD(30,10) AS ��������2
  FROM DUAL ;
  
SELECT ROUND(1.452, 2)
     , ROUND(1.452, 1)
  FROM DUAL ;
  
SELECT SYSDATE -- YYYY/MM/DD H24:MI:SS 
  FROM DUAL ;
  
SELECT SYSDATE + 1 AS �Ϸ����
     , SYSDATE + 1/24 �ѽð�����
     , SYSDATE + 1/24/60 �Ϻд���
     , SYSDATE + 1/24/60/60 ���ʴ���
  FROM DUAL ;
  
-- �� ��ȯ �Լ� 

SELECT TO_NUMBER('1') FROM DUAL ; -- ������('1')�� ������(1) �� ����ȯ�� ���
SELECT TO_CHAR(1) FROM DUAL ; --������(1)�� ������('1') �� ����ȯ�� ���
SELECT TO_CHAR(SYSDATE , 'YYYY/MM/DD HH24:MI:SS') FROM DUAL ; 
SELECT TO_CHAR(SYSDATE , 'YYYYMMDD') FROM DUAL ;
SELECT TO_DATE('20230101' , 'YYYY/MM/DD') FROM DUAL ; 
SELECT TO_DATE('20230101141212' , 'YYYY/MM/DD HH24:MI:SS') FROM DUAL;
/*
YYYY : �⵵4�ڸ� 
  MM : ��2�ڸ� (���� 1���̸� 01�� ǥ��)
  DD : ��2�ڸ� (���� 1���̸� 01�� ǥ��)
YY24 : �ð� (24�ð���) 0~23��
  HH : �ð� (12�ð���) 0~11��
  MI : �� (0~59)
  SS : �� (0~59)
*/




-- �ǽ� 

SELECT PRD_NAME
     , PRD_PRICE
     , SELL_COMP_NAME
     , REG_DATE
     , TO_CHAR(REG_DATE, 'YYYYMMDD') AS ��ϳ����
  FROM TB_PRD ;
  
SELECT MEMBER_NAME + 1000 FROM TB_MEMBER ; -- ����ȵ� (���� + ����) 
SELECT '1' + 1 FROM DUAL ; -- ����� (���� ����ȯ) 

-- NULL �� �������� �������, �񱳿����� �Ұ����ϴ�. 
SELECT MEMBER_ID
     , AGE
     , AGE + 1
  FROM TB_MEMBER ;
  
SELECT MEMBER_ID
     , AGE
     , NVL(AGE, 20) + 1 -- NULL �� ��ȯ (�������� ���� ����) 
  FROM TB_MEMBER ;
  
SELECT MEMBER_NAME
     , AGE
     , DECODE(AGE, NULL, 0, AGE)
  FROM TB_MEMBER ;
  
SELECT MEMBER_NAME
     , GRADE_CD
     , DECODE(GRADE_CD, 1, '�����', 2, '�ǹ�', 3, '���', 4, 'VIP', 'VVIP') AS ���
  FROM TB_MEMBER ;
  
SELECT COALESCE(NULL, NULL, 2, NULL, 3)
  FROM DUAL ;
  
SELECT MEMBER_ID
     , PASSWD
     , NVL(AGE, 20) AS AGE
  FROM TB_MEMBER ;
  
SELECT MEMBER_ID
     , GENDER
     , DECODE(GENDER, '��', 'MAN', '��', 'WOMAN', 'ELSE') AS ����
  FROM TB_MEMBER ;
  
-- 2023.05.23 ����

SELECT MEMBER_ID --ȸ��ID 
     , MEMBER_NAME --ȸ���̸� 
     , PASSWD --��й�ȣ 
     , GRADE_CD --����ڵ� 
     , GENDER --���� 
  FROM TB_MEMBER /* ȸ������ ���̺� */ 
 WHERE GRADE_CD = 3 ;

SELECT *
  FROM TB_MEMBER
 WHERE GENDER = '��' ;
 
SELECT *
  FROM TB_PRD
 WHERE PRD_PRICE >= 1000000 ;
 
-- ����Ǯ�� 

SELECT *
  FROM TB_GRADE
 WHERE GRADE_CD >= 4 ;
 
SELECT *
  FROM TB_MEMBER
 WHERE MEMBER_NAME = '�����D' ;
 
SELECT *
  FROM TB_MEMBER_TEL
 WHERE TEL_DV_CD = '��' ;
 
SELECT PRD_ID
     , PRD_NAME
     , PRD_PRICE
  FROM TB_PRD
 WHERE PRD_PRICE >= 1500000 ;
 
SELECT *
  FROM MAPPING 
 WHERE ENG = 'TEL' ;

-- ȥ�ڿ��� 

SELECT G.GRADE_CD
     , M.MEMBER_NAME
     , D.TEL_DV_CD
  FROM TB_GRADE G, TB_MEMBER M, TB_MEMBER_TEL D
 WHERE G.GRADE_CD = 4 ;

SELECT *
  FROM TB_MEMBER
 WHERE MEMBER_ID = 'AAAAA'
   AND PASSWD = 'AAAAA' ;
   
SELECT *
  FROM TB_PRD
 WHERE PRD_TYPE = '��ǻ��'
    OR PRD_TYPE = '����Ʈ��' ;
    
-- ����Ǯ�� 

SELECT *
  FROM TB_MEMBER
 WHERE GRADE_CD = 2
   AND GENDER = '��' ;
   
SELECT PRD_NAME
     , PRD_TYPE
     , PRD_PRICE
  FROM TB_PRD
 WHERE PRD_TYPE = '��ǿ�ǰ'
   AND SELL_COMP_NAME = '�ٿ��'
   AND PRD_PRICE >= 20000 ;
   
SELECT *
  FROM TB_MEMBER
 WHERE MEMBER_ID = 'AAAAA'
    OR MEMBER_ID = 'BBBBB' ;
    
-- OR , AND ���� ���� 
SELECT *
  FROM TB_MEMBER
 WHERE GRADE_CD = 3
    OR AGE = 30
   AND GENDER = '��' ;

SELECT *
  FROM TB_MEMBER
 WHERE (GRADE_CD = 3
    OR AGE = 30) -- ��ȣ�� ������ �ٲ� �� �ִ� 
   AND GENDER = '��' ;
   
-- ���� ���� 
SELECT *
  FROM TB_PRD
 WHERE NOT PRD_TYPE = '����' ; -- �����ʴ�
 
SELECT *
  FROM TB_PRD
 WHERE PRD_TYPE != '����' ; -- �����ʴ� (�ǹ����� ���� ���)
 
SELECT *
  FROM TB_PRD
 WHERE PRD_TYPE <> '����' ; -- �����ʴ�  
 
SELECT *
  FROM TB_MEMBER
 WHERE NOT AGE < 30 ; -- NOT 
 
SELECT *
  FROM TB_MEMBER
 WHERE AGE >= 30 ; -- �ǹ����� ���� ��� 
 
 
-- ����Ǯ�� 

SELECT *
  FROM TB_MEMBER_TEL
 WHERE TEL_DV_CD != '�޴���' ;
 
SELECT *
  FROM TB_PRD
 WHERE PRD_PRICE <= 15000 ;
 
 
-- NULL ����

SELECT *
  FROM TB_MEMBER
 WHERE GENDER = NULL ; -- NULL �� �������� ���, �񱳿����� �Ұ��� 

SELECT *
  FROM TB_MEMBER
 WHERE GENDER IS NULL ; -- IS �� ���� �� ��� 
 
SELECT *
  FROM TB_MEMBER
 WHERE GENDER IS NOT NULL ; -- IS NOT ���� �������� ���� 
 
 
-- ����Ǯ�� 

SELECT *
  FROM TB_MEMBER 
 WHERE AGE IS NOT NULL ;
 
SELECT *
  FROM TB_MEMBER
 WHERE GENDER IS NOT NULL
   AND    AGE IS NOT NULL ;
   
   
   -- SQL ������ 
   -- IN 
SELECT *
  FROM TB_PRD
 WHERE PRD_TYPE = '����'
    OR PRD_TYPE = '��ǿ�ǰ'
    OR PRD_TYPE = '����Ʈ��'
    OR PRD_TYPE = '��ǻ��' ;
    
SELECT *
  FROM TB_PRD
 WHERE PRD_TYPE IN ('����', '��ǿ�ǰ', '����Ʈ��', '��ǻ��') ; -- IN ���� ������ �����ϰ� 

SELECT *
  FROM TB_PRD
 WHERE PRD_TYPE IN ('����', '��ǿ�ǰ', 'NULL', '����Ʈ��', '��ǻ��') ; -- NULL �� �����ϰ� ��� 

SELECT *
  FROM TB_PRD
 WHERE PRD_TYPE NOT IN ('����', '��ǿ�ǰ', '����Ʈ��') ; -- NOT IN ���� ����ó�� 

SELECT *
  FROM TB_PRD
 WHERE PRD_TYPE NOT IN ('����', '��ǿ�ǰ', NULL, '����Ʈ��') ; -- NOT IN �� NULL �� ������ ��� ���� 
 
 
 -- ����Ǯ�� 
 
SELECT *
  FROM TB_MEMBER
 WHERE GRADE_CD IN (1, 2) ;
 
SELECT *
  FROM TB_MEMBER
 WHERE AGE IN (25, 30, 35) ;
 
 
 -- BETWEEN 
 
SELECT *
  FROM TB_MEMBER
 WHERE AGE >= 20
   AND AGE <= 35 ;
   
SELECT *
  FROM TB_MEMBER
 WHERE AGE BETWEEN 20 AND 35 ; -- BETWEEN ���� ���̰� ��� ( �������Ǻ��ٴ� ����)
 
 -- LIKE ���� 
 
SELECT *
  FROM TB_PRD
 WHERE PRD_NAME LIKE '��%' ; -- 0 �� �̻� ���ڸ� ��Ī�Ѵ�. (�����ϴ� ��� ��) 
 
SELECT *
  FROM TB_PRD
 WHERE PRD_NAME LIKE '%��%' ; -- �����ϴ� ��� �� 
 
SELECT *
  FROM TB_PRD
 WHERE PRD_TYPE LIKE '%��%' ;
 
SELECT *
  FROM TB_PRD
 WHERE PRD_NAME LIKE '%��' ; -- ������ ��� �� 
 
SELECT *
  FROM TB_PRD
 WHERE PRD_NAME LIKE '%��%' ;
 
SELECT *
  FROM TB_PRD
 WHERE PRD_NAME LIKE '__��' ;
 
 -- ����Ǯ�� 
 
SELECT MEMBER_NAME
     , JOIN_DY
  FROM TB_MEMBER
 WHERE JOIN_DY LIKE '2023%' ;
 
SELECT PRD_NAME
     , PRD_PRICE
  FROM TB_PRD
 WHERE PRD_TYPE IN ('�ֹ��ǰ', '��ǿ�ǰ') ;
 
SELECT *
  FROM TB_PRD
 WHERE PRD_INFO LIKE '%������%' ;
 
 
 
 
 --
 --
 -- 2023.05.24
 --
 --
 

 SELECT PRD_ID
     , PRD_NAME
     , REG_DATE
  FROM TB_PRD
 WHERE TO_CHAR (REG_DATE, 'YYYYMMDD') = '20230501'
   OR TO_CHAR (REG_DATE, 'YYYYMMDD') = '20230502' ;

 SELECT PRD_ID  -- �������� ���� ���� ��� 
     , PRD_NAME
     , REG_DATE
  FROM TB_PRD
 WHERE REG_DATE >= TO_DATE('20230501000000', 'YYYYMMDDHH24MISS')
   AND REG_DATE <= TO_DATE('20230503000000', 'YYYYMMDDHH24MISS') ;
   
   -- ���� Ǯ�� 
   
SELECT PRD_NAME
     , PRD_INFO
     , REG_DATE
  FROM TB_PRD
 WHERE REG_DATE >= TO_DATE('20230509000000', 'YYYYMMDDHH24MISS')
   AND REG_DATE <= TO_DATE('20230509235959', 'YYYYMMDDHH24MISS') ;
   
   
   
   
   -- ���̺�� ��Ű���� ����
   
SELECT SHOPPING.TB_MEMBER.MEMBER_ID
     , SHOPPING.TB_MEMBER.MEMBER_NAME
  FROM SHOPPING.TB_MEMBER
 WHERE SHOPPING.TB_MEMBER.GRADE_CD = 1 ;
   
SELECT TB_MEMBER.MEMBER_ID
     , TB_MEMBER.MEMBER_NAME
  FROM TB_MEMBER
 WHERE TB_MEMBER.GRADE_CD = 1 ; -- ��Ű���� �����ص� ���� �� ( ���� ���� ���� ���� )
 
SELECT MEMBER_ID
     , MEMBER_NAME
  FROM TB_MEMBER
 WHERE GRADE_CD = 1 ; -- ���̺��� �����ص� ���� �� ( FROM ���� ���̺� 1���� ��� )
 
SELECT *
  FROM TB_MEMBER
     , TB_MEMBER_TEL ;
     
SELECT A.MEMBER_ID 
     , A.MEMBER_NAME
     , B.MEMBER_ID
     , B.TEL_NO
  FROM TB_MEMBER A
     , TB_MEMBER_TEL B ; -- �������� ���� ��� �� ( ���̺� ��Ī ������ AS �� ������� ���� ) 
     
SELECT A.MEMBER_ID 
     , TB_MEMBER.MEMBER_NAME
     , B.MEMBER_ID
     , B.TEL_NO
  FROM TB_MEMBER A
     , TB_MEMBER_TEL B ; -- ��Ī ���� �� ���̺�� ���� ���� �߻� 
     
SELECT A.ȸ��ID
     , A.�̸�
     , B.�����ڵ�
  FROM ȸ�� A
     , ȸ������ó B 
 WHERE A.ȸ��ID = B.ȸ��ID  -- �������� 
   AND A.ȸ��ID = 'A0001' -- �Ϲ�����
   AND B.�����ڵ� = '�޴���' ;
   
   -- �ǽ� 
   
SELECT A.MEMBER_ID -- '.' �� '���ٿ�����' �̴�. 
     , A.MEMBER_NAME
     , B.MEMBER_ID
     , B.TEL_DV_CD
     , B.TEL_NO
  FROM TB_MEMBER A
     , TB_MEMBER_TEL B ;
     
SELECT A.MEMBER_ID
     , A.MEMBER_NAME
     , B.MEMBER_ID
     , B.TEL_DV_CD
     , B.TEL_NO
  FROM TB_MEMBER A
     , TB_MEMBER_TEL B 
 WHERE A.MEMBER_ID = B.MEMBER_ID ;
     
SELECT A.MEMBER_ID
     , A.MEMBER_NAME
     , B.MEMBER_ID
     , B.TEL_DV_CD
     , B.TEL_NO
  FROM TB_MEMBER A
     , TB_MEMBER_TEL B 
 WHERE A.MEMBER_ID = B.MEMBER_ID
   AND B.TEL_DV_CD = '�޴���' ;
   
SELECT *
  FROM ȸ�� A
     , ȸ������ó B
WHERE A.ȸ��ID = B.ȸ��ID ; -- INNER JOIN 

SELECT *
  FROM ȸ�� A
     , ȸ������ó B
WHERE A.ȸ��ID = B.ȸ��ID(+) ; -- OUTER JOIN 

SELECT *
  FROM ȸ�� A
     , ȸ������ó B
WHERE A.ȸ��ID(+) = B.ȸ��ID ; -- OUTER JOIN 

-- ����Ǯ�� 
-- 1�� 
SELECT A.MEMBER_ID
     , A.MEMBER_NAME
     , B.LIKE_PRD_TYPE AS ��ȣ��ǰŸ��
     , B.REG_DATE AS ����Ͻ�
  FROM TB_MEMBER A
     , TB_MEMBER_LIKE B
 WHERE A.MEMBER_ID = B.MEMBER_ID 
   AND A.MEMBER_ID = 'BBBBB' ;
 
-- 2�� 
SELECT A.MEMBER_ID
     , A.MEMBER_NAME
     , A.GRADE_CD
     , B.TEL_NO
  FROM TB_MEMBER A
     , TB_MEMBER_TEL B
 WHERE A.MEMBER_ID = B.MEMBER_ID(+) ;
 
-- 3�� 
SELECT A.MEMBER_ID
     , A.MEMBER_NAME
     , A.GRADE_CD
     , B.TEL_NO
  FROM TB_MEMBER A
     , TB_MEMBER_TEL B
 WHERE A.MEMBER_ID = B.MEMBER_ID(+)
   AND B.TEL_NO IS NULL ;
   
-- 4�� 
SELECT B.MEMBER_ID
     , B.MEMBER_NAME
     , C.PRD_ID
     , C.PRD_NAME
     , A.ORDER_NO
     , A.ORDER_DATE
  FROM TB_ORDER  A
     , TB_MEMBER B
     , TB_PRD    C
 WHERE A.MEMBER_ID = B.MEMBER_ID
   AND A.PRD_ID = C.PRD_ID
   AND B.MEMBER_ID = 'AAAAA' ;
 
-- 5�� 
SELECT B.MEMBER_ID
     , B.PRD_ID
     , A.PRD_NAME
  FROM TB_PRD A
     , TB_WISH B
 WHERE A.PRD_ID = B.PRD_ID
   AND B.MEMBER_ID = 'AAAAA' ;
   
-- ANSI JOIN ( ����Ǯ�̸� ANSI JOIN ���� ���� )
-- 1�� 
SELECT A.MEMBER_ID
     , A.MEMBER_NAME
     , B.LIKE_PRD_TYPE AS ��ȣ��ǰŸ��
     , B.REG_DATE AS ����Ͻ�
  FROM TB_MEMBER A INNER JOIN TB_MEMBER_LIKE B
    ON (A.MEMBER_ID = B.MEMBER_ID)
   WHERE A.MEMBER_ID = 'BBBBB' ;
 
-- 2�� 
SELECT A.MEMBER_ID
     , A.MEMBER_NAME
     , A.GRADE_CD
     , B.TEL_NO
  FROM TB_MEMBER A LEFT OUTER JOIN TB_MEMBER_TEL B
    ON (A.MEMBER_ID = B.MEMBER_ID) ;
 
-- 3�� 
SELECT A.MEMBER_ID
     , A.MEMBER_NAME
     , A.GRADE_CD
     , B.TEL_NO
  FROM TB_MEMBER A LEFT OUTER JOIN TB_MEMBER_TEL B
    ON (A.MEMBER_ID = B.MEMBER_ID)
 WHERE B.TEL_NO IS NULL ;
   
-- 4�� 
SELECT B.MEMBER_ID
     , B.MEMBER_NAME
     , C.PRD_ID
     , C.PRD_NAME
     , A.ORDER_NO
     , A.ORDER_DATE
  FROM TB_ORDER  A INNER JOIN TB_MEMBER B 
    ON (A.MEMBER_ID = B.MEMBER_ID) INNER JOIN TB_PRD C 
    ON (A.PRD_ID = C.PRD_ID)
 WHERE A.PRD_ID = C.PRD_ID
   AND B.MEMBER_ID = 'AAAAA' ;
 
-- 5�� 
SELECT B.MEMBER_ID
     , B.PRD_ID
     , A.PRD_NAME
  FROM TB_PRD A INNER JOIN TB_WISH B
    ON (A.PRD_ID = B.PRD_ID)
 WHERE B.MEMBER_ID = 'AAAAA' ;
 
-- ���� 
SELECT A.PRD_ID
     , A.PRD_NAME
     , B.ORDER_NO
     , B.ORDER_DATE
  FROM TB_PRD A INNER JOIN TB_ORDER B
    ON (A.PRD_ID = B.PRD_ID)
 WHERE B.ORDER_NO = 4 ;
 
SELECT A.MEMBER_ID
     , A.MEMBER_NAME
     , B.TEL_NO
  FROM TB_MEMBER A LEFT OUTER JOIN TB_MEMBER_TEL B
    ON (A.MEMBER_ID = B.MEMBER_ID) ;
    
SELECT A.LIKE_PRD_TYPE
     , B.MEMBER_ID
     , B.MEMBER_NAME
  FROM TB_MEMBER_LIKE A RIGHT OUTER JOIN TB_MEMBER B
    ON (A.MEMBER_ID = B.MEMBER_ID)
 WHERE A.LIKE_PRD_TYPE IS NULL
ORDER BY B.MEMBER_ID ;




--
--
-- 2023-05-26 
--
--

/*
DROP TABLE �л���������   ;
DROP TABLE ����������   ;
DROP TABLE ����ǥ   ;
CREATE TABLE ����������   (
�л�ID VARCHAR2(9) PRIMARY KEY , 
�л��̸� VARCHAR2(50) NOT NULL , 
�Ҽӹ� VARCHAR2(5) 
);
CREATE TABLE ����ǥ   ( 
�л�ID VARCHAR2(9) , 
����        VARCHAR2(30) , 
����        NUMBER  , 
CONSTRAINT PK_����ǥ   PRIMARY KEY(�л�ID , ����) , 
CONSTRAINT FK_����ǥ   FOREIGN KEY(�л�ID) REFERENCES ����������(�л�ID) 
)  ; 
INSERT INTO ����������   VALUES ('S0001' , '����ö' , 'A') ; 
INSERT INTO ����������   VALUES ('S0002' , '������' , 'A') ; 
INSERT INTO ����������   VALUES ('S0003' , '����ġ' , 'B') ; 
INSERT INTO ����������   VALUES ('S0004' , '�ڳ���' , 'B') ; 
INSERT INTO ����������   VALUES ('S0005' , '���°�' , 'B') ; 
INSERT INTO ����������   VALUES ('S0006' , '�����' , 'C') ; 
INSERT INTO ����������   VALUES ('S0007' , '�ڶ��' , 'C') ; 
INSERT INTO ����������   VALUES ('S0008' , '���ȵ�' , 'C') ; 
INSERT INTO ����������   VALUES ('S0009' , '������' , 'C') ; 
INSERT INTO ����ǥ  VALUES('S0001'  ,'����' , 90); 
INSERT INTO ����ǥ  VALUES('S0001'  ,'����' , 85); 
INSERT INTO ����ǥ  VALUES('S0001'  ,'����' , 100); 
INSERT INTO ����ǥ  VALUES('S0002'  ,'����' , 100); 
INSERT INTO ����ǥ  VALUES('S0002'  ,'����' , 100); 
INSERT INTO ����ǥ  VALUES('S0002'  ,'����' , 20); 
INSERT INTO ����ǥ  VALUES('S0003'  ,'����' , 100); 
INSERT INTO ����ǥ  VALUES('S0003'  ,'����' , 100); 
INSERT INTO ����ǥ  VALUES('S0003'  ,'����' , 20); 
INSERT INTO ����ǥ  VALUES('S0004'  ,'����' , 85); 
INSERT INTO ����ǥ  VALUES('S0004'  ,'����' , 40); 
INSERT INTO ����ǥ  VALUES('S0004'  ,'����' , 60); 
INSERT INTO ����ǥ  VALUES('S0005'  ,'����' , 100); 
INSERT INTO ����ǥ  VALUES('S0005'  ,'����' , 100); 
INSERT INTO ����ǥ  VALUES('S0005'  ,'����' , 100); 
INSERT INTO ����ǥ  VALUES ( 'S0006' , '����' , NULL ) ; 
INSERT INTO ����ǥ  VALUES ( 'S0006' , '����' , NULL ) ; 
INSERT INTO ����ǥ  VALUES ( 'S0006' , '����' , NULL ) ; 
COMMIT; 
*/

SELECT * FROM ���������� ;
SELECT * FROM ����ǥ ;

SELECT �Ҽӹ�, COUNT(*) AS �ݺ��ο���
  FROM ����������
 GROUP BY �Ҽӹ� ;
 
SELECT �Ҽӹ�, �л��̸� -- ����� ���� �ʾƼ� ��� �ȵ� 
  FROM ����������
 GROUP BY �Ҽӹ� ;
 
SELECT �Ҽӹ�, COUNT(�л��̸�)
  FROM ����������
 GROUP BY �Ҽӹ� ;
 
 
 
 
 
 
--
--
-- DML (Data Manipulation Language) 
-- 1. DML �̶�?

-- INSERT INTO VALUE
-- UPDATE SET
-- DELETE FROM 




-- 2. DML ���� - INSERT 


INSERT INTO TB_MEMBER ( 
       MEMBER_ID
     , MEMBER_NAME
     , PASSWD
     , PAY_CARD_NO
     , JOIN_DY
     , GRADE_CD 
     , GENDER 
     , DEL_YN
) VALUES ( 
       '88888'    
     , '�����Z'
     , '88888'
     , 'BBBB-BBBB-BBBB-BBBB'
     , TO_CHAR(SYSDATE , 'YYYYMMDD')
     , 1
     , '��'
     , 'N'
) ; 

SELECT * FROM TB_MEMBER ;

INSERT INTO TB_MEMBER
VALUES (
'YYYYY'
, '�����Y'
, 'PASS567!!'
, 'CCCC-CCCC-CCCC-CCCC'
, TO_CHAR(SYSDATE , 'YYYYMMDD')
, 2
, '��'
, 30
, 'N'
) ;

SELECT * FROM TB_MEMBER ;



-- 2. DML ���� UPDATE 

UPDATE TB_MEMBER
   SET MEMBER_NAME = '����Ȼ����A'
     , GRADE_DE = 2
     , AGE      = 52
 WHERE MEMBER_ID = 'AAAAA' ;
 
SELECT * FROM TB_MEMBER ;

ROLLBACK ; -- �� �� �������� ��� '�ѹ�'


-- 2. DML ���� DELETE 

DELETE FROM TB_WISH 
 WHERE MEMBER_ID = 'AAAAA'
   AND PRD_ID = 'P0002' ;
   
   
   
   
   
   
   
   
   
--
--
-- DDL (Data Definition Language)
-- 1. DDL �̶�

-- 2. ���̺� �����ϱ� 

/*
CREATE TABLE QUIZ_TABLE (
  Q_ID       NUMBER(3,0) NOT NULL ,
  Q_CONTENT  VARCHAR2(200) NOT NULL ,
  Q_ANSWER   VARCHAR2(100) ,
  REG_DATE   DATE DEFAULT SYSDATE
) ;
*/

SELECT * FROM QUIZ_TABLE ;

/*
INSERT INTO QUIZ_TABLE (
       Q_ID
     , Q_CONTENT
     , Q_ANSWER
     , REG_DATE
) VALUES (
       1
     , '��� ����� �����ϱ��?'
     , 'MOUSE'
     , SYSDATE
) ;
*/

SELECT * FROM QUIZ_TABLE ;

/*
INSERT INTO QUIZ_TABLE (
       Q_ID
     , Q_CONTENT
     , Q_ANSWER
     , REG_DATE
) VALUES (
       2
     , '�޷��� ����� �����ϱ��?'
     , 'calendar'
     , SYSDATE
) ;
*/

SELECT * FROM QUIZ_TABLE ;

/*
INSERT INTO QUIZ_TABLE (
       Q_ID
     , Q_CONTENT
     , Q_ANSWER
     , REG_DATE
) VALUES (
       3
     , '���̴� ����� �����ϱ��?'
     , 'paper'
     , SYSDATE
) ;
*/

SELECT * FROM QUIZ_TABLE ;

/*
UPDATE QUIZ_TABLE
   SET Q_ANSWER = 'mouse'
 WHERE Q_ID = 1 ;
*/

/*
COMMIT ;
*/

SELECT * FROM QUIZ_TABLE ;




-- 3. �������� 
-- ���̺�� ������ �ϳ��� PRIMARY KEY �� �־�� �մϴ�. 
-- UNIQUE 
-- DDL �� ������� �ڵ� COMMIT �� 

ALTER TABLE QUIZ_TABLE ADD CONSTRAINT PK_QUIZ_TABLE PRIMARY KEY (Q_ID) ;

SELECT * FROM QUIZ_TABLE ;

-- FOREIGN KEY (FK) = �ܷ�Ű

-- TB_MEMBER �� TB_MEMBER �� FK ����

ALTER TABLE TB_MEMBER_TEL DROP CONSTRAINT FK_MEMBER ; -- ������ ���������� �����Ѵ�. 

SELECT * FROM TB_MEMBER ;
SELECT * FROM TB_MEMBER_TEL ;

ALTER TABLE TB_MEMBER_TEL ADD CONSTRAINT FK_MEMBER -- ���������� �߰��Ѵ�. 
FOREIGN KEY (MEMBER_ID) REFERENCES TB_MEMBER(MEMBER_ID) ; 




-- �ǽ� 
-- ���̺� ����

CREATE TABLE STUDENT (
      �л�ID      VARCHAR2(10) NOT NULL
    , �л��̸�     VARCHAR2(20) NOT NULL
    , �����Ͻ�     DATE
    , ����        NUMBER DEFAULT 0 
) ;

SELECT * FROM STUDENT ;

CREATE TABLE STUDENT_TEL (
      �л�ID     VARCHAR2(10) NOT NULL
    , �����ڵ�   VARCHAR2(10) NOT NULL
    , ����ó     VARCHAR2(15) NOT NULL
) ;

SELECT * FROM STUDENT_TEL ;

CREATE TABLE STUDENT_ADDR (
      �л�ID      VARCHAR2(10) NOT NULL
    , ���θ��ּ�   VARCHAR2(200) NOT NULL
) ;

SELECT * FROM STUDENT_ADDR ;

-- �������� ����
-- �������� ���� ���� : ALTER TABLE ���̺�� DROP CONSTRAINT ���������̸� ;

ALTER TABLE STUDENT
    ADD CONSTRAINT PK_STUDENT
    PRIMARY KEY (�л�ID) ;
ALTER TABLE STUDENT_TEL
    ADD CONSTRAINT PK_STUDENT_TEL
    RIMARY KEY (�л�ID,�����ڵ�) ;
ALTER TABLE STUDENT_ADDR
    ADD CONSTRAINT PK_STUDENT_ADDR
    PRIMARY KEY (�л�ID) ;

ALTER TABLE STUDENT_TEL
    ADD CONSTRAINT FK_STUDENT_TEL 
    FOREIGN KEY(�л�ID) REFERENCES STUDENT(�л�ID) ;
ALTER TABLE STUDENT_ADDR
    ADD CONSTRAINT FK_STUDENT_ADDR
    FOREIGN KEY(�л�ID) REFERENCES STUDENT(�л�ID) ;
    
    
    
    
-- 4. ���̺� �����ϱ� 
-- ���������� �������� ���� ( ���� �ټ� �߻� ) 

ALTER TABLE TB_MEMBER 
    ADD ( BIRTH VARCHAR2(8) ) ;

SELECT * FROM TB_MEMBER ;

ALTER TABLE TB_MEMBER 
    DROP COLUMN BIRTH ;

SELECT * FROM TB_MEMBER ;

ALTER TABLE TB_MEMBER
    MODIFY ( PASSWD VARCHAR2(100) ) ;

SELECT * FROM TB_MEMBER ;

ALTER TABLE STUDENT
    RENAME COLUMN �л�ID
    TO STUDENT_ID ;

SELECT * FROM STUDENT ;




-- 5. ���̺� / �������� �����ϱ�

DROP TABLE STUDENT ;

SELECT * FROM STUDENT ;

DROP TABLE STUDENT CASCADE CONSTRAINT ;

SELECT * FROM STUDENT ;




-- DELETE : ���� ���� ( ���̺��� �����ִ�) 
-- TRUNCATE : ���� �Ұ��� ( ���̺��� �����ִ�) 
-- DROP : ���� �Ұ��� ( ���̺� �������� �ʴ´� )




-- 6. �������� ��

CREATE SEQUENCE ORDER_NO_SEQ
    INCREMENT BY 1
    START WITH 1 ;

SELECT ORDER_NO_SEQ.NEXTVAL FROM DUAL ;

INSERT INTO TB_ORDER (
ORDER_NO
, MEMBER_ID
, PRD_ID
, ORDER_DATE
, ORDER_CNT
, ORDER_PRICE
) VALUES (
ORDER_NO_SEQ.NEXTVAL -- ������ �ǹ̸� ���! 
, 'BBBBB'
, 'P0003'
, SYSDATE
, 2
, 1200000
) ; 

SELECT * FROM TB_ORDER ;

ROLLBACK ;

DROP SEQUENCE ORDER_NO_SEQ ;




-- 6. �������� ��

CREATE VIEW MEMBER_SIMPLE_VIEW AS
SELECT A.MEMBER_ID
     , A.GRADE_CD
     , B.TEL_NO
  FROM TB_MEMBER A
     , TB_MEMBER_TEL B
 WHERE A.MEMBER_ID = B.MEMBER_ID
   AND B.TEL_DV_CD = '�޴���' ;
   
SELECT * 
  FROM MEMBER_SIMPLE_VIEW
 WHERE MEMBER_ID = 'AAAAA' ; -- VIEW �� TABLE ó�� �����Ӱ� ��� ���� 
   
SELECT *
  FROM ( -- ���������� �ϳ� : �ζ��� VIEW 
  SELECT A.MEMBER_ID
     , A.GRADE_CD
     , B.TEL_NO
  FROM TB_MEMBER A
     , TB_MEMBER_TEL B
 WHERE A.MEMBER_ID = B.MEMBER_ID
   AND B.TEL_DV_CD = '�޴���'
   )
 WHERE MEMBER_ID = 'AAAAA' ; 
 
DROP VIEW MEMBER_SIMPLE_VIEW ;




--
--
-- TLC
-- 1. TCL �̶�? 




-- 2. Ʈ����� �����ϱ� 




-- 3. 




-- 4. SAVEPOINT 



SELECT * FROM TB_PRD
 WHERE PRD_ID = 'P0001' ;
 
 
 
 
-- �ǽ� 
-- 1�� 
CREATE TABLE TAB3 (
    COL1 VARCHAR2(20) PRIMARY KEY ,
    COL2 VARCHAR2(20)
) ;

SELECT * FROM TAB3 ;

INSERT INTO TAB3 (
       COL1
     , COL2
) VALUES (
       'A'
     , 'A'
) ;

INSERT INTO TAB3 (
       COL1
     , COL2
) VALUES (
       'B'
     , 'B'
) ;

COMMIT ;

SELECT * FROM TAB3 ;

INSERT INTO TAB3 (
       COL1
     , COL2
) VALUES (
       'C'
     , 'C'
) ;

SELECT * FROM TAB3 ;

ROLLBACK ;

SELECT * FROM TAB3 ;

INSERT INTO TAB3 (
       COL1
     , COL2
) VALUES (
       'D'
     , 'D'
) ;

SAVEPOINT SV1 ; -- SAVE POINT 

INSERT INTO TAB3 (
       COL1
     , COL2
) VALUES (
       'E'
     , 'E'
) ;

SELECT * FROM TAB3 ;

ROLLBACK TO SV1 ;

COMMIT ; 

SELECT * FROM TAB3 ;




-- 2�� 

CREATE TABLE TAB4 (
       COL1 VARCHAR2(20) PRIMARY KEY
     , COL2 VARCHAR2(20)
) ;

SELECT * FROM TAB4 ;

INSERT INTO TAB4 (
       COL1
     , COL2
) VALUES (
       'A'
     , 'A'
) ;

COMMIT ; 

INSERT INTO TAB4 (
       COL1
     , COL2
) VALUES (
       'B'
     , 'B'
) ;

INSERT INTO TAB4 (
       COL1
     , COL2
) VALUES (
       'C'
     , 'C'
) ;

SELECT * FROM TAB4 ;

CREATE TABLE HELLO (
       COL1 VARCHAR2(10) PRIMARY KEY
     , COL2 VARCHAR2(10)
) ;

SELECT * FROM HELLO ;

INSERT INTO HELLO (
       COL1
     , COL2
) VALUES (
       'D'
     , 'D'
) ;

SELECT * FROM TAB4 ;
SELECT * FROM HELLO ;

ROLLBACK ;

SELECT * FROM TAB4 ;
SELECT * FROM HELLO ;

INSERT INTO HELLO (
       COL1
     , COL2
) VALUES (
       'E'
     , 'E'
) ;

SELECT * FROM TAB4 ;
SELECT * FROM HELLO ;

COMMIT ;

SELECT * FROM TAB4 ;
SELECT * FROM HELLO ;




--
--
-- DCL ( Data Control Language ) 
-- 1. DCL �̶�?





  
  
  
  
--
--
-- �ǹ� ��� - ����¡ ( ���� ��� ���� �� �� �� �� �� ) 
-- ROWNUM �����ϱ� 

SELECT * 
  FROM TB_MEMBER ;

SELECT ROWNUM AS RN
      , MEMBER_ID
      , MEMBER_NAME
      , JOIN_DY
      , AGE
  FROM TB_MEMBER
 WHERE ROWNUM <= 3 ; 
-- WHERE ROWNUM = 2 ; => ROWNUM �� 1 ���� ����ؾ� �Ѵ�. ( ��¾ȵ� )
-- WHERE ROWNUM <= 2 ; => ROWNUM �� 1 ���� ����ؾ� �Ѵ�. ( ��µ�)

SELECT * 
  FROM (
    SELECT ROWNUM AS RN
          , MEMBER_ID
          , MEMBER_NAME
          , JOIN_DY
          , AGE
      FROM TB_MEMBER  
  )
 WHERE RN = 2 ; -- �ζ��� �並 ����ϸ� ROWNUM �� ���� ��� �����ϴ�. 
 
SELECT PRD_ID
     , PRD_NAME
     , PRD_TYPE
     , PRD_PRICE
 FROM TB_PRD
 ORDER BY PRD_PRICE DESC ;

SELECT *
  FROM (
    SELECT ROWNUM AS RN
         , PRD_ID
         , PRD_NAME
         , PRD_TYPE
         , PRD_PRICE
      FROM TB_PRD
 ORDER BY PRD_PRICE DESC 
)
 WHERE RN <= 5 ; -- �ζ��� �信 ROWNUM ���� RN �� �÷�ó�� ��� ���� 
 
 
 
 
-- �ǽ� 

SELECT *
  FROM (
    SELECT ROWNUM AS RN
         , PRD_ID
         , PRD_NAME
         , PRD_TYPE
         , PRD_PRICE
      FROM TB_PRD
 ORDER BY PRD_PRICE
)
 WHERE RN <= 3 ;

SELECT *
  FROM (
    SELECT ROWNUM AS RN
         , MEMBER_ID
         , MEMBER_NAME
         , JOIN_DY
      FROM TB_MEMBER
     ORDER BY JOIN_DY DESC
)
 WHERE ROWNUM <= 3 ;
 WHERE RN > 6 ; -- JOIN_DY �� ���� ������ �����Ƿ� RN �� ������ ������ 

/*
CREATE TABLE �Խ��� (
�Խ��ǹ�ȣ NUMBER(9) PRIMARY KEY ,
�ۼ��� VARCHAR2(50) NOT NULL ,
�Խù����� VARCHAR2(4000) NOT NULL ,
�ۼ��Ͻ� DATE NOT NULL
) ;
INSERT INTO �Խ���
SELECT LEVEL -- �Խ��ǹ�ȣ
, '���̵�' || MOD(LEVEL , 10000) -- �ۼ���
, '���̵�' ||
MOD(LEVEL , 10000) ||
'���� �ۼ��Ͻ� �Խù��Դϴ�. �� �Խù��� �Խ��� ��ȣ�� '
|| LEVEL
|| '�Դϴ�' -- �Խù�����
, TO_DATE('20000101') + LEVEL --2022�� 1��1�Ϻ��� �Ϸ羿 �Խù��� �ԷµǴ� ��
FROM DUAL
CONNECT BY LEVEL <=1000000; --100������ ������ �Է�
COMMIT; 
*/

SELECT * FROM �Խ��� ; -- 100 ���� �Խù��� ���̺�� ������ ���� 




-- �ǽ� 

SELECT *
  FROM (
        SELECT *
          FROM �Խ���
         ORDER BY �ۼ��Ͻ� DESC -- �������� 
        )
 WHERE ROWNUM <= 20 ;
 



-- 3. ����¡ ��� �����ϱ� 

SELECT *
  FROM (
        SELECT ROWNUM AS RN
             , A.*
          FROM (
                SELECT *
                  FROM �Խ���
                 ORDER BY �ۼ��Ͻ� DESC
                ) A
         WHERE ROWNUM <= 40
        )
 WHERE RN >= 21 ;
 
/*
SELECT *
  FROM (
        SELECT ROWNUM AS RN
             , A.*
          FROM (
                SELECT *               -- �츮�� 
                  FROM �Խ���           -- �ۼ��ϴ� 
                 ORDER BY �ۼ��Ͻ� DESC -- �κ� 
                ) A
         WHERE ROWNUM <= 20 * N
        )
 WHERE RN >= 20*(N-1)+1 ;
*/ 









--
--
-- �������� ( SUB QUERY )
-- 1. ���������� ����
-- 2. ��Į�� �������� (��� : SELECT)
-- 3. �ζ��� �� (��� : FROM)
-- 4. ��ø�������� (��� : WHERE) & ������ / ������ ������ 




-- 1. ���������� ���� 
-- �������� (SUB QUERY) ��? 
-- �ۼ��� ���� ���ο� �ٸ� ������ �����Ͽ� ���� �پ��ϰ� �����͸� ����ϴ� ����� ����




-- 2. ��Į�� �������� ( ��� : SELECT ) 
-- SELECT ���� ���Ǵ� ��������
-- �ϳ��� �÷��� ���� �ϳ��� �ุ ��ȯ�ϴ� Ư¡�� ����
-- ��µǴ� ���� ���ٸ� NULL �� ��ȯ 
-- SELECT �� ����Ǵ� Ƚ����ŭ ������ �ν��Ͻ��� �ݺ� ���� / ��� �˴ϴ�. 
-- ��Į�� ���������� ��µǴ� �� (Ʃ��) �� 1�� Ȥ�� NULL �̾�� �մϴ�. 
-- ��Į�� ���������� ��µǴ� �÷��� 1������ �մϴ�. 




-- ���� 
 
SELECT A.MEMBER_ID                       AS ȸ��ID
     , A.MEMBER_NAME                     AS ȸ���̸�
     , (
        SELECT TEL_NO
          FROM TB_MEMBER_TEL
         WHERE TEL_DV_CD = '�޴���'
           AND MEMBER_ID = A.MEMBER_ID ) AS �޴�����ȣ
  FROM TB_MEMBER A
 WHERE A.MEMBER_ID IN ( 'AAAAA', 'BBBBB', 'CCCCC', 'DDDDD' ) ;
 
 


-- �ǽ� 
--1�� 
-- TB_MEMBER ���̺��� GRADE_CD ��� �÷��� �ֽ��ϴ�. 
-- ��Į�� ���������� �̿��ؼ� TB_GRADE ���̺� �ִ�
-- GRADE_NAME ���� ������ �����͸� ������ּ���. 


SELECT * FROM TB_MEMBER ;
SELECT * FROM TB_GRADE ;

SELECT A.MEMBER_ID AS ȸ��ID
     , A.MEMBER_NAME AS ȸ���̸�
     , A.GRADE_CD AS ����ڵ�
     , B.GRADE_NAME AS ����̸�
  FROM TB_MEMBER A JOIN TB_GRADE B -- JOIN ��� 
    ON A.GRADE_CD = B.GRADE_CD ;
  
SELECT A.MEMBER_ID AS ȸ��ID
     , A.MEMBER_NAME AS ȸ���̸�
     , A.GRADE_CD AS ����ڵ�
     , (
        SELECT GRADE_NAME
          FROM TB_GRADE
         WHERE GRADE_CD = A.GRADE_CD ) AS ����̸� -- �������� ( ��Į�� ) ��� 
  FROM TB_MEMBER A ;
  
  


-- 2�� 
-- TB_ORDER ���̺��� ���� MEMBER_ID �� PRD_ID �÷��� �̿���
-- TB_MEMBER ���̺�� TB_PRD ���̺�� ����Ǿ� �ֽ��ϴ�. 
-- TB_ORDER ���̺��� MEMBER_ID �÷��� �̿��ϸ� TB_MEMBER ���̺���
-- MEMBER_NAME �� ������ �� �ֽ��ϴ�. 
-- TB_ORDER ���̺��� PRD_ID �÷��� �̿��ϸ� 
-- TB_PRD ���̺��� PRD_NAME �� ������ �� �ֽ��ϴ�. 

  
SELECT * FROM TB_ORDER ;
SELECT * FROM TB_PRD ;

SELECT ROWNUM AS �ֹ���ȣ
     , A.MEMBER_ID AS �ֹ����̸�
     , A.PRD_ID AS ��ǰID
     , B.PRD_NAME AS ��ǰ�̸�
  FROM TB_ORDER A JOIN TB_PRD B -- JOIN ��� 
    ON A.PRD_ID = B.PRD_ID ;
  
SELECT ROWNUM AS �ֹ���ȣ
     , A.MEMBER_ID AS �ֹ����̸�
     , A.PRD_ID AS ��ǰID
     , (
        SELECT PRD_NAME
          FROM TB_PRD
         WHERE A.PRD_ID = PRD_ID ) AS ��ǰ�̸� -- ��Į�� �������� ��� 
  FROM TB_ORDER A ;
  
  
  
  
-- ��Į�� ���������� ����� 
-- ���� 
-- (1) ������ ���̺��� ������ �ٿ��� �����ϱ� ���� ���� �� �ִ�. 
-- (2) ĳ�� ����� �̿��ؼ� ������ ������ų �� �ִ�. 

-- ���� 
-- (1) SELECT Ƚ����ŭ �����ϹǷ� ������ ������ �� �ִ�. 
-- (���� ������ ���� �� ���� �� ����)
-- (2) �ϳ��� �÷�, �ϳ��� ���� �����;� �Ѵٴ� ������ �ִ�. (������ ���� ����)




-- 3. �ζ��� �� ( Inline View )
-- FROM �κп��� ���Ǵ� ���� ����
-- FROM ���� ������ �ۼ��� �����
-- ������ ���̺��� �� ó�� ����� �� ���� 


-- ����


SELECT A.MEMBER_ID
     , A.MEMBER_NAME
     , A.GRADE_CD
     , A.AGE
     , B.��޺��ְ���
 FROM TB_MEMBER A
    , (
        SELECT GRADE_CD
             , MAX(AGE) AS ��޺��ְ���
          FROM TB_MEMBER
         GROUP BY GRADE_CD
        ) B -- ��޺��� ���� ���̰� ���� ����
 WHERE A.GRADE_CD = B.GRADE_CD
   AND A.AGE = B.��޺��ְ��� ;
   
   
   
   
-- ��ø�������� (Nested Sub Query)
-- WHERE �κп��� ���Ǵ� ���� ���� 
-- ���������� �÷��� ���� �Ⱦ��Ŀ� ���� 
-- �����������, �������������� ���� 




-- �����������
-- ������� : ���� -> ���� 
-- ������������ ���������� �÷��� ����ϴ� 
-- ���������� �ǹ��մϴ�. (���������� ���� O )
-- ������������ ��µǴ� Ʃ��(��) ����ŭ ���������� ����ǰ�
-- �� ����� ������ ���������� �����մϴ�. 




-- ����
   
   
SELECT *
  FROM TB_PRD A
 WHERE PRD_PRICE = ( SELECT MAX(PRD_PRICE)
                       FROM TB_PRD
                      WHERE PRD_TYPE = A.PRD_TYPE
                    ) ;


SELECT *
  FROM TB_PRD A
 WHERE PRD_PRICE = ( SELECT MIN(PRD_PRICE)
                       FROM TB_PRD
                      WHERE PRD_TYPE = A.PRD_TYPE
                    ) ;


SELECT *
  FROM TB_MEMBER
 WHERE GRADE_CD IN (SELECT GRADE_CD
                    FROM TB_GRADE
                    WHERE ROWNUM = 1) ;
                    
                    
                    
                    
-- �ǽ�
-- TB_PRD ���̺��� ��ǰ Ÿ�� ���� ���� �� ������ ��ǰ ������ ������ּ���.


SELECT PRD_ID
     , PRD_NAME
     , PRD_TYPE
     , PRD_PRICE
  FROM TB_PRD A
 WHERE PRD_PRICE = ( SELECT MIN(PRD_PRICE)
                       FROM TB_PRD
                      WHERE A.PRD_TYPE = PRD_TYPE
                    ) ;
                    
                    
                    
                    
-- ������������
-- ������� : ���� -> ����
-- ������������ ���������� �÷��� ������� �ʴ� 
-- ���������� �ǹ��մϴ�. (���������� ���� X)
-- �� ��� ���������� ���� ����ǰ� ���������� ����˴ϴ�. 




-- ����


SELECT *
  FROM TB_PRD
 WHERE PRD_PRICE = ( SELECT MAX(PRD_PRICE)
                       FROM TB_PRD
                    ) ;
                    
                    
        
   
-- �ǽ� 1��
-- TB_MEMBER ���̺��� ȸ���� �߿� 
-- ��� AGE �̻��� AGE ������ ���� ��� ������ּ���. 


SELECT MEMBER_NAME
     , GRADE_CD
     , AGE
  FROM TB_MEMBER
 WHERE AGE >= ( SELECT AVG(AGE)
                  FROM TB_MEMBER
                ) ;
                
                
                
                
-- �ǽ� 2�� 
-- TB_PRD ���̺��� ���� �� ������ ���� ��ǰ ������ ������ּ���. 


SELECT PRD_NAME
     , PRD_INFO
     , PRD_PRICE
  FROM TB_PRD
 WHERE PRD_PRICE <= ( SELECT MIN(PRD_PRICE)
                        FROM TB_PRD
                    ) ;
                    
                    
                    
                    
-- Ǯ��

SELECT MEMBER_NAME
     , GRADE_CD
     , AGE
  FROM TB_MEMBER
 WHERE AGE >= (
        SELECT AVG(AGE) -- GROUP BY �� �Ǿ�߸� ����� �� �ִ� ���� �Լ� 
          FROM TB_MEMBER ) -- GROUP BY () �� ���� �ִ� ����
 ORDER BY GRADE_CD ;

SELECT MEMBER_NAME
     , AVG(AGE)
  FROM TB_MEMBER
 GROUP BY MEMBER_NAME 
-- WHERE AGE >= AVG(AGE)
-- ORDER BY GRADE_CD ;
;




-- ������ ������ / ������ ������ 
-- WHERE ������ ���� ���� ����� ���� ��
-- �������� ���� �� �ִ� �����ڿ� �������� ���� �� �ִ� �����ڰ� �ֽ��ϴ�. 
-- �������� ���� �� �ִ� ������ : IN, ANY, ALL, EXISTS, NOT EXISTS




-- ����


SELECT *
  FROM TB_MEMBER
 WHERE GRADE_CD = ( SELECT GRADE_CD
                      FROM TB_GRADE ) ; -- ������ �߻��Ѵ�. (���������� ������)
                      
                      
SELECT *
  FROM TB_MEMBER
 WHERE GRADE_CD IN ( SELECT GRADE_CD
                       FROM TB_GRADE ) ;
                       
                       
                       
                       
-- IN �� �Էµ� ���� �࿡ ���� ��ġ�ϴ� ���� ����մϴ�. 


SELECT PRD_ID
     , PRD_NAME
     , PRD_TYPE
     , PRD_PRICE
  FROM TB_PRD
 WHERE PRD_PRICE IN ( SELECT MAX(PRD_PRICE)
                        FROM TB_PRD
                       GROUP BY PRD_TYPE
                    ) ;
                       
                       
                       
                       
-- ANY �� �Էµ� ���� �࿡ ���� ��ġ�ϴ� ���� ����մϴ�. 


SELECT PRD_ID
     , PRD_NAME
     , PRD_TYPE
     , PRD_PRICE
  FROM TB_PRD
 WHERE PRD_PRICE = ANY ( SELECT MAX(PRD_PRICE)
                        FROM TB_PRD
                       GROUP BY PRD_TYPE
                    ) ;
                       
                       
                       
                  
-- ALL �� �Էµ� ���� �࿡ ����
-- ������ ��� ��ġ�ϴ� ���� ����մϴ�. 


SELECT PRD_ID
     , PRD_NAME
     , PRD_TYPE
     , PRD_PRICE
  FROM TB_PRD
 WHERE PRD_PRICE >= ALL ( SELECT MAX(PRD_PRICE)
                        FROM TB_PRD
                       GROUP BY PRD_TYPE
                    ) ; 
                       
                       
                       
                       
-- �ǽ�
-- �Ʒ� ���̺� ���ؼ� ���� �� ������ �߻��ϴ� ������ �����ΰ�? 


SELECT MEMBER_ID
     , AGE
     , GRADE_CD
  FROM TB_MEMBER ;


--(1)
SELECT *
  FROM TB_MEMBER
 WHERE AGE = ( SELECT AGE
                 FROM TB_MEMBER
                WHERE ROWNUM = 1
            ) ;
            
            
--(2)
SELECT *
  FROM TB_MEMBER
 WHERE AGE = ( SELECT MAX(AGE)
                 FROM TB_MEMBER
                ) ;
                
                
--(3)
SELECT *
  FROM TB_MEMBER
 WHERE AGE >= ( SELECT AVG(AGE)
                  FROM TB_MEMBER
                 GROUP BY GRADE_CD
                ) ;
                
                
--(4)
SELECT *
  FROM TB_MEMBER
 WHERE AGE = ANY ( SELECT AVG(AGE)
                   FROM TB_MEMBER
                  GROUP BY GRADE_CD
                ) ;
                
                
                
                

-- �� : 3�� 









--
--
-- EXISTS ���� 
-- 1. EXISTS ���� �˾ƺ���
-- 2. EXISTS ������ ��� ����
-- 3. �ǽ� ���� Ǯ��




-- �ǽ�
-- EXISTS ���� ���ظ� ���� �Ʒ� ���̺���
-- ȸ�� �߿� ����ó ������ �����ϴ� ȸ���鸸 ã�ƺ��ô�. 


SELECT MEMBER_ID
     , MEMBER_NAME
  FROM TB_MEMBER ;
  
SELECT MEMBER_ID
     , TEL_DV_CD
     , TEL_NO
  FROM TB_MEMBER_TEL ;
  
SELECT MEMBER_ID
     , MEMBER_NAME
  FROM TB_MEMBER A
 WHERE EXISTS ( SELECT TEL_NO
                  FROM TB_MEMBER_TEL
                 WHERE MEMBER_ID = A.MEMBER_ID
                ) ;
                
                
                
                
-- Ǯ��


SELECT MEMBER_ID
     , MEMBER_NAME
       FROM TB_MEMBER A
 WHERE EXISTS ( -- EXISTS : FOR �� �ȿ� BREAK; �� �ִ°�ó�� �������̰� ���� 
                SELECT 1
                  FROM TB_MEMBER_TEL
                 WHERE MEMBER_ID = A.MEMBER_ID
                ) ;
                
                
                
                
-- EXISTS �����̶�?
-- Ư�� ������ �����ϴ� �����Ͱ� �����ϴ��� (EXISTS)
-- ���θ� Ȯ���� �� ����ϴ� �����Դϴ�. 
-- ��ǥ���� ����������� ����̸� 
-- �������� ���� ����ϴ� ��ų�Դϴ�. 




-- EXISTS ���� �ۼ� ���


SELECT MEMBER_ID
     , MEMBER_NAME
  FROM TB_MEMBER A
 WHERE EXISTS (
                SELECT 1
                  FROM TB_MEMBER_TEL
                 WHERE MEMBER_ID = A.MEMBER_ID
                ) ;
                
                
-- 1. WHERE �� ����� �� Ư�� �÷��� �̿����� �ʽ��ϴ�. 
-- 2. SELECT �ڿ� ���� 1�� �ǹ̰� �����ϴ�. 
-- 'X' �� �����ϸ� �ܼ� ���� ���߱�뵵 �Դϴ�. 
-- 3. ���������� �÷� ���� �������� �ִ� ������������Դϴ�. (A.MEMBER_ID)




-- EXISTS ���� �� �������
-- ������ ��ġ�ϴ� ����� ã�� ���
-- ������ ���� ������ �ʽ��ϴ�. 
-- IN �� ���������� �̿��ص� �Ȱ��� ����� ����� �� �ֽ��ϴ�. 
-- ������, ������ EXISTS �� �ξ� �����ϴ�. 


SELECT MEMBER_ID
     , MEMBER_NAME
  FROM TB_MEMBER A
 WHERE MEMBER_ID IN ( SELECT MEMBER_ID
                        FROM TB_MEMBER_TEL
                    ) ;
                    
                    
-- IN �� ������� �� ��������
-- ���ǿ� ��ġ�ϴ� ����� ã�Ҵ���
-- �����͸� ������ ��� ���մϴ�. 




-- �ǽ� 
-- NOT EXISTS ������ ���ظ� ���� �Ʒ� ���̺���
-- ȸ�� �߿� ����ó ������ �������� �ʴ� ȸ���鸸 ã�ƺ��ô�.

SELECT MEMBER_ID
     , MEMBER_NAME
  FROM TB_MEMBER ;
  
SELECT MEMBER_ID
     , MEMBER_NAME
  FROM TB_MEMBER A
 WHERE NOT EXISTS ( 
                    SELECT 1
                      FROM TB_MEMBER_TEL
                     WHERE MEMBER_ID = A.MEMBER_ID
                    ) ;
                    
                    
                    
                    
-- NOT EXISTS ���� �� ������� 
-- ���ǿ� ��ġ�ϴ� ����� ã���� 
-- ������ ���� ������ �ʽ��ϴ�. 
-- NOT IN �� ���������� ����ص� 
-- �Ȱ��� ����� ����� �� �ֽ��ϴ�. 
-- ������, ������ NOT EXISTS �� �ν� �����ϴ�. 
-- �׸��� NOT IN ���� ġ������ ������ �ֽ��ϴ�. 


SELECT MEMBER_ID
     , MEMBER_NAME
  FROM TB_MEMBER A
 WHERE MEMBER_ID NOT IN (
                        SELECT MEMBER_ID
                          FROM TB_MEMBER_TEL
                        UNION ALL
                        
                        SELECT NULL -- NULL ���� ���Ƿ� ���� 
                          FROM DUAL
                        ) ; -- NULL ���� ������ �ƹ��͵� ������� �ʴ� ����
                        
                        


-- �ǽ� 1��
-- TB_ORDER ���̺��� �ֹ� �����͸� �Է¹ް� �ֽ��ϴ�. 
-- TB_DRDER ���̺��� PRD_ID �÷���
-- TB_PRD ���̺��� PRD_ID �÷��� Ȱ���Ͽ�
-- �ѹ��̶� �ֹ��� �� ���� �ִ� ��ǰ�� 
-- PRD_ID �� PRD_NAME �� ������ּ���.


SELECT *
  FROM TB_ORDER ;
  
SELECT *
  FROM TB_PRD ;
  
SELECT PRD_ID
     , PRD_NAME
  FROM TB_PRD A
 WHERE EXISTS (
            SELECT 'X'
              FROM TB_ORDER
             WHERE ORDER_CNT >= 1
               AND PRD_ID = A.PRD_ID
             ) ;
             
             
             
             
-- �ǽ� 2��
-- TB_MEMBER ���̺�� TB_ORDER ���̺��� Ȱ���Ͽ�
-- �ֹ��� ���� �ѹ��� ���� �ʴ� ȸ���̸鼭
-- GRADE_CD (����ڵ�) �� 3�� ȸ���� 
-- MEMBER_ID , MEMBER_NAME , AGE �� ������ּ���.


SELECT *
  FROM TB_MEMBER ;
  
SELECT *
  FROM TB_ORDER ;
  
SELECT MEMBER_ID
     , MEMBER_NAME
     , AGE
     , GRADE_CD
  FROM TB_MEMBER A
 WHERE NOT EXISTS (
                SELECT 1
                  FROM TB_ORDER
                 WHERE MEMBER_ID = A.MEMBER_ID
                 )
   AND GRADE_CD = 3 ;
   
   
   
   
-- �ǽ� 3�� (��ȭ)
-- TB_MEMBER_LIKE ���̺��� ȸ���� � ��ǰ Ÿ�� (PRD_TYPE) �� 
-- ��ȣ�ϴ��� ������ ������ ���̺��Դϴ�. 
-- ���� ���, BBBBB �� ��ȣ�ϴ� ��ǰŸ���� '����'�� '����Ʈ��'�Դϴ�.
-- ( SELECT * FROM TB_MEMBER_LIKE ; )
-- �̶�, TB_PRD (��ǰ) ���̺��� �������� ��ǰ Ÿ���� �����մϴ�. 
-- BBBBB ȸ���� ��ȣ�ϴ� ��ǰŸ�� �ܿ� ������ ��ǰŸ�Ե��� ������ּ���.

SELECT *
  FROM TB_PRD ;
  
SELECT *
  FROM TB_MEMBER_LIKE ;
  
SELECT LIKE_PRD_TYPE
  FROM TB_MEMBER_LIKE
 WHERE MEMBER_ID = 'BBBBB' ;
  
SELECT DISTINCT PRD_TYPE
  FROM TB_PRD A
 WHERE NOT EXISTS (
                    SELECT 1
                      FROM TB_MEMBER_LIKE
                     WHERE MEMBER_ID = 'BBBBB'
                       AND LIKE_PRD_TYPE = A.PRD_TYPE
                    ) ;
                    
                    
                    
                    
                    
                    
                    

                    
SELECT PRD_ID
     , PRD_NAME
  FROM TB_PRD A
 WHERE EXISTS ( 
            SELECT 1
              FROM TB_ORDER
             WHERE PRD_ID = A.PRD_ID
             ) ;
             
SELECT MEMBER_ID
     , MEMBER_NAME
     , AGE
     , GRADE_CD
  FROM TB_MEMBER A
 WHERE NOT EXISTS (
                SELECT 1
                  FROM TB_ORDER
                 WHERE MEMBER_ID = A.MEMBER_ID
                 )
   AND GRADE_CD = 3 ;

SELECT DISTINCT PRD_TYPE
  FROM TB_PRD A
 WHERE NOT EXISTS (
                SELECT *
                  FROM TB_MEMBER_LIKE
                 WHERE LIKE_PRD_TYPE = A.PRD_TYPE
                   AND MEMBER_ID = 'BBBBB' 
                 )
 ORDER BY PRD_TYPE ;
 
 
 
 
 
 
 
 
 
--
--
-- CASE ����
-- 1. CASE ���� ����
-- 2. CASE ���� ���� �����ϱ�
-- 3. �ǽ� ���� Ǯ��




-- ����


SELECT MEMBER_ID
     , MEMBER_NAME
     , JOIN_DY
     , CASE WHEN JOIN_DY LIKE '2020%' THEN '2020'
            WHEN JOIN_DY LIKE '2021%' THEN '2021'
            WHEN JOIN_DY LIKE '2022%' THEN '2022'
            ELSE '2023'
        END AS JOIN_YY
    FROM TB_MEMBER ;
     
SELECT MEMBER_ID
     , MEMBER_NAME
     , GENDER
     , CASE WHEN GENDER = '��' THEN 'Man'
            WHEN GENDER = '��' THEN 'Woman'
            ELSE 'notChecked'
        END AS ��������
    FROM TB_MEMBER ;
    
    
     
     
-- DECODE Ȱ�� ���� 


SELECT MEMBER_ID
     , MEMBER_NAME
     , GENDER
     , CASE WHEN GENDER = '��' THEN 'Man'
            WHEN GENDER = '��' THEN 'Woman'
            ELSE 'notChecked'
        END AS ��������
     , DECODE ( GENDER , '��' , 'Man' , '��' , 'Woman' , 'notChecked' ) AS ��������2
    FROM TB_MEMBER ;
    
    
    
    
-- SELECT �� ���� ��� ��µ� ���� �� ��ŭ SELECT �� ����,
-- CASE ������ ���� ����ŭ ����� 
-- ���ǻ���! CASE ������ ������ ��ġ�ϴ� ���� �ٷ� �Ѿ�ϴ�. ( ���� �߿� )
    
    
    
    
-- �ǽ� 1��

SELECT * FROM TB_GRADE ;

SELECT MEMBER_ID
     , MEMBER_NAME
     , GRADE_CD
     , CASE WHEN GRADE_CD = 1 THEN '�����'
            WHEN GRADE_CD = 2 THEN '�ǹ�'
            WHEN GRADE_CD = 3 THEN '���'
            WHEN GRADE_CD = 4 THEN 'VIP'
            WHEN GRADE_CD = 5 THEN 'VVIP'
            ELSE 'X'
        END AS "��� �̸�" -- �ֵ���ǥ�� �����ָ� ��Ī�� ���� ���� (Ư�����ڵ� ����)
    FROM TB_MEMBER ;
    
    
    
    
-- �ǽ� 2�� ( JOIN �� �̿��� Ǯ�� )


SELECT  * FROM TB_MEMBER ;
SELECT * FROM TB_GRADE ;

SELECT A.MEMBER_ID
     , A.MEMBER_NAME
     , A.GRADE_CD
     , B.GRADE_NAME
  FROM TB_MEMBER A JOIN TB_GRADE B
    ON A.GRADE_CD = B.GRADE_CD ;
    
    
    
    
-- �ǽ� 3�� 


SELECT MEMBER_ID
     , MEMBER_NAME
     , GRADE_CD
     , CASE WHEN GRADE_CD >= 4 THEN '���'
            ELSE '����'
        END AS ������󿩺�
      FROM TB_MEMBER ;
      
      
      
      
      
      
      
      
      
-- MERGE ����
-- 1. MERGE ���� ����
-- 2. MERGE ��� ����
-- 3. �ǽ� ���� Ǯ��




-- MERGE ������ ������ �ٿ� ������ ����Ŵ
-- ��, SELECT �� �Ǵ��� �ؼ� UPDATE �� INSERT �ϴ� ������ �ѹ��� ó��




-- ���� 1��


SELECT MEMBER_ID
  FROM TB_MEMBER_TEL
 WHERE MEMBER_ID = 'BBBBB'
   AND TEL_DV_CD = '�޴���' ;
   
MERGE INTO TB_MEMBER_TEL A -- ������̺�
USING DUAL -- �����̺� (���� ��� DUAL)
   ON ( A.MEMBER_ID = 'BBBBB' AND TEL_DV_CD = '�޴���' )
   
   -- ���м� 
   
WHEN MATCHED THEN
UPDATE
   SET TEL_NO = '010-7777-7777'
   
   -- ���м� 
   
WHEN NOT MATCHED THEN
INSERT ( MEMBER_ID , TEL_DV_CD , TEL_NO )
VALUES ( 'BBBBB' , '�޴���' , '010-7777-7777' ) ;

SELECT *
  FROM TB_MEMBER_TEL ;





-- SELECT  ���� �غ��� UPDATE / INSERT 
-- �ǹ����� �ʼ������ �ƴϳ�
-- MERGE ����ϸ� ȿ���� ������ 
  
  
  
  
-- ���� 2��


MERGE INTO TB_MEMBER_TEL A
USING DUAL
   ON ( A.MEMBER_ID = 'BBBBB' AND TEL_DV_CD = '����' )
   
WHEN MATCHED THEN
UPDATE
   SET TEL_NO = '02-5678-5555'

WHEN NOT MATCHED THEN
INSERT ( MEMBER_ID , TEL_DV_CD , TEL_NO )
VALUES( 'BBBBB' , '����' , '02-5678-5555' ) ;

SELECT *
  FROM TB_MEMBER_TEL ;
  
  
  
  
-- MERGE �� �� �ٸ� ���ø� �������� �����͸� ���� & �������ּ���.

/*
DROP TABLE ����;
DROP TABLE ����_���� ;
CREATE TABLE ���� (
����ID VARCHAR2(30) PRIMARY KEY ,
�����̸� VARCHAR2(50) NOT NULL ,
���� NUMBER NOT NULL
) ;
INSERT INTO ���� VALUES ( 'A0001' , '������' , 4000) ;
INSERT INTO ���� VALUES ( 'A0002' , '������' , 5000) ;
INSERT INTO ���� VALUES ( 'A0003' , '����â' , 5000) ;
CREATE TABLE ����_���� (
����ID VARCHAR2(30) PRIMARY KEY ,
�����̸� VARCHAR2(50) NOT NULL ,
���� NUMBER NOT NULL
) ;
INSERT INTO ����_���� VALUES ( 'A0001' , '������' , 4000) ;
INSERT INTO ����_���� VALUES ( 'A0002' , '������' , 5000) ;
INSERT INTO ����_���� VALUES ( 'A0003' , '����â' , 6000) ;
INSERT INTO ����_���� VALUES ( 'A0004' , '���Կ�' , 3400) ;
INSERT INTO ����_���� VALUES ( 'A0005' , '������' , 3400) ;
COMMIT ;
*/

SELECT * FROM ���� ;
SELECT * FROM ����_���� ;




-- MERGE ����


MERGE INTO ���� A
USING ����_���� B
   ON ( A.����ID = B.����ID )
   
WHEN MATCHED THEN
UPDATE
   SET A.�����̸� = B.�����̸�
     , A.����    = B.����
     
WHEN NOT MATCHED THEN
INSERT ( A.����ID , A.�����̸� , A.���� )
VALUES ( B.����ID , B.�����̸� , B.���� ) ;




-- �ǽ�


MERGE INTO TB_MEMBER_TEL A
USING DUAL
   ON ( A.MEMBER_ID = 'EEEEE' AND TEL_DV_CD = '�޴���' )
   
WHEN MATCHED THEN
UPDATE
   SET A.TEL_NO = '010-8888-8888'
   
WHEN NOT MATCHED THEN
INSERT ( A.MEMBER_ID ,A.TEL_DV_CD , A.TEL_NO )
VALUES ( 'EEEEE' , '�޴���' , '010-8888-8888' ) ;

SELECT * FROM TB_MEMBER_TEL ;









--
--
-- ���� ������
-- 1. ���տ����� ���� �˾ƺ���
-- 2. ���տ����� ������ ����
-- 3. �ǽ� ���� Ǯ��




-- ���տ����ڶ�?
-- ���� SQL ����� ���Ʒ��� ������ �ϳ��� ���·� �����ϴ� ����
-- �����̾�׷� ( ������, ������, ������ )




-- ����


/* ���̺� ����
CREATE TABLE �����ÿ��ų��� AS 
SELECT 1 AS ���Ź�ȣ , '������A' AS �������̸� , 50000 AS �����ð��� FROM DUAL UNION ALL 
SELECT 2 AS ���Ź�ȣ , '������B' AS �������̸� , 60000 AS �����ð��� FROM DUAL UNION ALL 
SELECT 3 AS ���Ź�ȣ , '������C' AS �������̸� , 70000 AS �����ð��� FROM DUAL UNION ALL 
SELECT 4 AS ���Ź�ȣ , '������D' AS �������̸� , 80000 AS �����ð��� FROM DUAL UNION ALL 
SELECT 5 AS ���Ź�ȣ , '������E' AS �������̸� , 90000 AS �����ð��� FROM DUAL ; 

CREATE TABLE �ܼ�Ʈ���ų��� AS 
SELECT 1 AS ���Ź�ȣ , '�ܼ�ƮA' AS �ܼ�Ʈ�̸� , 50000 AS �ܼ�Ʈ���� FROM DUAL UNION ALL 
SELECT 2 AS ���Ź�ȣ , '�ܼ�ƮB' AS �ܼ�Ʈ�̸� , 60000 AS �ܼ�Ʈ���� FROM DUAL UNION ALL 
SELECT 3 AS ���Ź�ȣ , '�ܼ�ƮC' AS �ܼ�Ʈ�̸� , 70000 AS �ܼ�Ʈ���� FROM DUAL UNION ALL 
SELECT 4 AS ���Ź�ȣ , '�ܼ�ƮD' AS �ܼ�Ʈ�̸� , 80000 AS �ܼ�Ʈ���� FROM DUAL UNION ALL 
SELECT 5 AS ���Ź�ȣ , '�ܼ�ƮE' AS �ܼ�Ʈ�̸� , 90000 AS �ܼ�Ʈ���� FROM DUAL ; 

CREATE TABLE ���忹�ų��� AS 
SELECT 1 AS ���Ź�ȣ , '��A' AS ���̸� , 50000 AS �ذ��� FROM DUAL UNION ALL 
SELECT 2 AS ���Ź�ȣ , '��B' AS ���̸� , 60000 AS �ذ��� FROM DUAL UNION ALL 
SELECT 3 AS ���Ź�ȣ , '��C' AS ���̸� , 70000 AS �ذ��� FROM DUAL UNION ALL 
SELECT 4 AS ���Ź�ȣ , '��D' AS ���̸� , 80000 AS �ذ��� FROM DUAL UNION ALL 
SELECT 5 AS ���Ź�ȣ , '��E' AS ���̸� , 90000 AS �ذ��� FROM DUAL ; 

ALTER TABLE �����ÿ��ų��� ADD ( �����ð����÷� VARCHAR2(10) ); 
ALTER TABLE �ܼ�Ʈ���ų��� ADD ( �ܼ�Ʈ�����÷� NUMBER ); 
ALTER TABLE ���忹�ų��� ADD ( ��������÷� DATE ); 

UPDATE �����ÿ��ų��� SET �����ð����÷� = '��' || ROWNUM ; 
UPDATE �ܼ�Ʈ���ų��� SET �ܼ�Ʈ�����÷� = ROWNUM ; 

COMMIT; 
*/


SELECT * FROM �����ÿ��ų���;
SELECT * FROM �ܼ�Ʈ���ų���;
SELECT * FROM ���忹�ų���;


SELECT ���Ź�ȣ , �������̸� , �����ð��� -- ó�� �ۼ��� �÷� �̸��� ���󰣴�.
  FROM �����ÿ��ų���
  
UNION ALL

SELECT ���Ź�ȣ , �ܼ�Ʈ�̸� , �ܼ�Ʈ����
  FROM �ܼ�Ʈ���ų���
  
UNION ALL
  
SELECT ���Ź�ȣ , ���̸� , �ذ���
  FROM ���忹�ų��� ;
  
  
  -- �÷� ����� �����߻� 1
  -- �÷� ����, ������, �ڷ����� �ȸ��� ��� �����߻�


SELECT ���Ź�ȣ , �������̸� , �����ð��� , �����ð����÷�
  FROM �����ÿ��ų���
  
UNION ALL

SELECT ���Ź�ȣ , �ܼ�Ʈ�̸� , �ܼ�Ʈ���� , �ܼ�Ʈ�����÷�
  FROM �ܼ�Ʈ���ų���
  
UNION ALL
  
SELECT ���Ź�ȣ , ���̸� , �ذ��� , ��������÷�
  FROM ���忹�ų��� ;
  
  
  
  
-- NULL �� �ڷ����� ��ġ��Ŵ 


SELECT ���Ź�ȣ , �������̸� , �����ð��� , NULL
  FROM �����ÿ��ų���
  
UNION ALL

SELECT ���Ź�ȣ , �ܼ�Ʈ�̸� , �ܼ�Ʈ���� , �ܼ�Ʈ�����÷�
  FROM �ܼ�Ʈ���ų���
  
UNION ALL
  
SELECT ���Ź�ȣ , ���̸� , �ذ��� , NULL
  FROM ���忹�ų��� ;
  
  
  
  
-- �ǽ� 1��


SELECT * FROM �����ÿ��ų��� ;

SELECT ���Ź�ȣ
     , �������̸� AS �����̸�
     , �����ð��� AS ��������
  FROM �����ÿ��ų���
 WHERE ���Ź�ȣ >= 3
 
 UNION ALL -- ������ (�ߺ�����, ���ľ��� ) 
 
SELECT ���Ź�ȣ
     , �ܼ�Ʈ�̸�
     , �ܼ�Ʈ����
  FROM �ܼ�Ʈ���ų���
 WHERE ���Ź�ȣ >= 3
 
 UNION ALL
 
SELECT ���Ź�ȣ
     , ���̸�
     , �ذ���
  FROM ���忹�ų���
 WHERE ���Ź�ȣ >= 3 ;
 
 
 
 
-- Ǯ�� ( �������� ���� )



SELECT *
  FROM (
                      
                    SELECT ���Ź�ȣ
                         , �������̸� AS �����̸�
                         , �����ð��� AS ��������
                      FROM �����ÿ��ų���
                    -- WHERE ���Ź�ȣ >= 3
                     UNION ALL
                     
                    SELECT ���Ź�ȣ
                         , �ܼ�Ʈ�̸�
                         , �ܼ�Ʈ����
                      FROM �ܼ�Ʈ���ų���
                   --  WHERE ���Ź�ȣ >= 3
                     UNION ALL
                     
                    SELECT ���Ź�ȣ
                         , ���̸�
                         , �ذ���
                      FROM ���忹�ų���
                    -- WHERE ���Ź�ȣ >= 3
                    )
 WHERE ���Ź�ȣ >= 3 ;
 
 
 
 
-- �ǽ� 2��


SELECT �����ð��� AS ��������
  FROM �����ÿ��ų���
  
  UNION -- �ߺ����ſ� ���� 
 
SELECT �ܼ�Ʈ����
  FROM �ܼ�Ʈ���ų��� 
  
  UNION
 
SELECT �ذ���
  FROM ���忹�ų��� ;
  
  
  
  
  
  
  
  
  
--
--
-- INDEX
-- 1. �ε��� (INDEX) ��?
-- 2. �ε��� (INDEX) ���� �����ϱ�
-- 3. NL (NESTED LOOP) ���� �����ϱ�
-- 4. �ǽ�




-- �ε����� å�� �ִ� ���� Ȥ�� ����ó��
-- Ư�� �����͸� ���� ã�� �� �ְ� Ư�� ��������
-- �����س��� ��ü 




-- F10 ( �����ȹ ) 




-- ���ؽ� ����


CREATE INDEX IDX_PRD ON TB_PRD ( PRD_TYPE ) ; 


SELECT ROWID
     , PRD_ID
     , PRD_NAME
     , PRD_TYPE
  FROM TB_PRD
 WHERE PRD_TYPE = '����Ʈ��' ; -- �ε��� ���� �� ���� 
 
 
 
 
-- �ε����� �̿��� ���
-- WHERE ���ǿ� �ε����� �ִ� �÷��� ���Ǹ�
-- �ε��� ��� ���� 
-- �����ȹ�� ���� INDEX RANGE SCAN �� ������
-- �̰��� �ε����� �̿��ؼ�
-- ���̺��� Ư�� ���� �����͸� ��ȸ�� �� �ǹ��մϴ�. 




-- �ε����� �������δ� DML ������ �����ϴ� ������ ���� 
-- ���� �Է� / ���� / ���� �� �Ǹ� 
-- �ε����� �Ȱ��� �ݿ��˴ϴ�. 
-- ( ���̺� ���뵵 �ٲ�� �ε��� ���뵵 �ٲ��.. ) 
-- �뷮�� ������ ��ȸ���� �ε����� ������ ������
-- ���� TABLE FULL SCAN �� ���� 
 
 
 
 
-- NL ( Nested Loop ) ����
-- ������ ������ ��� �߻��ϴ��� �������� �������� ���� ������
-- �ε����� ���� ���� �� �� �ִ� ���
-- �� �ܿ��� Hash Join , Sort Merge Join �� ������
-- ��κ� ������Ʈ���� ���� ����� NL ���� ��� 

-- ���� : ��ø �ݺ��� ó�� ��� 
-- ���� : �ε����� Ȱ�� , ���� �׼����� ���� �ҷ��� ������ ���� ����
-- ��κ��� ������Ʈ������ NL ������ �ַ� Ȱ���Ͽ� Ȱ�뵵�� ����. 
-- ���� : �ε����� �־�߸� ����� �� �ִ�. 
-- �ҷ��� �����Ͱ� �ƴ϶�� NL ������ �ſ� ��ȿ�����̴�. 


SELECT /*+ RULE */ A.MEMBER_ID -- �����ȹ ���� ���� 
     , A.MEMBER_NAME
     , A.GRADE_CD
     , B.GRADE_NAME
  FROM TB_MEMBER A
     , TB_GRADE B
 WHERE A.GRADE_CD = B.GRADE_CD ;
 
 
 
 
/*
DROP TABLE TB_TEST1 ;
DROP TABLE TB_TEST2 ;
--150���� �ӽõ����� �����ϱ�
CREATE TABLE TB_TEST1 (
COL1 NUMBER NOT NULL , COL2 NUMBER NOT NULL , COL3 NUMBER NOT NULL , COL4 NUMBER NOT NULL );
INSERT INTO TB_TEST1
SELECT /*+ APPEND */ LEVEL AS COL1 , LEVEL AS COL2 , LEVEL AS COL3 , LEVEL AS COL4
FROM DUAL
CONNECT BY LEVEL <= 1500000 ;
COMMIT;
--50���� �ӽõ����� �����ϱ�
CREATE TABLE TB_TEST2 (
COL1 NUMBER NOT NULL , COL2 NUMBER NOT NULL , COL3 NUMBER NOT NULL , COL4 NUMBER NOT NULL );
INSERT INTO TB_TEST2
SELECT /*+ APPEND */ LEVEL AS COL1 , LEVEL AS COL2 , LEVEL AS COL3 , LEVEL AS COL4
FROM DUAL
CONNECT BY LEVEL <= 500000 ;
COMMIT; 
*/


SELECT /*+ ORDERED USE_NL(B) */ *
  FROM TB_TEST1 A
     , TB_TEST2 B
 WHERE A.COL1 = B.COL1 ; -- �뷮 �� ��ȸ�� ���� 
 
 
CREATE INDEX IDX_TEST2 ON TB_TEST2 (COL1) ; -- �ε��� ���� 


DROP INDEX IDX_TEST2 ; -- �ε��� ���� �� ����� �ٽ� ������ 




-- PK ������ �⺻ �ε����� �ڵ����� �����˴ϴ�. 
-- ���̺��� 5% �̻��̸� FULL SCAN �� ����
-- ���̺��� 5% �̸��̸� INDEX ���� �� ��ȸ�� ����. 




