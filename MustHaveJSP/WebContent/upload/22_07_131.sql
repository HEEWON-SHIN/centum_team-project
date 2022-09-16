--���̺� ����
DROP TABLE EMP_TEMP10;

--EMP���̺��� ���� ������ �����ؼ� EMP_TEMP�����
--����! WHERE������ 1<>1�� ���� ���ǽĿ� ������ ������� �׻� FALSE�� �Ǿ�
--��������� ���� ��������� �ʴ´�.
--���ϰ� ���̺� �� ������ ���� ���̺��� �������� ��� �����ϰ� ����� �� �ִ�.
CREATE TABLE EMP_TEMP
AS SELECT * FROM EMP WHERE 1 <> 1;

--EMP_TEMP���̺� ��ȸ
SELECT * FROM EMP_TEMP;

--������ EMP_TEMP���̺� ��¥ �����͸� ���� �ֱ�
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (9999, 'ȫ�浿', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);

--��¥ �����͸� YYYY-MM-DD �������ε� �Է��� �� �ִ�.
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (1111, '������', 'MANAGER', 9999, '2001-01-05', 4000, NULL, 20);

--��¥ �����͸� �Է��� �� ������
--�� / �� / �� ������ �ݴ�� �Է��ϸ� ������ �߻��ؼ� �����Ͱ� �߰����� �ʴ´�.
--INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
--VALUES (2111, '�̼���', 'MANAGER', 9999, '07-01-2001', 4000, NULL, 20);

--��¥ �����͸� INSERT������ �Է��� �� ���ڿ��� ��¥�� �Է����� �ʰ�
--TO DATE�Լ��� ����ϴ� ���� ����.
--�ڡڡ�TO_DATE�Լ��� String�ڷ��� Ÿ���� ��¥�� DATE�ڷ��� Ÿ������ ��ȯ�ؼ� ��ȯ���ش�.
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (2111, '�̼���', 'MANAGER', 9999, TO_DATE('07/01/2001', 'DD/MM/YYYY'), 4000, NULL, 20);

DESC EMP_TEMP;

--�ڡڡڡڡ�SYSDATEŰ���带 ����Ͽ� ��¥ ������ ���̺� �Է��ϱ�
--���� �������� ��¥�� �Է��� ��� ����ϴ� Ű����
--����� MYSQL������ NOW()�Լ� ���
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (3111, '��û��', 'MANAGER', 9999, SYSDATE, 4000, NULL, 20);


--����
--INSERT���� ���������� ����ϸ� SELECT������ ��ȸ�� ����� �ѹ��� ���̺� �߰��� �� �ִ�.
--���� ��� EMP���̺��� SALGRADE���̺��� �����Ͽ� �޿������ 1�� �����
--EMP_TEMP���̺� ����ְ� �ʹٸ�, ���������� ������ INSERT���� �ۼ��ؾ� �Ѵ�.
--���������� ����Ͽ� �ѹ��� ������ �����͸� ���̺� �߰� �Է��ϱ�
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
--EMP, SALGRADE���̺��� �����Ͽ� �ּұ޿��� �ִ�޿� ���̿� �ִ� ��� �߿��� 
--�޿� ����� 1�� ����� ��ȸ
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
    AND S.GRADE =1;
    
COMMIT;

--���� : ���̺� �ִ� ������ �����ϱ�

--�ǽ��� ���� DEPT���̺��� ������ DEPT_TEMP2 �����
CREATE TABLE DEPT_TEMP2 AS SELECT * FROM DEPT;

--���̺� �ִ� �����͸� �����ϴ� SQL�� UPDATE��
--���� 
--: UPDATE ������ ���̺� SET ������ ���̸�1 = ������ ��, ������ ���̸�2 = ������ ��
--  WHERE ���� ������ ��� ���� �����ϱ� ���� ����;

--DEPT_TEMP2���̺� �ִ� ��ü ������ ����
UPDATE DEPT_TEMP2 SET LOC = 'SEOUL';

SELECT * FROM DEPT_TEMP2;

--UPDATE������ ����ϱ� ������ �� �����͸� �ǵ����ִ� Ű����,,COMMIT ������ �ǵ��� �� ����
--� ��ɾ�� ������ ������ �ǵ����� ���� �� ���!
ROLLBACK;

--������ �Ϻκи� �����ϱ�
--DEPT_TEMP2���̺� ����� 40�� �μ��� �μ� �̸��� DATABASE�� �����ϰ�, ������ SEOUL�� ����
UPDATE DEPT_TEMP2 SET DNAME = 'DATABASE', LOC = 'SEOUL'
WHERE DEPTNO = 40;

--EMP_TEMP���̺��� ����� �߿��� �޿��� 2500������ ����� �߰� ������ 50���� �����Ͻÿ�
UPDATE EMP_TEMP SET COMM =50
WHERE SAL<=2500;

COMMIT;


--DEPT_TEMP2���̺� �ִ� ������(��, ���ڵ�) �߿��� 40�� �μ��� �μ���� �μ���ġ��
--DEPT���̺��� 40�� �μ� �μ���� �μ���ġ�� ��ȸ�ؼ� �� ������ ������.
--                SET (DNAME, LOC) = OPERATIONS	BOSTON <- �������� ��ȸ���� ������� �Էµ�
UPDATE DEPT_TEMP2 SET (DNAME, LOC) = 
    (SELECT DNAME, LOC FROM DEPT WHERE DEPTNO = 40)
    WHERE DEPTNO = 40;
    
--�� �ϳ��ϳ��� �����ϴ� ���
--���������� ������ �Ϻκ� ����
UPDATE DEPT_TEMP2 
    SET DNAME = (SELECT DNAME FROM DEPT WHERE DEPTNO=40),
        LOC  = (SELECT LOC FROM DEPT WHERE DEPTNO=40)
    WHERE DEPTNO = 40;

--�ǽ� 10-21
UPDATE DEPT_TEMP2 SET LOC='SEOUL'
    WHERE DEPTNO = (SELECT DEPTNO FROM DEPT_TEMP2 WHERE DNAME='OPERATIONS');

SELECT * FROM DEPT_TEMP2;


--���� : ���̺� �ִ� ��(������, ���ڵ�) ������ ���� DELETE��
--�ǽ��� ���� EMP���̺��� �����ؼ� EMP_TEMP2 �����
CREATE TABLE EMP_TEMP2 AS SELECT * FROM EMP;

SELECT * FROM EMP_TEMP2;

--DELETE�� �⺻����
--DELETE FROM ���̺� �̸� WHERE ������ ��� ���� �����ϱ� ���� ���ǽ�;

--EMP_TEMP2���̺��� ��å�� MANAGER�� ����鸸 ����
DELETE FROM EMP_TEMP2 WHERE JOB = 'MANAGER';

--���������� �̿��Ͽ� ������ ����
--�޿� ����� 3���(�ּұ޿� 1401�̰� �ִ�޿��� 2000 ���̿� �ִ�)�̰� 30�� �μ��� ����鸸 ����
DELETE FROM EMP_TEMP2
WHERE EMPNO IN (
SELECT E.EMPNO FROM EMP_TEMP2 E, SALGRADE S
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
        AND S.GRADE=3
        AND DEPTNO=30);


--EMP_TEMP���̺��� �޿��� 3000�̻��� ����� �����Ͻÿ�
DELETE FROM EMP_TEMP
WHERE SAL>=3000;

--EMP_TEMP���̺� ����� ��� ������(��, ���ڵ�) ����
DELETE FROM EMP_TEMP;

SELECT * FROM EMP_TEMP;

--����1
CREATE TABLE CHAP10HW_EMP AS SELECT * FROM EMP;
CREATE TABLE CHAP10HW_DEPT AS SELECT * FROM DEPT;
CREATE TABLE CHAP10HW_SALGRADE AS SELECT * FROM SALGRADE;

SELECT * FROM CHAP10HW_EMP;
SELECT * FROM CHAP10HW_DEPT;
SELECT * FROM CHAP10HW_SALGRADE;

DELETE FROM CHAP10HW_EMP;
DELETE FROM CHAP10HW_DEPT;
DELETE FROM CHAP10HW_SALGRADE;

--�ѹ��� �������� �����ϴ� INSERT ALL INTO �������� DUAL�� ���� ���̺��̴�.
INSERT ALL
    INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC) VALUES (50, 'ORACLE', 'BUSAN')
    INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC) VALUES (60, 'SQL', 'ILSAN')
    INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC) VALUES (70, 'SELECT', 'INCHEON')
    INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC) VALUES (80, 'DML', 'BUNDANG')
   SELECT * FROM DUAL; 
   
   
--���� 3
UPDATE CHAP10HW_EMP SET DEPTNO =70
     WHERE SAL > (SELECT AVG(SAL) FROM CHAP10HW_EMP WHERE DEPTNO=50);
    
--���� 2��,,INSERT ALL INTO ���� �ۼ��� ������� �� �Է��ϸ� ���̸��� ���� ����
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
    

    
--���� 4
UPDATE CHAP10HW_EMP SET DEPTNO = 80, SAL = SAL*1.1
    WHERE HIREDATE > 
        (SELECT MIN(HIREDATE) FROM CHAP10HW_EMP WHERE DEPTNO=60);

ROLLBACK;











