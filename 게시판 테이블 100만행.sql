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

SELECT * FROM �Խ��� ;