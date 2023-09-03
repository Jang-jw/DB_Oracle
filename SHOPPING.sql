--
--
-- SELECT 기본
-- 1. SQL 의미와 종류 

SELECT PAY_CARD_NO, JOIN_DY
    FROM TB_MEMBER 
    WHERE MEMBER_ID = 'BBBBB' ;

SELECT * 
    FROM TB_MEMBER ;
    
SELECT * -- 에스터리스크 
    FROM MAPPING 
    WHERE ENG ='PAY' ; 
    
    
    
    
-- 2. SQL 실행 순서

SELECT MEMBER_ID, MEMBER_NAME, GRADE_CD
    FROM TB_MEMBER
    WHERE GRADE_CD = 2 ; 
    
    
-- 실습
    
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
    
    
    
    
 -- 3. * 과 DISTINCT, AS 
    
SELECT * 
    FROM TB_PRD ; 
    
SELECT * 
    FROM TB_MEMBER ; -- 현업에서는 * 을 잘 쓰지 않는다. 모든 컬럼을 타이핑 하는게 좋다. 
    
SELECT DISTINCT PRD_TYPE -- 중복제거 
     FROM TB_PRD ; 
     
     
-- 실습
     
SELECT DISTINCT GENDER
     FROM TB_MEMBER ; 
     
SELECT DISTINCT GRADE_CD
     FROM TB_MEMBER ;
     
SELECT MEMBER_ID AS M_ID 
     , MEMBER_NAME AS M_NAME
     , PAY_CARD_NO AS P_CARD
     FROM TB_MEMBER ; -- 특수문자는 $ # _ 세가지만 가능 
     
     
-- NULL 이란?


    
    
SELECT * 
     FROM TB_MEMBER
WHERE MEMBER_ID = 'HHHHH' ; -- NULL 은 '아직 정해지지 않았습니다.'라는 개념임 

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
, '새로운자'
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
WHERE MEMBER_NAME = '사용자H' ;




-- 5. 자료형과 리터럴 
-- 실습 

CREATE TABLE 자료형테스트 ( --자료형테스트 라는 이름의 테이블을 만듭니다. 
문자컬럼 VARCHAR2(10) , --문자컬럼 이라는 컬럼에 문자형 자료형(VARCHAR2)부여
숫자컬럼 NUMBER , --숫자컬럼 이라는 컬럼에 숫자형 자료형(NUMBER) 부여
날짜컬럼 DATE ) ; --날짜컬럼 이라는 컬럼에 날짜형 자료형(DATE) 부여

/*
INSERT INTO 자료형테스트 ( 문자컬럼 , 숫자컬럼 , 날짜컬럼 ) VALUES ( 'A' , 1 , SYSDATE );
INSERT INTO 자료형테스트 ( 문자컬럼 , 숫자컬럼 , 날짜컬럼 ) VALUES ( 'A' , '3살' , SYSDATE );
INSERT INTO 자료형테스트 ( 문자컬럼 , 숫자컬럼 , 날짜컬럼 ) VALUES ( 'A' , 3 , 1 );
INSERT INTO 자료형테스트 ( 문자컬럼 , 숫자컬럼 , 날짜컬럼 ) VALUES ( 'BB' , '3' , SYSDATE );
*/


SELECT * FROM 자료형테스트 ;









--
--
-- SELECT 연산&함수 
-- 1. SELECT에 리터럴 사용하기

SELECT PRD_ID
     , PRD_NAME
     , PRD_PRICE
     , 10 AS 숫자
FROM TB_PRD ; /* 상품테이블 */ -- 19개의 데이터




-- 2. SELECT 에서 사칙연산하기

SELECT PRD_ID
     PRD_NAME
     , PRD_PRICE
     , 5000
     , PRD_PRICE + 5000
  FROM TB_PRD ;
  
  
-- 실습
  
SELECT PRD_ID
     , PRD_NAME
     , PRD_PRICE -- 상품가격 
     , PRD_PRICE * 0.1 AS 부가가치세 
     , PRD_PRICE + PRD_PRICE * 0.1 AS 판매가격
  FROM TB_PRD ;
  
  
  
  
-- 3. SELECT 에서 연결(||) 연산하기
  
SELECT GRADE_NAME || '(등급레벨:' || GRADE_CD || ')' AS 등급명과레벨
  FROM TB_GRADE ; /* 등급 테이블 */
  
SELECT * FROM TB_MEMBER ;


-- 실습 

SELECT MEMBER_ID 
     || ' 회원의 카드번호는 ' 
     || PAY_CARD_NO 
     || ' 입니다.' 
     AS 회원카드번호
  FROM TB_MEMBER ;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
SELECT *
  FROM TB_PRD ; -- SHIFT F4 : 정보보기 
  
SELECT LOWER('ABCDE123@@') AS LOWER사용
  FROM DUAL ; 
  
SELECT MEMBER_ID , PASSWD , LOWER(PASSWD) AS 패스워드소문자
  FROM  TB_MEMBER ; 
  
SELECT PRD_ID
     , PRD_INFO
     , SUBSTR(PRD_INFO , 1 , 5) || '...' AS 상품설명생략
  FROM TB_PRD
  WHERE PRD_TYPE = '가전' ;
  
SELECT TRIM(' 안녕하세요 '), TRIM(  '안  녕  하 세 요 ')
  FROM DUAL ;
  
SELECT MEMBER_ID
     , PAY_CARD_NO
     , REPLACE(PAY_CARD_NO , '-' , '#') AS 특수제외
  FROM TB_MEMBER
 WHERE GRADE_CD = 2 ;

-- 과제 

SELECT SUBSTR('https://smhrd.or.kr/' , 9 , 5) AS 결과
  FROM DUAL ;

SELECT MEMBER_ID
     , MEMBER_NAME
     , JOIN_DY
     , SUBSTR(JOIN_DY , 1 , 4) AS 가입년도 
  FROM TB_MEMBER ;
  
SELECT MEMBER_ID
     , PAY_CARD_NO
     , REPLACE(PAY_CARD_NO , '-' , '/')
  FROM TB_MEMBER ; 
  
SELECT MOD(100, 8) AS 나머지값
     , MOD(30,10) AS 나머지값2
  FROM DUAL ;
  
SELECT ROUND(1.452, 2)
     , ROUND(1.452, 1)
  FROM DUAL ;
  
SELECT SYSDATE -- YYYY/MM/DD H24:MI:SS 
  FROM DUAL ;
  
SELECT SYSDATE + 1 AS 하루더함
     , SYSDATE + 1/24 한시간더함
     , SYSDATE + 1/24/60 일분더함
     , SYSDATE + 1/24/60/60 일초더함
  FROM DUAL ;
  
-- 형 변환 함수 

SELECT TO_NUMBER('1') FROM DUAL ; -- 문자형('1')을 숫자형(1) 로 형변환해 출력
SELECT TO_CHAR(1) FROM DUAL ; --숫자형(1)을 문자형('1') 로 형변환해 출력
SELECT TO_CHAR(SYSDATE , 'YYYY/MM/DD HH24:MI:SS') FROM DUAL ; 
SELECT TO_CHAR(SYSDATE , 'YYYYMMDD') FROM DUAL ;
SELECT TO_DATE('20230101' , 'YYYY/MM/DD') FROM DUAL ; 
SELECT TO_DATE('20230101141212' , 'YYYY/MM/DD HH24:MI:SS') FROM DUAL;
/*
YYYY : 년도4자리 
  MM : 월2자리 (만약 1월이면 01로 표시)
  DD : 일2자리 (만약 1일이면 01로 표시)
YY24 : 시간 (24시간제) 0~23시
  HH : 시간 (12시간제) 0~11시
  MI : 분 (0~59)
  SS : 초 (0~59)
*/




-- 실습 

SELECT PRD_NAME
     , PRD_PRICE
     , SELL_COMP_NAME
     , REG_DATE
     , TO_CHAR(REG_DATE, 'YYYYMMDD') AS 등록년월일
  FROM TB_PRD ;
  
SELECT MEMBER_NAME + 1000 FROM TB_MEMBER ; -- 실행안됨 (문자 + 숫자) 
SELECT '1' + 1 FROM DUAL ; -- 실행됨 (수동 형변환) 

-- NULL 은 정상적인 산술연산, 비교연산이 불가능하다. 
SELECT MEMBER_ID
     , AGE
     , AGE + 1
  FROM TB_MEMBER ;
  
SELECT MEMBER_ID
     , AGE
     , NVL(AGE, 20) + 1 -- NULL 을 변환 (현업에서 많이 쓰임) 
  FROM TB_MEMBER ;
  
SELECT MEMBER_NAME
     , AGE
     , DECODE(AGE, NULL, 0, AGE)
  FROM TB_MEMBER ;
  
SELECT MEMBER_NAME
     , GRADE_CD
     , DECODE(GRADE_CD, 1, '브론즈', 2, '실버', 3, '골드', 4, 'VIP', 'VVIP') AS 등급
  FROM TB_MEMBER ;
  
SELECT COALESCE(NULL, NULL, 2, NULL, 3)
  FROM DUAL ;
  
SELECT MEMBER_ID
     , PASSWD
     , NVL(AGE, 20) AS AGE
  FROM TB_MEMBER ;
  
SELECT MEMBER_ID
     , GENDER
     , DECODE(GENDER, '남', 'MAN', '여', 'WOMAN', 'ELSE') AS 성별
  FROM TB_MEMBER ;
  
-- 2023.05.23 수업

SELECT MEMBER_ID --회원ID 
     , MEMBER_NAME --회원이름 
     , PASSWD --비밀번호 
     , GRADE_CD --등급코드 
     , GENDER --성별 
  FROM TB_MEMBER /* 회원정보 테이블 */ 
 WHERE GRADE_CD = 3 ;

SELECT *
  FROM TB_MEMBER
 WHERE GENDER = '여' ;
 
SELECT *
  FROM TB_PRD
 WHERE PRD_PRICE >= 1000000 ;
 
-- 문제풀이 

SELECT *
  FROM TB_GRADE
 WHERE GRADE_CD >= 4 ;
 
SELECT *
  FROM TB_MEMBER
 WHERE MEMBER_NAME = '사용자D' ;
 
SELECT *
  FROM TB_MEMBER_TEL
 WHERE TEL_DV_CD = '집' ;
 
SELECT PRD_ID
     , PRD_NAME
     , PRD_PRICE
  FROM TB_PRD
 WHERE PRD_PRICE >= 1500000 ;
 
SELECT *
  FROM MAPPING 
 WHERE ENG = 'TEL' ;

-- 혼자연습 

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
 WHERE PRD_TYPE = '컴퓨터'
    OR PRD_TYPE = '스마트폰' ;
    
-- 문제풀이 

SELECT *
  FROM TB_MEMBER
 WHERE GRADE_CD = 2
   AND GENDER = '남' ;
   
SELECT PRD_NAME
     , PRD_TYPE
     , PRD_PRICE
  FROM TB_PRD
 WHERE PRD_TYPE = '욕실용품'
   AND SELL_COMP_NAME = '다우니'
   AND PRD_PRICE >= 20000 ;
   
SELECT *
  FROM TB_MEMBER
 WHERE MEMBER_ID = 'AAAAA'
    OR MEMBER_ID = 'BBBBB' ;
    
-- OR , AND 순서 주의 
SELECT *
  FROM TB_MEMBER
 WHERE GRADE_CD = 3
    OR AGE = 30
   AND GENDER = '남' ;

SELECT *
  FROM TB_MEMBER
 WHERE (GRADE_CD = 3
    OR AGE = 30) -- 괄호로 순서를 바꿀 수 있다 
   AND GENDER = '남' ;
   
-- 부정 연산 
SELECT *
  FROM TB_PRD
 WHERE NOT PRD_TYPE = '가전' ; -- 같지않다
 
SELECT *
  FROM TB_PRD
 WHERE PRD_TYPE != '가전' ; -- 같지않다 (실무에서 많이 사용)
 
SELECT *
  FROM TB_PRD
 WHERE PRD_TYPE <> '가전' ; -- 같지않다  
 
SELECT *
  FROM TB_MEMBER
 WHERE NOT AGE < 30 ; -- NOT 
 
SELECT *
  FROM TB_MEMBER
 WHERE AGE >= 30 ; -- 실무에서 많이 사용 
 
 
-- 문제풀이 

SELECT *
  FROM TB_MEMBER_TEL
 WHERE TEL_DV_CD != '휴대폰' ;
 
SELECT *
  FROM TB_PRD
 WHERE PRD_PRICE <= 15000 ;
 
 
-- NULL 조건

SELECT *
  FROM TB_MEMBER
 WHERE GENDER = NULL ; -- NULL 은 정상적인 산술, 비교연산이 불가능 

SELECT *
  FROM TB_MEMBER
 WHERE GENDER IS NULL ; -- IS 로 변경 후 출력 
 
SELECT *
  FROM TB_MEMBER
 WHERE GENDER IS NOT NULL ; -- IS NOT 으로 부정연산 가능 
 
 
-- 문제풀이 

SELECT *
  FROM TB_MEMBER 
 WHERE AGE IS NOT NULL ;
 
SELECT *
  FROM TB_MEMBER
 WHERE GENDER IS NOT NULL
   AND    AGE IS NOT NULL ;
   
   
   -- SQL 연산자 
   -- IN 
SELECT *
  FROM TB_PRD
 WHERE PRD_TYPE = '가전'
    OR PRD_TYPE = '욕실용품'
    OR PRD_TYPE = '스마트폰'
    OR PRD_TYPE = '컴퓨터' ;
    
SELECT *
  FROM TB_PRD
 WHERE PRD_TYPE IN ('가전', '욕실용품', '스마트폰', '컴퓨터') ; -- IN 으로 쿼리를 간편하게 

SELECT *
  FROM TB_PRD
 WHERE PRD_TYPE IN ('가전', '욕실용품', 'NULL', '스마트폰', '컴퓨터') ; -- NULL 을 무시하고 출력 

SELECT *
  FROM TB_PRD
 WHERE PRD_TYPE NOT IN ('가전', '욕실용품', '스마트폰') ; -- NOT IN 으로 제외처리 

SELECT *
  FROM TB_PRD
 WHERE PRD_TYPE NOT IN ('가전', '욕실용품', NULL, '스마트폰') ; -- NOT IN 은 NULL 이 있으면 출력 안함 
 
 
 -- 문제풀이 
 
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
 WHERE AGE BETWEEN 20 AND 35 ; -- BETWEEN 으로 사이값 출력 ( 열린조건보다는 좋다)
 
 -- LIKE 조건 
 
SELECT *
  FROM TB_PRD
 WHERE PRD_NAME LIKE '수%' ; -- 0 개 이상 문자를 매칭한다. (시작하는 모든 것) 
 
SELECT *
  FROM TB_PRD
 WHERE PRD_NAME LIKE '%수%' ; -- 포함하는 모든 것 
 
SELECT *
  FROM TB_PRD
 WHERE PRD_TYPE LIKE '%용%' ;
 
SELECT *
  FROM TB_PRD
 WHERE PRD_NAME LIKE '%기' ; -- 끝나는 모든 것 
 
SELECT *
  FROM TB_PRD
 WHERE PRD_NAME LIKE '%기%' ;
 
SELECT *
  FROM TB_PRD
 WHERE PRD_NAME LIKE '__기' ;
 
 -- 문제풀이 
 
SELECT MEMBER_NAME
     , JOIN_DY
  FROM TB_MEMBER
 WHERE JOIN_DY LIKE '2023%' ;
 
SELECT PRD_NAME
     , PRD_PRICE
  FROM TB_PRD
 WHERE PRD_TYPE IN ('주방용품', '욕실용품') ;
 
SELECT *
  FROM TB_PRD
 WHERE PRD_INFO LIKE '%적합한%' ;
 
 
 
 
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

 SELECT PRD_ID  -- 현업에서 많이 쓰는 방법 
     , PRD_NAME
     , REG_DATE
  FROM TB_PRD
 WHERE REG_DATE >= TO_DATE('20230501000000', 'YYYYMMDDHH24MISS')
   AND REG_DATE <= TO_DATE('20230503000000', 'YYYYMMDDHH24MISS') ;
   
   -- 문제 풀이 
   
SELECT PRD_NAME
     , PRD_INFO
     , REG_DATE
  FROM TB_PRD
 WHERE REG_DATE >= TO_DATE('20230509000000', 'YYYYMMDDHH24MISS')
   AND REG_DATE <= TO_DATE('20230509235959', 'YYYYMMDDHH24MISS') ;
   
   
   
   
   -- 테이블과 스키마의 관계
   
SELECT SHOPPING.TB_MEMBER.MEMBER_ID
     , SHOPPING.TB_MEMBER.MEMBER_NAME
  FROM SHOPPING.TB_MEMBER
 WHERE SHOPPING.TB_MEMBER.GRADE_CD = 1 ;
   
SELECT TB_MEMBER.MEMBER_ID
     , TB_MEMBER.MEMBER_NAME
  FROM TB_MEMBER
 WHERE TB_MEMBER.GRADE_CD = 1 ; -- 스키마를 삭제해도 실행 됨 ( 현재 접속 계정 기준 )
 
SELECT MEMBER_ID
     , MEMBER_NAME
  FROM TB_MEMBER
 WHERE GRADE_CD = 1 ; -- 테이블을 삭제해도 실행 됨 ( FROM 이후 테이블 1개일 경우 )
 
SELECT *
  FROM TB_MEMBER
     , TB_MEMBER_TEL ;
     
SELECT A.MEMBER_ID 
     , A.MEMBER_NAME
     , B.MEMBER_ID
     , B.TEL_NO
  FROM TB_MEMBER A
     , TB_MEMBER_TEL B ; -- 현업에서 많이 사용 함 ( 테이블 별칭 지정은 AS 를 사용하지 않음 ) 
     
SELECT A.MEMBER_ID 
     , TB_MEMBER.MEMBER_NAME
     , B.MEMBER_ID
     , B.TEL_NO
  FROM TB_MEMBER A
     , TB_MEMBER_TEL B ; -- 별칭 지정 후 테이블명 사용시 에러 발생 
     
SELECT A.회원ID
     , A.이름
     , B.구분코드
  FROM 회원 A
     , 회원연락처 B 
 WHERE A.회원ID = B.회원ID  -- 조인조건 
   AND A.회원ID = 'A0001' -- 일반조건
   AND B.구분코드 = '휴대폰' ;
   
   -- 실습 
   
SELECT A.MEMBER_ID -- '.' 은 '접근연산자' 이다. 
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
   AND B.TEL_DV_CD = '휴대폰' ;
   
SELECT *
  FROM 회원 A
     , 회원연락처 B
WHERE A.회원ID = B.회원ID ; -- INNER JOIN 

SELECT *
  FROM 회원 A
     , 회원연락처 B
WHERE A.회원ID = B.회원ID(+) ; -- OUTER JOIN 

SELECT *
  FROM 회원 A
     , 회원연락처 B
WHERE A.회원ID(+) = B.회원ID ; -- OUTER JOIN 

-- 문제풀이 
-- 1번 
SELECT A.MEMBER_ID
     , A.MEMBER_NAME
     , B.LIKE_PRD_TYPE AS 선호상품타입
     , B.REG_DATE AS 등록일시
  FROM TB_MEMBER A
     , TB_MEMBER_LIKE B
 WHERE A.MEMBER_ID = B.MEMBER_ID 
   AND A.MEMBER_ID = 'BBBBB' ;
 
-- 2번 
SELECT A.MEMBER_ID
     , A.MEMBER_NAME
     , A.GRADE_CD
     , B.TEL_NO
  FROM TB_MEMBER A
     , TB_MEMBER_TEL B
 WHERE A.MEMBER_ID = B.MEMBER_ID(+) ;
 
-- 3번 
SELECT A.MEMBER_ID
     , A.MEMBER_NAME
     , A.GRADE_CD
     , B.TEL_NO
  FROM TB_MEMBER A
     , TB_MEMBER_TEL B
 WHERE A.MEMBER_ID = B.MEMBER_ID(+)
   AND B.TEL_NO IS NULL ;
   
-- 4번 
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
 
-- 5번 
SELECT B.MEMBER_ID
     , B.PRD_ID
     , A.PRD_NAME
  FROM TB_PRD A
     , TB_WISH B
 WHERE A.PRD_ID = B.PRD_ID
   AND B.MEMBER_ID = 'AAAAA' ;
   
-- ANSI JOIN ( 문제풀이를 ANSI JOIN 으로 변경 )
-- 1번 
SELECT A.MEMBER_ID
     , A.MEMBER_NAME
     , B.LIKE_PRD_TYPE AS 선호상품타입
     , B.REG_DATE AS 등록일시
  FROM TB_MEMBER A INNER JOIN TB_MEMBER_LIKE B
    ON (A.MEMBER_ID = B.MEMBER_ID)
   WHERE A.MEMBER_ID = 'BBBBB' ;
 
-- 2번 
SELECT A.MEMBER_ID
     , A.MEMBER_NAME
     , A.GRADE_CD
     , B.TEL_NO
  FROM TB_MEMBER A LEFT OUTER JOIN TB_MEMBER_TEL B
    ON (A.MEMBER_ID = B.MEMBER_ID) ;
 
-- 3번 
SELECT A.MEMBER_ID
     , A.MEMBER_NAME
     , A.GRADE_CD
     , B.TEL_NO
  FROM TB_MEMBER A LEFT OUTER JOIN TB_MEMBER_TEL B
    ON (A.MEMBER_ID = B.MEMBER_ID)
 WHERE B.TEL_NO IS NULL ;
   
-- 4번 
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
 
-- 5번 
SELECT B.MEMBER_ID
     , B.PRD_ID
     , A.PRD_NAME
  FROM TB_PRD A INNER JOIN TB_WISH B
    ON (A.PRD_ID = B.PRD_ID)
 WHERE B.MEMBER_ID = 'AAAAA' ;
 
-- 예제 
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
DROP TABLE 학생인적사항   ;
DROP TABLE 수강생정보   ;
DROP TABLE 성적표   ;
CREATE TABLE 수강생정보   (
학생ID VARCHAR2(9) PRIMARY KEY , 
학생이름 VARCHAR2(50) NOT NULL , 
소속반 VARCHAR2(5) 
);
CREATE TABLE 성적표   ( 
학생ID VARCHAR2(9) , 
과목        VARCHAR2(30) , 
성적        NUMBER  , 
CONSTRAINT PK_성적표   PRIMARY KEY(학생ID , 과목) , 
CONSTRAINT FK_성적표   FOREIGN KEY(학생ID) REFERENCES 수강생정보(학생ID) 
)  ; 
INSERT INTO 수강생정보   VALUES ('S0001' , '김현철' , 'A') ; 
INSERT INTO 수강생정보   VALUES ('S0002' , '문현중' , 'A') ; 
INSERT INTO 수강생정보   VALUES ('S0003' , '강문치' , 'B') ; 
INSERT INTO 수강생정보   VALUES ('S0004' , '박나선' , 'B') ; 
INSERT INTO 수강생정보   VALUES ('S0005' , '신태강' , 'B') ; 
INSERT INTO 수강생정보   VALUES ('S0006' , '물고기' , 'C') ; 
INSERT INTO 수강생정보   VALUES ('S0007' , '자라니' , 'C') ; 
INSERT INTO 수강생정보   VALUES ('S0008' , '공팔두' , 'C') ; 
INSERT INTO 수강생정보   VALUES ('S0009' , '최팔현' , 'C') ; 
INSERT INTO 성적표  VALUES('S0001'  ,'국어' , 90); 
INSERT INTO 성적표  VALUES('S0001'  ,'수학' , 85); 
INSERT INTO 성적표  VALUES('S0001'  ,'영어' , 100); 
INSERT INTO 성적표  VALUES('S0002'  ,'국어' , 100); 
INSERT INTO 성적표  VALUES('S0002'  ,'수학' , 100); 
INSERT INTO 성적표  VALUES('S0002'  ,'영어' , 20); 
INSERT INTO 성적표  VALUES('S0003'  ,'국어' , 100); 
INSERT INTO 성적표  VALUES('S0003'  ,'수학' , 100); 
INSERT INTO 성적표  VALUES('S0003'  ,'영어' , 20); 
INSERT INTO 성적표  VALUES('S0004'  ,'국어' , 85); 
INSERT INTO 성적표  VALUES('S0004'  ,'수학' , 40); 
INSERT INTO 성적표  VALUES('S0004'  ,'영어' , 60); 
INSERT INTO 성적표  VALUES('S0005'  ,'국어' , 100); 
INSERT INTO 성적표  VALUES('S0005'  ,'수학' , 100); 
INSERT INTO 성적표  VALUES('S0005'  ,'영어' , 100); 
INSERT INTO 성적표  VALUES ( 'S0006' , '국어' , NULL ) ; 
INSERT INTO 성적표  VALUES ( 'S0006' , '수학' , NULL ) ; 
INSERT INTO 성적표  VALUES ( 'S0006' , '영어' , NULL ) ; 
COMMIT; 
*/

SELECT * FROM 수강생정보 ;
SELECT * FROM 성적표 ;

SELECT 소속반, COUNT(*) AS 반별인원수
  FROM 수강생정보
 GROUP BY 소속반 ;
 
SELECT 소속반, 학생이름 -- 행렬이 맞지 않아서 출력 안됨 
  FROM 수강생정보
 GROUP BY 소속반 ;
 
SELECT 소속반, COUNT(학생이름)
  FROM 수강생정보
 GROUP BY 소속반 ;
 
 
 
 
 
 
--
--
-- DML (Data Manipulation Language) 
-- 1. DML 이란?

-- INSERT INTO VALUE
-- UPDATE SET
-- DELETE FROM 




-- 2. DML 문법 - INSERT 


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
     , '사용자Z'
     , '88888'
     , 'BBBB-BBBB-BBBB-BBBB'
     , TO_CHAR(SYSDATE , 'YYYYMMDD')
     , 1
     , '여'
     , 'N'
) ; 

SELECT * FROM TB_MEMBER ;

INSERT INTO TB_MEMBER
VALUES (
'YYYYY'
, '사용자Y'
, 'PASS567!!'
, 'CCCC-CCCC-CCCC-CCCC'
, TO_CHAR(SYSDATE , 'YYYYMMDD')
, 2
, '남'
, 30
, 'N'
) ;

SELECT * FROM TB_MEMBER ;



-- 2. DML 문법 UPDATE 

UPDATE TB_MEMBER
   SET MEMBER_NAME = '변경된사용자A'
     , GRADE_DE = 2
     , AGE      = 52
 WHERE MEMBER_ID = 'AAAAA' ;
 
SELECT * FROM TB_MEMBER ;

ROLLBACK ; -- 잘 못 수정했을 경우 '롤백'


-- 2. DML 문법 DELETE 

DELETE FROM TB_WISH 
 WHERE MEMBER_ID = 'AAAAA'
   AND PRD_ID = 'P0002' ;
   
   
   
   
   
   
   
   
   
--
--
-- DDL (Data Definition Language)
-- 1. DDL 이란

-- 2. 테이블 생성하기 

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
     , '쥐는 영어로 무엇일까요?'
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
     , '달력은 영어로 무엇일까요?'
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
     , '종이는 영어로 무엇일까요?'
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




-- 3. 제약조건 
-- 테이블당 무조건 하나의 PRIMARY KEY 가 있어야 합니다. 
-- UNIQUE 
-- DDL 은 실행즉시 자동 COMMIT 됨 

ALTER TABLE QUIZ_TABLE ADD CONSTRAINT PK_QUIZ_TABLE PRIMARY KEY (Q_ID) ;

SELECT * FROM QUIZ_TABLE ;

-- FOREIGN KEY (FK) = 외래키

-- TB_MEMBER 와 TB_MEMBER 간 FK 설정

ALTER TABLE TB_MEMBER_TEL DROP CONSTRAINT FK_MEMBER ; -- 기존의 제약조건을 제거한다. 

SELECT * FROM TB_MEMBER ;
SELECT * FROM TB_MEMBER_TEL ;

ALTER TABLE TB_MEMBER_TEL ADD CONSTRAINT FK_MEMBER -- 제약조건을 추가한다. 
FOREIGN KEY (MEMBER_ID) REFERENCES TB_MEMBER(MEMBER_ID) ; 




-- 실습 
-- 테이블 생성

CREATE TABLE STUDENT (
      학생ID      VARCHAR2(10) NOT NULL
    , 학생이름     VARCHAR2(20) NOT NULL
    , 가입일시     DATE
    , 나이        NUMBER DEFAULT 0 
) ;

SELECT * FROM STUDENT ;

CREATE TABLE STUDENT_TEL (
      학생ID     VARCHAR2(10) NOT NULL
    , 구분코드   VARCHAR2(10) NOT NULL
    , 연락처     VARCHAR2(15) NOT NULL
) ;

SELECT * FROM STUDENT_TEL ;

CREATE TABLE STUDENT_ADDR (
      학생ID      VARCHAR2(10) NOT NULL
    , 도로명주소   VARCHAR2(200) NOT NULL
) ;

SELECT * FROM STUDENT_ADDR ;

-- 제약조건 설정
-- 제약조건 제거 문법 : ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건이름 ;

ALTER TABLE STUDENT
    ADD CONSTRAINT PK_STUDENT
    PRIMARY KEY (학생ID) ;
ALTER TABLE STUDENT_TEL
    ADD CONSTRAINT PK_STUDENT_TEL
    RIMARY KEY (학생ID,구분코드) ;
ALTER TABLE STUDENT_ADDR
    ADD CONSTRAINT PK_STUDENT_ADDR
    PRIMARY KEY (학생ID) ;

ALTER TABLE STUDENT_TEL
    ADD CONSTRAINT FK_STUDENT_TEL 
    FOREIGN KEY(학생ID) REFERENCES STUDENT(학생ID) ;
ALTER TABLE STUDENT_ADDR
    ADD CONSTRAINT FK_STUDENT_ADDR
    FOREIGN KEY(학생ID) REFERENCES STUDENT(학생ID) ;
    
    
    
    
-- 4. 테이블 수정하기 
-- 현업에서는 권장하지 않음 ( 오류 다수 발생 ) 

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
    RENAME COLUMN 학생ID
    TO STUDENT_ID ;

SELECT * FROM STUDENT ;




-- 5. 테이블 / 제약조건 삭제하기

DROP TABLE STUDENT ;

SELECT * FROM STUDENT ;

DROP TABLE STUDENT CASCADE CONSTRAINT ;

SELECT * FROM STUDENT ;




-- DELETE : 복원 가능 ( 테이블이 남아있다) 
-- TRUNCATE : 복원 불가능 ( 테이블이 남아있다) 
-- DROP : 복원 불가능 ( 테이블도 남아있지 않는다 )




-- 6. 시퀀스와 뷰

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
ORDER_NO_SEQ.NEXTVAL -- 시퀀스 의미를 기억! 
, 'BBBBB'
, 'P0003'
, SYSDATE
, 2
, 1200000
) ; 

SELECT * FROM TB_ORDER ;

ROLLBACK ;

DROP SEQUENCE ORDER_NO_SEQ ;




-- 6. 시퀀스와 뷰

CREATE VIEW MEMBER_SIMPLE_VIEW AS
SELECT A.MEMBER_ID
     , A.GRADE_CD
     , B.TEL_NO
  FROM TB_MEMBER A
     , TB_MEMBER_TEL B
 WHERE A.MEMBER_ID = B.MEMBER_ID
   AND B.TEL_DV_CD = '휴대폰' ;
   
SELECT * 
  FROM MEMBER_SIMPLE_VIEW
 WHERE MEMBER_ID = 'AAAAA' ; -- VIEW 는 TABLE 처럼 자유롭게 사용 가능 
   
SELECT *
  FROM ( -- 서브쿼리중 하나 : 인라인 VIEW 
  SELECT A.MEMBER_ID
     , A.GRADE_CD
     , B.TEL_NO
  FROM TB_MEMBER A
     , TB_MEMBER_TEL B
 WHERE A.MEMBER_ID = B.MEMBER_ID
   AND B.TEL_DV_CD = '휴대폰'
   )
 WHERE MEMBER_ID = 'AAAAA' ; 
 
DROP VIEW MEMBER_SIMPLE_VIEW ;




--
--
-- TLC
-- 1. TCL 이란? 




-- 2. 트랜잭션 이해하기 




-- 3. 




-- 4. SAVEPOINT 



SELECT * FROM TB_PRD
 WHERE PRD_ID = 'P0001' ;
 
 
 
 
-- 실습 
-- 1번 
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




-- 2번 

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
-- 1. DCL 이란?





  
  
  
  
--
--
-- 실무 기술 - 페이징 ( 현업 사용 정도 ★ ★ ★ ★ ★ ) 
-- ROWNUM 이해하기 

SELECT * 
  FROM TB_MEMBER ;

SELECT ROWNUM AS RN
      , MEMBER_ID
      , MEMBER_NAME
      , JOIN_DY
      , AGE
  FROM TB_MEMBER
 WHERE ROWNUM <= 3 ; 
-- WHERE ROWNUM = 2 ; => ROWNUM 은 1 부터 사용해야 한다. ( 출력안됨 )
-- WHERE ROWNUM <= 2 ; => ROWNUM 은 1 부터 사용해야 한다. ( 출력됨)

SELECT * 
  FROM (
    SELECT ROWNUM AS RN
          , MEMBER_ID
          , MEMBER_NAME
          , JOIN_DY
          , AGE
      FROM TB_MEMBER  
  )
 WHERE RN = 2 ; -- 인라인 뷰를 사용하면 ROWNUM 은 따로 출력 가능하다. 
 
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
 WHERE RN <= 5 ; -- 인라인 뷰에 ROWNUM 사용시 RN 을 컬럼처럼 사용 가능 
 
 
 
 
-- 실습 

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
 WHERE RN > 6 ; -- JOIN_DY 로 역순 정렬을 했으므로 RN 이 역순인 상태임 

/*
CREATE TABLE 게시판 (
게시판번호 NUMBER(9) PRIMARY KEY ,
작성자 VARCHAR2(50) NOT NULL ,
게시물내용 VARCHAR2(4000) NOT NULL ,
작성일시 DATE NOT NULL
) ;
INSERT INTO 게시판
SELECT LEVEL -- 게시판번호
, '아이디' || MOD(LEVEL , 10000) -- 작성자
, '아이디' ||
MOD(LEVEL , 10000) ||
'님이 작성하신 게시물입니다. 이 게시물은 게시판 번호가 '
|| LEVEL
|| '입니다' -- 게시물내용
, TO_DATE('20000101') + LEVEL --2022년 1월1일부터 하루씩 게시물이 입력되는 것
FROM DUAL
CONNECT BY LEVEL <=1000000; --100만건의 데이터 입력
COMMIT; 
*/

SELECT * FROM 게시판 ; -- 100 만건 게시물을 테이블로 저장한 상태 




-- 실습 

SELECT *
  FROM (
        SELECT *
          FROM 게시판
         ORDER BY 작성일시 DESC -- 오름차순 
        )
 WHERE ROWNUM <= 20 ;
 



-- 3. 페이징 기술 이해하기 

SELECT *
  FROM (
        SELECT ROWNUM AS RN
             , A.*
          FROM (
                SELECT *
                  FROM 게시판
                 ORDER BY 작성일시 DESC
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
                SELECT *               -- 우리가 
                  FROM 게시판           -- 작성하는 
                 ORDER BY 작성일시 DESC -- 부분 
                ) A
         WHERE ROWNUM <= 20 * N
        )
 WHERE RN >= 20*(N-1)+1 ;
*/ 









--
--
-- 서브쿼리 ( SUB QUERY )
-- 1. 서브쿼리의 개념
-- 2. 스칼라 서브쿼리 (사용 : SELECT)
-- 3. 인라인 뷰 (사용 : FROM)
-- 4. 중첩서브쿼리 (사용 : WHERE) & 단일행 / 다중행 연산자 




-- 1. 서브쿼리의 개념 
-- 서브쿼리 (SUB QUERY) 란? 
-- 작성된 쿼리 내부에 다른 쿼리를 삽입하여 보다 다양하게 데이터를 출력하는 방법을 제공




-- 2. 스칼라 서브쿼리 ( 사용 : SELECT ) 
-- SELECT 에서 사용되는 서브쿼리
-- 하나의 컬럼에 대해 하나의 행만 반환하는 특징을 보유
-- 출력되는 값이 없다면 NULL 을 반환 
-- SELECT 가 실행되는 횟수만큼 각각의 인스턴스에 반복 대입 / 출력 됩니다. 
-- 스칼라 서브쿼리로 출력되는 행 (튜플) 은 1개 혹은 NULL 이어야 합니다. 
-- 스칼라 서브쿼리로 출력되는 컬럼은 1개여야 합니다. 




-- 예시 
 
SELECT A.MEMBER_ID                       AS 회원ID
     , A.MEMBER_NAME                     AS 회원이름
     , (
        SELECT TEL_NO
          FROM TB_MEMBER_TEL
         WHERE TEL_DV_CD = '휴대폰'
           AND MEMBER_ID = A.MEMBER_ID ) AS 휴대폰번호
  FROM TB_MEMBER A
 WHERE A.MEMBER_ID IN ( 'AAAAA', 'BBBBB', 'CCCCC', 'DDDDD' ) ;
 
 


-- 실습 
--1번 
-- TB_MEMBER 테이블에는 GRADE_CD 라는 컬럼이 있습니다. 
-- 스칼라 서브쿼리를 이용해서 TB_GRADE 테이블에 있는
-- GRADE_NAME 값을 가져와 데이터를 출력해주세요. 


SELECT * FROM TB_MEMBER ;
SELECT * FROM TB_GRADE ;

SELECT A.MEMBER_ID AS 회원ID
     , A.MEMBER_NAME AS 회원이름
     , A.GRADE_CD AS 등급코드
     , B.GRADE_NAME AS 등급이름
  FROM TB_MEMBER A JOIN TB_GRADE B -- JOIN 사용 
    ON A.GRADE_CD = B.GRADE_CD ;
  
SELECT A.MEMBER_ID AS 회원ID
     , A.MEMBER_NAME AS 회원이름
     , A.GRADE_CD AS 등급코드
     , (
        SELECT GRADE_NAME
          FROM TB_GRADE
         WHERE GRADE_CD = A.GRADE_CD ) AS 등급이름 -- 서브쿼리 ( 스칼라 ) 사용 
  FROM TB_MEMBER A ;
  
  


-- 2번 
-- TB_ORDER 테이블에는 각각 MEMBER_ID 와 PRD_ID 컬럼을 이용해
-- TB_MEMBER 테이블과 TB_PRD 테이블과 연결되어 있습니다. 
-- TB_ORDER 테이블의 MEMBER_ID 컬럼을 이용하면 TB_MEMBER 테이블에서
-- MEMBER_NAME 을 가져올 수 있습니다. 
-- TB_ORDER 테이블의 PRD_ID 컬럼을 이용하면 
-- TB_PRD 테이블에서 PRD_NAME 을 가져올 수 있습니다. 

  
SELECT * FROM TB_ORDER ;
SELECT * FROM TB_PRD ;

SELECT ROWNUM AS 주문번호
     , A.MEMBER_ID AS 주문자이름
     , A.PRD_ID AS 상품ID
     , B.PRD_NAME AS 상품이름
  FROM TB_ORDER A JOIN TB_PRD B -- JOIN 사용 
    ON A.PRD_ID = B.PRD_ID ;
  
SELECT ROWNUM AS 주문번호
     , A.MEMBER_ID AS 주문자이름
     , A.PRD_ID AS 상품ID
     , (
        SELECT PRD_NAME
          FROM TB_PRD
         WHERE A.PRD_ID = PRD_ID ) AS 상품이름 -- 스칼라 서브쿼리 사용 
  FROM TB_ORDER A ;
  
  
  
  
-- 스칼라 서브쿼리의 장단점 
-- 장점 
-- (1) 조인할 테이블의 개수를 줄여서 이해하기 쉽게 만들 수 있다. 
-- (2) 캐싱 기능을 이용해서 성능을 증가시킬 수 있다. 

-- 단점 
-- (1) SELECT 횟수만큼 실행하므로 성능이 떨어질 수 있다. 
-- (차라리 조인이 성능 더 좋을 수 있음)
-- (2) 하나의 컬럼, 하나의 값만 가져와야 한다는 제약이 있다. (조인은 제약 없음)




-- 3. 인라인 뷰 ( Inline View )
-- FROM 부분에서 사용되는 서브 쿼리
-- FROM 절에 쿼리를 작성해 결과를
-- 가상의 테이블인 것 처럼 사용할 수 있음 


-- 예시


SELECT A.MEMBER_ID
     , A.MEMBER_NAME
     , A.GRADE_CD
     , A.AGE
     , B.등급별최고나이
 FROM TB_MEMBER A
    , (
        SELECT GRADE_CD
             , MAX(AGE) AS 등급별최고나이
          FROM TB_MEMBER
         GROUP BY GRADE_CD
        ) B -- 등급별로 가장 나이가 많은 정보
 WHERE A.GRADE_CD = B.GRADE_CD
   AND A.AGE = B.등급별최고나이 ;
   
   
   
   
-- 중첩서브쿼리 (Nested Sub Query)
-- WHERE 부분에서 사용되는 서브 쿼리 
-- 메인쿼리의 컬럼을 쓰냐 안쓰냐에 따라 
-- 상관서브쿼리, 비상관서브쿼리로 나뉨 




-- 상관서브쿼리
-- 실행순서 : 메인 -> 서브 
-- 서브쿼리에서 메인쿼리의 컬럼을 사용하는 
-- 서브쿼리를 의미합니다. (메인쿼리와 연관 O )
-- 메인쿼리에서 출력되는 튜플(행) 수만큼 서브쿼리가 실행되고
-- 그 결과를 대입해 메인쿼리를 실행합니다. 




-- 예시
   
   
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
                    
                    
                    
                    
-- 실습
-- TB_PRD 테이블에서 상품 타입 별로 가장 싼 가격의 상품 정보를 출력해주세요.


SELECT PRD_ID
     , PRD_NAME
     , PRD_TYPE
     , PRD_PRICE
  FROM TB_PRD A
 WHERE PRD_PRICE = ( SELECT MIN(PRD_PRICE)
                       FROM TB_PRD
                      WHERE A.PRD_TYPE = PRD_TYPE
                    ) ;
                    
                    
                    
                    
-- 비상관서브쿼리
-- 실행순서 : 서브 -> 메인
-- 서브쿼리에서 메인쿼리의 컬럼을 사용하지 않는 
-- 서브쿼리를 의미합니다. (메인쿼리와 연관 X)
-- 이 경우 서브쿼리가 먼저 실행되고 메인쿼리가 실행됩니다. 




-- 예시


SELECT *
  FROM TB_PRD
 WHERE PRD_PRICE = ( SELECT MAX(PRD_PRICE)
                       FROM TB_PRD
                    ) ;
                    
                    
        
   
-- 실습 1번
-- TB_MEMBER 테이블에서 회원들 중에 
-- 평균 AGE 이상인 AGE 정보를 가진 대상만 출력해주세요. 


SELECT MEMBER_NAME
     , GRADE_CD
     , AGE
  FROM TB_MEMBER
 WHERE AGE >= ( SELECT AVG(AGE)
                  FROM TB_MEMBER
                ) ;
                
                
                
                
-- 실습 2번 
-- TB_PRD 테이블에서 가장 싼 가격을 가진 상품 정보를 출력해주세요. 


SELECT PRD_NAME
     , PRD_INFO
     , PRD_PRICE
  FROM TB_PRD
 WHERE PRD_PRICE <= ( SELECT MIN(PRD_PRICE)
                        FROM TB_PRD
                    ) ;
                    
                    
                    
                    
-- 풀이

SELECT MEMBER_NAME
     , GRADE_CD
     , AGE
  FROM TB_MEMBER
 WHERE AGE >= (
        SELECT AVG(AGE) -- GROUP BY 가 되어야만 사용할 수 있는 집계 함수 
          FROM TB_MEMBER ) -- GROUP BY () 가 숨어 있는 상태
 ORDER BY GRADE_CD ;

SELECT MEMBER_NAME
     , AVG(AGE)
  FROM TB_MEMBER
 GROUP BY MEMBER_NAME 
-- WHERE AGE >= AVG(AGE)
-- ORDER BY GRADE_CD ;
;




-- 단일행 연산자 / 다중행 연산자 
-- WHERE 절에서 서브 쿼리 결과를 받을 때
-- 단일행을 받을 수 있는 연산자와 다중행을 받을 수 있는 연산자가 있습니다. 
-- 다중행을 받을 수 있는 연산자 : IN, ANY, ALL, EXISTS, NOT EXISTS




-- 예시


SELECT *
  FROM TB_MEMBER
 WHERE GRADE_CD = ( SELECT GRADE_CD
                      FROM TB_GRADE ) ; -- 오류가 발생한다. (서브쿼리가 다중행)
                      
                      
SELECT *
  FROM TB_MEMBER
 WHERE GRADE_CD IN ( SELECT GRADE_CD
                       FROM TB_GRADE ) ;
                       
                       
                       
                       
-- IN 은 입력된 다중 행에 대해 일치하는 값을 출력합니다. 


SELECT PRD_ID
     , PRD_NAME
     , PRD_TYPE
     , PRD_PRICE
  FROM TB_PRD
 WHERE PRD_PRICE IN ( SELECT MAX(PRD_PRICE)
                        FROM TB_PRD
                       GROUP BY PRD_TYPE
                    ) ;
                       
                       
                       
                       
-- ANY 는 입력된 다중 행에 대해 일치하는 값을 출력합니다. 


SELECT PRD_ID
     , PRD_NAME
     , PRD_TYPE
     , PRD_PRICE
  FROM TB_PRD
 WHERE PRD_PRICE = ANY ( SELECT MAX(PRD_PRICE)
                        FROM TB_PRD
                       GROUP BY PRD_TYPE
                    ) ;
                       
                       
                       
                  
-- ALL 은 입력된 다중 행에 대해
-- 조건이 모두 일치하는 값을 출력합니다. 


SELECT PRD_ID
     , PRD_NAME
     , PRD_TYPE
     , PRD_PRICE
  FROM TB_PRD
 WHERE PRD_PRICE >= ALL ( SELECT MAX(PRD_PRICE)
                        FROM TB_PRD
                       GROUP BY PRD_TYPE
                    ) ; 
                       
                       
                       
                       
-- 실습
-- 아래 테이블에 대해서 다음 중 오류가 발생하는 쿼리는 무엇인가? 


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
                
                
                
                

-- 답 : 3번 









--
--
-- EXISTS 문법 
-- 1. EXISTS 문법 알아보기
-- 2. EXISTS 원리와 사용 이유
-- 3. 실습 문제 풀이




-- 실습
-- EXISTS 문법 이해를 위해 아래 테이블에서
-- 회원 중에 연락처 정보가 존재하는 회원들만 찾아봅시다. 


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
                
                
                
                
-- 풀이


SELECT MEMBER_ID
     , MEMBER_NAME
       FROM TB_MEMBER A
 WHERE EXISTS ( -- EXISTS : FOR 문 안에 BREAK; 가 있는것처럼 성능차이가 있음 
                SELECT 1
                  FROM TB_MEMBER_TEL
                 WHERE MEMBER_ID = A.MEMBER_ID
                ) ;
                
                
                
                
-- EXISTS 문법이란?
-- 특정 조건을 만족하는 데이터가 존재하는지 (EXISTS)
-- 여부를 확인할 때 사용하는 문법입니다. 
-- 대표적인 상관서브쿼리 기술이며 
-- 현업에서 자주 사용하는 스킬입니다. 




-- EXISTS 문법 작성 방법


SELECT MEMBER_ID
     , MEMBER_NAME
  FROM TB_MEMBER A
 WHERE EXISTS (
                SELECT 1
                  FROM TB_MEMBER_TEL
                 WHERE MEMBER_ID = A.MEMBER_ID
                ) ;
                
                
-- 1. WHERE 에 사용할 때 특정 컬럼을 이용하지 않습니다. 
-- 2. SELECT 뒤에 숫자 1은 의미가 없습니다. 
-- 'X' 도 가능하며 단순 문법 맞추기용도 입니다. 
-- 3. 메인쿼리의 컬럼 값을 빌려오고 있는 상관서브쿼리입니다. (A.MEMBER_ID)




-- EXISTS 원리 및 사용이유
-- 조건이 일치하는 대상을 찾을 경우
-- 이후의 행은 비교하지 않습니다. 
-- IN 과 서브쿼리를 이용해도 똑같은 결과를 출력할 수 있습니다. 
-- 하지만, 성능은 EXISTS 가 훨씬 좋습니다. 


SELECT MEMBER_ID
     , MEMBER_NAME
  FROM TB_MEMBER A
 WHERE MEMBER_ID IN ( SELECT MEMBER_ID
                        FROM TB_MEMBER_TEL
                    ) ;
                    
                    
-- IN 을 사용했을 때 문제점은
-- 조건에 일치하는 대상을 찾았더라도
-- 데이터를 끝가지 모두 비교합니다. 




-- 실습 
-- NOT EXISTS 문법의 이해를 위해 아래 테이블에서
-- 회원 중에 연락처 정보가 존재하지 않는 회원들만 찾아봅시다.

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
                    
                    
                    
                    
-- NOT EXISTS 원리 및 사용이유 
-- 조건에 일치하는 대상을 찾으면 
-- 이후의 행은 비교하지 않습니다. 
-- NOT IN 과 서브쿼리를 사용해도 
-- 똑같은 결과를 출력할 수 있습니다. 
-- 하지만, 성능은 NOT EXISTS 가 훨신 좋습니다. 
-- 그리고 NOT IN 사용시 치명적인 단점이 있습니다. 


SELECT MEMBER_ID
     , MEMBER_NAME
  FROM TB_MEMBER A
 WHERE MEMBER_ID NOT IN (
                        SELECT MEMBER_ID
                          FROM TB_MEMBER_TEL
                        UNION ALL
                        
                        SELECT NULL -- NULL 값을 임의로 삽입 
                          FROM DUAL
                        ) ; -- NULL 값이 있으면 아무것도 출력하지 않는 단점
                        
                        


-- 실습 1번
-- TB_ORDER 테이블은 주문 데이터를 입력받고 있습니다. 
-- TB_DRDER 테이블의 PRD_ID 컬럼과
-- TB_PRD 테이블의 PRD_ID 컬럼을 활용하여
-- 한번이라도 주문이 된 적이 있는 상품의 
-- PRD_ID 와 PRD_NAME 을 출력해주세요.


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
             
             
             
             
-- 실습 2번
-- TB_MEMBER 테이블과 TB_ORDER 테이블을 활용하여
-- 주문을 아직 한번도 하지 않는 회원이면서
-- GRADE_CD (등급코드) 가 3인 회원의 
-- MEMBER_ID , MEMBER_NAME , AGE 를 출력해주세요.


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
   
   
   
   
-- 실습 3번 (심화)
-- TB_MEMBER_LIKE 테이블은 회원이 어떤 상품 타입 (PRD_TYPE) 을 
-- 선호하는지 정보를 저장한 테이블입니다. 
-- 예를 들어, BBBBB 는 선호하는 상품타입이 '가전'과 '스마트폰'입니다.
-- ( SELECT * FROM TB_MEMBER_LIKE ; )
-- 이때, TB_PRD (상품) 테이블에는 여러가지 상품 타입이 존재합니다. 
-- BBBBB 회원이 선호하는 상품타입 외에 나머지 상품타입들을 출력해주세요.

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
-- CASE 문법
-- 1. CASE 문법 설명
-- 2. CASE 문법 원리 이해하기
-- 3. 실습 문제 풀이




-- 예시


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
     , CASE WHEN GENDER = '남' THEN 'Man'
            WHEN GENDER = '여' THEN 'Woman'
            ELSE 'notChecked'
        END AS 성별영문
    FROM TB_MEMBER ;
    
    
     
     
-- DECODE 활용 예시 


SELECT MEMBER_ID
     , MEMBER_NAME
     , GENDER
     , CASE WHEN GENDER = '남' THEN 'Man'
            WHEN GENDER = '여' THEN 'Woman'
            ELSE 'notChecked'
        END AS 성별영문
     , DECODE ( GENDER , '남' , 'Man' , '여' , 'Woman' , 'notChecked' ) AS 성별영문2
    FROM TB_MEMBER ;
    
    
    
    
-- SELECT 에 사용된 경우 출력될 행의 수 만큼 SELECT 가 실행,
-- CASE 문법도 행의 수만큼 실행됨 
-- 주의사항! CASE 문법이 조건이 일치하는 순간 바로 넘어갑니다. ( 순서 중요 )
    
    
    
    
-- 실습 1번

SELECT * FROM TB_GRADE ;

SELECT MEMBER_ID
     , MEMBER_NAME
     , GRADE_CD
     , CASE WHEN GRADE_CD = 1 THEN '브론즈'
            WHEN GRADE_CD = 2 THEN '실버'
            WHEN GRADE_CD = 3 THEN '골드'
            WHEN GRADE_CD = 4 THEN 'VIP'
            WHEN GRADE_CD = 5 THEN 'VVIP'
            ELSE 'X'
        END AS "등급 이름" -- 쌍따옴표로 감싸주면 별칭을 띄어쓰기 가능 (특수문자도 가능)
    FROM TB_MEMBER ;
    
    
    
    
-- 실습 2번 ( JOIN 을 이용한 풀이 )


SELECT  * FROM TB_MEMBER ;
SELECT * FROM TB_GRADE ;

SELECT A.MEMBER_ID
     , A.MEMBER_NAME
     , A.GRADE_CD
     , B.GRADE_NAME
  FROM TB_MEMBER A JOIN TB_GRADE B
    ON A.GRADE_CD = B.GRADE_CD ;
    
    
    
    
-- 실습 3번 


SELECT MEMBER_ID
     , MEMBER_NAME
     , GRADE_CD
     , CASE WHEN GRADE_CD >= 4 THEN '대상'
            ELSE '비대상'
        END AS 쿠폰대상여부
      FROM TB_MEMBER ;
      
      
      
      
      
      
      
      
      
-- MERGE 문법
-- 1. MERGE 문법 설명
-- 2. MERGE 사용 이유
-- 3. 실습 문제 풀이




-- MERGE 문법은 과정을 줄여 성능을 향상시킴
-- 즉, SELECT 로 판단을 해서 UPDATE 나 INSERT 하는 행위를 한번에 처리




-- 예시 1번


SELECT MEMBER_ID
  FROM TB_MEMBER_TEL
 WHERE MEMBER_ID = 'BBBBB'
   AND TEL_DV_CD = '휴대폰' ;
   
MERGE INTO TB_MEMBER_TEL A -- 대상테이블
USING DUAL -- 비교테이블 (없을 경우 DUAL)
   ON ( A.MEMBER_ID = 'BBBBB' AND TEL_DV_CD = '휴대폰' )
   
   -- 구분선 
   
WHEN MATCHED THEN
UPDATE
   SET TEL_NO = '010-7777-7777'
   
   -- 구분선 
   
WHEN NOT MATCHED THEN
INSERT ( MEMBER_ID , TEL_DV_CD , TEL_NO )
VALUES ( 'BBBBB' , '휴대폰' , '010-7777-7777' ) ;

SELECT *
  FROM TB_MEMBER_TEL ;





-- SELECT  먼저 해보고 UPDATE / INSERT 
-- 실무에서 필수사용은 아니나
-- MERGE 사용하면 효율이 좋아짐 
  
  
  
  
-- 예시 2번


MERGE INTO TB_MEMBER_TEL A
USING DUAL
   ON ( A.MEMBER_ID = 'BBBBB' AND TEL_DV_CD = '법인' )
   
WHEN MATCHED THEN
UPDATE
   SET TEL_NO = '02-5678-5555'

WHEN NOT MATCHED THEN
INSERT ( MEMBER_ID , TEL_DV_CD , TEL_NO )
VALUES( 'BBBBB' , '법인' , '02-5678-5555' ) ;

SELECT *
  FROM TB_MEMBER_TEL ;
  
  
  
  
-- MERGE 의 또 다른 예시를 보기위해 테이터를 복사 & 실행해주세요.

/*
DROP TABLE 직원;
DROP TABLE 직원_신입 ;
CREATE TABLE 직원 (
직원ID VARCHAR2(30) PRIMARY KEY ,
직원이름 VARCHAR2(50) NOT NULL ,
연봉 NUMBER NOT NULL
) ;
INSERT INTO 직원 VALUES ( 'A0001' , '김현명' , 4000) ;
INSERT INTO 직원 VALUES ( 'A0002' , '강태진' , 5000) ;
INSERT INTO 직원 VALUES ( 'A0003' , '손지창' , 5000) ;
CREATE TABLE 직원_신입 (
직원ID VARCHAR2(30) PRIMARY KEY ,
직원이름 VARCHAR2(50) NOT NULL ,
연봉 NUMBER NOT NULL
) ;
INSERT INTO 직원_신입 VALUES ( 'A0001' , '김현명' , 4000) ;
INSERT INTO 직원_신입 VALUES ( 'A0002' , '강태진' , 5000) ;
INSERT INTO 직원_신입 VALUES ( 'A0003' , '손지창' , 6000) ;
INSERT INTO 직원_신입 VALUES ( 'A0004' , '신입원' , 3400) ;
INSERT INTO 직원_신입 VALUES ( 'A0005' , '신입투' , 3400) ;
COMMIT ;
*/

SELECT * FROM 직원 ;
SELECT * FROM 직원_신입 ;




-- MERGE 실행


MERGE INTO 직원 A
USING 직원_신입 B
   ON ( A.직원ID = B.직원ID )
   
WHEN MATCHED THEN
UPDATE
   SET A.직원이름 = B.직원이름
     , A.연봉    = B.연봉
     
WHEN NOT MATCHED THEN
INSERT ( A.직원ID , A.직원이름 , A.연봉 )
VALUES ( B.직원ID , B.직원이름 , B.연봉 ) ;




-- 실습


MERGE INTO TB_MEMBER_TEL A
USING DUAL
   ON ( A.MEMBER_ID = 'EEEEE' AND TEL_DV_CD = '휴대폰' )
   
WHEN MATCHED THEN
UPDATE
   SET A.TEL_NO = '010-8888-8888'
   
WHEN NOT MATCHED THEN
INSERT ( A.MEMBER_ID ,A.TEL_DV_CD , A.TEL_NO )
VALUES ( 'EEEEE' , '휴대폰' , '010-8888-8888' ) ;

SELECT * FROM TB_MEMBER_TEL ;









--
--
-- 집합 연산자
-- 1. 집합연산자 문법 알아보기
-- 2. 집합연산자 종류와 예시
-- 3. 실습 문제 풀이




-- 집합연산자란?
-- 여러 SQL 결과를 위아래로 연결해 하나의 형태로 결합하는 문법
-- 벤다이어그램 ( 합집합, 교집합, 차집합 )




-- 예시


/* 테이블 생성
CREATE TABLE 뮤지컬예매내역 AS 
SELECT 1 AS 예매번호 , '뮤지컬A' AS 뮤지컬이름 , 50000 AS 뮤지컬가격 FROM DUAL UNION ALL 
SELECT 2 AS 예매번호 , '뮤지컬B' AS 뮤지컬이름 , 60000 AS 뮤지컬가격 FROM DUAL UNION ALL 
SELECT 3 AS 예매번호 , '뮤지컬C' AS 뮤지컬이름 , 70000 AS 뮤지컬가격 FROM DUAL UNION ALL 
SELECT 4 AS 예매번호 , '뮤지컬D' AS 뮤지컬이름 , 80000 AS 뮤지컬가격 FROM DUAL UNION ALL 
SELECT 5 AS 예매번호 , '뮤지컬E' AS 뮤지컬이름 , 90000 AS 뮤지컬가격 FROM DUAL ; 

CREATE TABLE 콘서트예매내역 AS 
SELECT 1 AS 예매번호 , '콘서트A' AS 콘서트이름 , 50000 AS 콘서트가격 FROM DUAL UNION ALL 
SELECT 2 AS 예매번호 , '콘서트B' AS 콘서트이름 , 60000 AS 콘서트가격 FROM DUAL UNION ALL 
SELECT 3 AS 예매번호 , '콘서트C' AS 콘서트이름 , 70000 AS 콘서트가격 FROM DUAL UNION ALL 
SELECT 4 AS 예매번호 , '콘서트D' AS 콘서트이름 , 80000 AS 콘서트가격 FROM DUAL UNION ALL 
SELECT 5 AS 예매번호 , '콘서트E' AS 콘서트이름 , 90000 AS 콘서트가격 FROM DUAL ; 

CREATE TABLE 극장예매내역 AS 
SELECT 1 AS 예매번호 , '극A' AS 극이름 , 50000 AS 극가격 FROM DUAL UNION ALL 
SELECT 2 AS 예매번호 , '극B' AS 극이름 , 60000 AS 극가격 FROM DUAL UNION ALL 
SELECT 3 AS 예매번호 , '극C' AS 극이름 , 70000 AS 극가격 FROM DUAL UNION ALL 
SELECT 4 AS 예매번호 , '극D' AS 극이름 , 80000 AS 극가격 FROM DUAL UNION ALL 
SELECT 5 AS 예매번호 , '극E' AS 극이름 , 90000 AS 극가격 FROM DUAL ; 

ALTER TABLE 뮤지컬예매내역 ADD ( 뮤지컬고유컬럼 VARCHAR2(10) ); 
ALTER TABLE 콘서트예매내역 ADD ( 콘서트고유컬럼 NUMBER ); 
ALTER TABLE 극장예매내역 ADD ( 극장고유컬럼 DATE ); 

UPDATE 뮤지컬예매내역 SET 뮤지컬고유컬럼 = '뮤' || ROWNUM ; 
UPDATE 콘서트예매내역 SET 콘서트고유컬럼 = ROWNUM ; 

COMMIT; 
*/


SELECT * FROM 뮤지컬예매내역;
SELECT * FROM 콘서트예매내역;
SELECT * FROM 극장예매내역;


SELECT 예매번호 , 뮤지컬이름 , 뮤지컬가격 -- 처음 작성한 컬럼 이름을 따라간다.
  FROM 뮤지컬예매내역
  
UNION ALL

SELECT 예매번호 , 콘서트이름 , 콘서트가격
  FROM 콘서트예매내역
  
UNION ALL
  
SELECT 예매번호 , 극이름 , 극가격
  FROM 극장예매내역 ;
  
  
  -- 컬럼 변경시 오류발생 1
  -- 컬럼 숫자, 문자형, 자료형이 안맞을 경우 오류발생


SELECT 예매번호 , 뮤지컬이름 , 뮤지컬가격 , 뮤지컬고유컬럼
  FROM 뮤지컬예매내역
  
UNION ALL

SELECT 예매번호 , 콘서트이름 , 콘서트가격 , 콘서트고유컬럼
  FROM 콘서트예매내역
  
UNION ALL
  
SELECT 예매번호 , 극이름 , 극가격 , 극장고유컬럼
  FROM 극장예매내역 ;
  
  
  
  
-- NULL 로 자료형을 일치시킴 


SELECT 예매번호 , 뮤지컬이름 , 뮤지컬가격 , NULL
  FROM 뮤지컬예매내역
  
UNION ALL

SELECT 예매번호 , 콘서트이름 , 콘서트가격 , 콘서트고유컬럼
  FROM 콘서트예매내역
  
UNION ALL
  
SELECT 예매번호 , 극이름 , 극가격 , NULL
  FROM 극장예매내역 ;
  
  
  
  
-- 실습 1번


SELECT * FROM 뮤지컬예매내역 ;

SELECT 예매번호
     , 뮤지컬이름 AS 공연이름
     , 뮤지컬가격 AS 공연가격
  FROM 뮤지컬예매내역
 WHERE 예매번호 >= 3
 
 UNION ALL -- 합집합 (중복포함, 정렬안함 ) 
 
SELECT 예매번호
     , 콘서트이름
     , 콘서트가격
  FROM 콘서트예매내역
 WHERE 예매번호 >= 3
 
 UNION ALL
 
SELECT 예매번호
     , 극이름
     , 극가격
  FROM 극장예매내역
 WHERE 예매번호 >= 3 ;
 
 
 
 
-- 풀이 ( 서브쿼리 사용시 )



SELECT *
  FROM (
                      
                    SELECT 예매번호
                         , 뮤지컬이름 AS 공연이름
                         , 뮤지컬가격 AS 공연가격
                      FROM 뮤지컬예매내역
                    -- WHERE 예매번호 >= 3
                     UNION ALL
                     
                    SELECT 예매번호
                         , 콘서트이름
                         , 콘서트가격
                      FROM 콘서트예매내역
                   --  WHERE 예매번호 >= 3
                     UNION ALL
                     
                    SELECT 예매번호
                         , 극이름
                         , 극가격
                      FROM 극장예매내역
                    -- WHERE 예매번호 >= 3
                    )
 WHERE 예매번호 >= 3 ;
 
 
 
 
-- 실습 2번


SELECT 뮤지컬가격 AS 공연가격
  FROM 뮤지컬예매내역
  
  UNION -- 중복제거와 정렬 
 
SELECT 콘서트가격
  FROM 콘서트예매내역 
  
  UNION
 
SELECT 극가격
  FROM 극장예매내역 ;
  
  
  
  
  
  
  
  
  
--
--
-- INDEX
-- 1. 인덱스 (INDEX) 란?
-- 2. 인덱스 (INDEX) 원리 이해하기
-- 3. NL (NESTED LOOP) 조인 이해하기
-- 4. 실습




-- 인덱스란 책에 있는 색인 혹은 목차처럼
-- 특정 데이터를 쉽게 찾을 수 있게 특정 기준으로
-- 정리해놓은 객체 




-- F10 ( 실행계획 ) 




-- 인텍스 생성


CREATE INDEX IDX_PRD ON TB_PRD ( PRD_TYPE ) ; 


SELECT ROWID
     , PRD_ID
     , PRD_NAME
     , PRD_TYPE
  FROM TB_PRD
 WHERE PRD_TYPE = '스마트폰' ; -- 인덱스 생성 후 실행 
 
 
 
 
-- 인덱스를 이용한 경우
-- WHERE 조건에 인덱스가 있는 컬럼이 사용되면
-- 인덱스 사용 가능 
-- 실행계획을 보면 INDEX RANGE SCAN 이 떠있음
-- 이것은 인덱스를 이용해서
-- 테이블의 특정 범위 데이터만 조회한 걸 의미합니다. 




-- 인덱스의 단점으로는 DML 성능이 감소하는 현상이 있음 
-- 값이 입력 / 수정 / 삭제 가 되면 
-- 인덱스도 똑같이 반영됩니다. 
-- ( 테이블 내용도 바뀌고 인덱스 내용도 바뀌고.. ) 
-- 대량의 데이터 조회에는 인덱스가 오히려 안좋음
-- 차라리 TABLE FULL SCAN 이 좋음 
 
 
 
 
-- NL ( Nested Loop ) 조인
-- 실제로 조인이 어떻게 발생하는지 물리적인 관점에서 보는 것으로
-- 인덱스가 있을 때만 쓸 수 있는 기법
-- 이 외에도 Hash Join , Sort Merge Join 이 있지만
-- 대부분 웹사이트에서 쓰는 방식은 NL 조인 방식 

-- 원리 : 중첩 반복문 처럼 사용 
-- 장점 : 인덱스를 활용 , 랜덤 액세스를 통해 소량의 데이터 추출 가능
-- 대부분의 웹사이트에서는 NL 조인을 주로 활용하여 활용도가 높다. 
-- 단점 : 인덱스가 있어야만 사용할 수 있다. 
-- 소량의 데이터가 아니라면 NL 조인은 매우 비효율적이다. 


SELECT /*+ RULE */ A.MEMBER_ID -- 실행계획 직접 제어 
     , A.MEMBER_NAME
     , A.GRADE_CD
     , B.GRADE_NAME
  FROM TB_MEMBER A
     , TB_GRADE B
 WHERE A.GRADE_CD = B.GRADE_CD ;
 
 
 
 
/*
DROP TABLE TB_TEST1 ;
DROP TABLE TB_TEST2 ;
--150만건 임시데이터 생성하기
CREATE TABLE TB_TEST1 (
COL1 NUMBER NOT NULL , COL2 NUMBER NOT NULL , COL3 NUMBER NOT NULL , COL4 NUMBER NOT NULL );
INSERT INTO TB_TEST1
SELECT /*+ APPEND */ LEVEL AS COL1 , LEVEL AS COL2 , LEVEL AS COL3 , LEVEL AS COL4
FROM DUAL
CONNECT BY LEVEL <= 1500000 ;
COMMIT;
--50만건 임시데이터 생성하기
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
 WHERE A.COL1 = B.COL1 ; -- 대량 건 조회시 느림 
 
 
CREATE INDEX IDX_TEST2 ON TB_TEST2 (COL1) ; -- 인덱스 생성 


DROP INDEX IDX_TEST2 ; -- 인덱스 삭제 후 실행시 다시 느려짐 




-- PK 생성시 기본 인덱스가 자동으로 생성됩니다. 
-- 테이블에서 5% 이상이면 FULL SCAN 이 낫고
-- 테이블에서 5% 미만이면 INDEX 생성 후 조회가 낫다. 




