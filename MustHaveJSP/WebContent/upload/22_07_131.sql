--테이블 삭제
DROP TABLE EMP_TEMP10;

--EMP테이블의 열의 구조만 복사해서 EMP_TEMP만들기
--참고! WHERE조건절 1<>1은 행을 조건식에 대입한 결과값이 항상 FALSE가 되어
--결과적으로 행은 만들어지지 않는다.
--급하게 테이블 열 구조만 같은 테이블을 만들어야할 경우 유용하게 사용할 수 있다.
CREATE TABLE EMP_TEMP
AS SELECT * FROM EMP WHERE 1 <> 1;

--EMP_TEMP테이블 조회
SELECT * FROM EMP_TEMP;

--복사한 EMP_TEMP테이블에 날짜 데이터를 같이 넣기
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (9999, '홍길동', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);

--날짜 데이터를 YYYY-MM-DD 형식으로도 입력할 수 있다.
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (1111, '성춘향', 'MANAGER', 9999, '2001-01-05', 4000, NULL, 20);

--날짜 데이터를 입력할 때 유의점
--년 / 월 / 일 순서와 반대로 입력하면 오류가 발생해서 데이터가 추가되지 않는다.
--INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
--VALUES (2111, '이순신', 'MANAGER', 9999, '07-01-2001', 4000, NULL, 20);

--날짜 데이터를 INSERT문으로 입력할 때 문자열로 날짜를 입력하지 않고
--TO DATE함수를 사용하는 것이 좋다.
--★★★TO_DATE함수는 String자료형 타입의 날짜를 DATE자료형 타입으로 변환해서 반환해준다.
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (2111, '이순신', 'MANAGER', 9999, TO_DATE('07/01/2001', 'DD/MM/YYYY'), 4000, NULL, 20);

DESC EMP_TEMP;

--★★★★★SYSDATE키워드를 사용하여 날짜 데이터 테이블에 입력하기
--현재 시점으로 날짜를 입력할 경우 사용하는 키워드
--참고로 MYSQL에서는 NOW()함수 사용
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (3111, '심청이', 'MANAGER', 9999, SYSDATE, 4000, NULL, 20);


--참고
--INSERT문에 서브쿼리를 사용하면 SELECT문으로 조회된 행들을 한번에 테이블에 추가할 수 있다.
--예를 들어 EMP테이블에서 SALGRADE테이블을 참조하여 급여등급이 1인 사원만
--EMP_TEMP테이블에 집어넣고 싶다면, 서브쿼리를 포함한 INSERT문을 작성해야 한다.
--서브쿼리를 사용하여 한번에 여러행 데이터를 테이블에 추가 입력하기
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
--EMP, SALGRADE테이블을 조인하여 최소급여와 최대급여 사이에 있는 사원 중에서 
--급여 등급인 1인 사원을 조회
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
    AND S.GRADE =1;
    
COMMIT;

--주제 : 테이블에 있는 데이터 수정하기

--실습을 위해 DEPT테이블을 복사해 DEPT_TEMP2 만들기
CREATE TABLE DEPT_TEMP2 AS SELECT * FROM DEPT;

--테이블에 있는 데이터를 수정하는 SQL의 UPDATE문
--문법 
--: UPDATE 변경할 테이블 SET 변경할 열이름1 = 변경할 값, 변경할 열이름2 = 변경할 값
--  WHERE 값을 변경할 대상 행을 선별하기 위한 조건;

--DEPT_TEMP2테이블에 있는 전체 데이터 수정
UPDATE DEPT_TEMP2 SET LOC = 'SEOUL';

SELECT * FROM DEPT_TEMP2;

--UPDATE구문을 사용하기 전으로 행 데이터를 되돌려주는 키워드,,COMMIT 전에만 되돌릴 수 있음
--어떤 명령어든 수정한 내용을 되돌리고 싶을 때 사용!
ROLLBACK;

--데이터 일부분만 수정하기
--DEPT_TEMP2테이블에 저장된 40번 부서의 부서 이름을 DATABASE로 수정하고, 지역을 SEOUL로 수정
UPDATE DEPT_TEMP2 SET DNAME = 'DATABASE', LOC = 'SEOUL'
WHERE DEPTNO = 40;

--EMP_TEMP테이블의 사원들 중에서 급여가 2500이하인 사원만 추가 수당을 50으로 수정하시오
UPDATE EMP_TEMP SET COMM =50
WHERE SAL<=2500;

COMMIT;


--DEPT_TEMP2테이블에 있는 데이터(행, 레코드) 중에서 40번 부서의 부서명과 부서위치를
--DEPT테이블의 40번 부서 부서명과 부서위치를 조회해서 그 값으로 수정함.
--                SET (DNAME, LOC) = OPERATIONS	BOSTON <- 서브쿼리 조회값이 순서대로 입력됨
UPDATE DEPT_TEMP2 SET (DNAME, LOC) = 
    (SELECT DNAME, LOC FROM DEPT WHERE DEPTNO = 40)
    WHERE DEPTNO = 40;
    
--열 하나하나를 수정하는 경우
--서브쿼리로 데이터 일부분 수정
UPDATE DEPT_TEMP2 
    SET DNAME = (SELECT DNAME FROM DEPT WHERE DEPTNO=40),
        LOC  = (SELECT LOC FROM DEPT WHERE DEPTNO=40)
    WHERE DEPTNO = 40;

--실습 10-21
UPDATE DEPT_TEMP2 SET LOC='SEOUL'
    WHERE DEPTNO = (SELECT DEPTNO FROM DEPT_TEMP2 WHERE DNAME='OPERATIONS');

SELECT * FROM DEPT_TEMP2;


--주제 : 테이블에 있는 행(데이터, 레코드) 삭제를 위한 DELETE문
--실습을 위한 EMP테이블을 복사해서 EMP_TEMP2 만들기
CREATE TABLE EMP_TEMP2 AS SELECT * FROM EMP;

SELECT * FROM EMP_TEMP2;

--DELETE문 기본문법
--DELETE FROM 테이블 이름 WHERE 삭제할 대상 행을 선별하기 위한 조건식;

--EMP_TEMP2테이블에서 직책이 MANAGER인 사원들만 삭제
DELETE FROM EMP_TEMP2 WHERE JOB = 'MANAGER';

--서브쿼리를 이용하여 데이터 삭제
--급여 등급이 3등급(최소급여 1401이고 최대급여가 2000 사이에 있는)이고 30번 부서의 사원들만 삭제
DELETE FROM EMP_TEMP2
WHERE EMPNO IN (
SELECT E.EMPNO FROM EMP_TEMP2 E, SALGRADE S
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
        AND S.GRADE=3
        AND DEPTNO=30);


--EMP_TEMP테이블에서 급여가 3000이상인 사원을 삭제하시오
DELETE FROM EMP_TEMP
WHERE SAL>=3000;

--EMP_TEMP테이블에 저장된 모든 데이터(행, 레코드) 삭제
DELETE FROM EMP_TEMP;

SELECT * FROM EMP_TEMP;

--문제1
CREATE TABLE CHAP10HW_EMP AS SELECT * FROM EMP;
CREATE TABLE CHAP10HW_DEPT AS SELECT * FROM DEPT;
CREATE TABLE CHAP10HW_SALGRADE AS SELECT * FROM SALGRADE;

SELECT * FROM CHAP10HW_EMP;
SELECT * FROM CHAP10HW_DEPT;
SELECT * FROM CHAP10HW_SALGRADE;

DELETE FROM CHAP10HW_EMP;
DELETE FROM CHAP10HW_DEPT;
DELETE FROM CHAP10HW_SALGRADE;

--한번에 여러행을 삽입하는 INSERT ALL INTO 구문에서 DUAL은 가상 테이블이다.
INSERT ALL
    INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC) VALUES (50, 'ORACLE', 'BUSAN')
    INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC) VALUES (60, 'SQL', 'ILSAN')
    INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC) VALUES (70, 'SELECT', 'INCHEON')
    INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC) VALUES (80, 'DML', 'BUNDANG')
   SELECT * FROM DUAL; 
   
   
--문제 3
UPDATE CHAP10HW_EMP SET DEPTNO =70
     WHERE SAL > (SELECT AVG(SAL) FROM CHAP10HW_EMP WHERE DEPTNO=50);
    
--문제 2번,,INSERT ALL INTO 구문 작성시 순서대로 값 입력하면 열이름은 생략 가능
INSERT ALL
    INTO CHAP10HW_EMP VALUES (7201, 'TEST_USER1', 'MANAGER', 7788, '2016-01-02', 4500, NULL, 50)
    INTO CHAP10HW_EMP VALUES (7202, 'TEST_USER2', 'CLERK', 7201, '2016-02-21', 1800, NULL, 50)
    INTO CHAP10HW_EMP VALUES (7203, 'TEST_USER3', 'ANALYST', 7201, '2016-04-11', 3400, NULL, 60)       
    INTO CHAP10HW_EMP VALUES (7204, 'TEST_USER4', 'SALESMAN', 7201, '2016-05-31', 2700, 300, 60)       
    INTO CHAP10HW_EMP VALUES (7205, 'TEST_USER5', 'CLERK', 7201, '2016-07-20', 2600, NULL, 70)    
    INTO CHAP10HW_EMP VALUES (7206, 'TEST_USER6', 'CLERK', 7201, '2016-09-08', 2600, NULL, 70)        
    INTO CHAP10HW_EMP VALUES (7207, 'TEST_USER7', 'LECTURER', 7201, '2016-10-28', 2300, NULL, 80)        
    INTO CHAP10HW_EMP VALUES (7208, 'TEST_USER8', 'STUDENT', 7201, '2018-03-09', 1200, NULL, 80)
    SELECT * FROM DUAL;
    

    
--문제 4
UPDATE CHAP10HW_EMP SET DEPTNO = 80, SAL = SAL*1.1
    WHERE HIREDATE > 
        (SELECT MIN(HIREDATE) FROM CHAP10HW_EMP WHERE DEPTNO=60);

ROLLBACK;











