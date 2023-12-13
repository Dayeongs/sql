/*
������ SQL���� ����
    �������� : WHERE���̳� HAVING������ ���ǽĿ� ���Ǵ� ���� �����ϴ� SQL��
    �ζ��κ� : FROM������ ������ ���̺�(������ ���̺��� ���� ���� �Ѵ�.)�� �����ϴ� SQL�� 
    ��Į�� �������� : SELECT������ ���Ǵ� ����������. ���� ���� �ϳ��� ��ȯ�Ѵ�.
    -------------------------------------------------------------------------> ������ SQL���� ���������� ������ ����. *����)
    ��ȣ���� �������� : ������ SQL������ ���������� �÷��� �����ϴ� ����������.

��������(SUB QUERY)
    SELECT�� ���ο� ���ǵ� SELECT���� ����������� �Ѵ�.
    ���������� WHERE���� ���ǽĿ��� ���Ǵ� ���� �����Ѵ�.
    * �� ��쿡 ���ǽĿ��� ���Ǵ� ���� SQL�� �����ؾ߸� ȹ�氡���� ���� ��찡 ����.
    
    ����
        SELECT �÷�, �÷�
        FROM ���̺��
        WHERE �÷��� ������ (SELECT �÷�
                           FROM ���̺��
                           [WHERE ���ǽ�])                   
    Ư¡
        �ѹ��� ����ȴ�.
        ���� �������� ���� ����ȴ�.
        ���� ������ �������� ���� ������ ���ǽĿ��� ���ȴ�.
    ���ǻ���
        ���������� �ݵ�� ��ȣ�ȿ� �ۼ��Ѵ�.
        ���������� ���ǽ��� �����ʿ� ��ġ���Ѽ� �������� ���δ�.
        ���������� �������� ���������� ���������� �����ؼ� ������ �����ڸ� ����Ѵ�.
*/

-- ��ü ������ ��ձ޿����� �޿��� ���� �޴� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > ��ձ޿�;   -- ��ձ޿��� �����ϴ� ���������� �ʿ��Ѵ�.

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY)
                FROM EMPLOYEES);
                
-- B����� �ְ�޿����� �޿��� ���Թ޴� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�   
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < B����� �ְ�޿�; 

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < (SELECT MAX_SALARY
                 FROM SALARY_GRADES
                 WHERE GRADE = 'B');
                
-- 60���μ��� ������ ���� �ؿ� �Ի��� �������� ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY')IN (SELECT DISTINCT TO_CHAR(HIRE_DATE, 'YYYY')
                                    FROM EMPLOYEES
                                    WHERE DEPARTMENT_ID = 60);
                                    
/*
���������� ����
    - ������ ��������
        �������� �������� �� ���� ȹ��ȴ�.(1��1�� �����͸� ��ȯ�Ѵ� ��������)
        ������
            =, !=, >, >=, <, <=, IN, NOT IN
    - ������ ��������
        �������� �������� ���� ���� ȹ��ȴ�.(N��1�� �����͸� ��ȯ�ϴ� ��������)
        ������
            IN, NOT IN, > ANY, > ALL, >= ANY, >= ALL
                        < ANY, < ALL, <= ANY, <= ALL
    - ���߿� �������� 
        �������� �������� ���� ���� �÷����� ȹ��ȴ�.(N��N�� �����͸� ��ȯ�ϴ� ��������)
        ������
            IN, NOT IN
*/

-- ������ ��������
-- 101�� ������� ���� �޴� ���� ���� ��翡�� �����ϴ� ������ ���̵�, �̸��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE MANAGER_ID = (SELECT MANAGER_ID
                    FROM EMPLOYEES
                    WHERE EMPLOYEE_ID = 101);
 
 -- 101�� ������� �޿��� ���� �޴� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�
 SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
 FROM EMPLOYEES
 WHERE SALARY > (SELECT SALARY
                 FROM EMPLOYEES
                 WHERE EMPLOYEE_ID = 101);

-- ������ ��������                 
-- 'Steven'�� ���� �ؿ� �Ի��� ������ ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') IN (SELECT TO_CHAR(HIRE_DATE, 'YYYY')
                                     FROM EMPLOYEES
                                     WHERE FIRST_NAME = 'Steven');
 
-- 60�� �μ��� �Ҽӵ� �������� �޿����� �޿��� ���� �޴� �������� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > ANY (SELECT SALARY
                    FROM EMPLOYEES
                    WHERE DEPARTMENT_ID = 60);

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT MIN(SALARY)
                FROM EMPLOYEES
                WHERE DEPARTMENT_ID = 60);
 
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > ALL (SELECT SALARY
                    FROM EMPLOYEES
                    WHERE DEPARTMENT_ID = 60);
                    
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT MAX(SALARY)
                FROM EMPLOYEES
                WHERE DEPARTMENT_ID = 60);
 
-- ���߿� ��������
-- �� �μ��� ���� �޿��� �޴� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE (DEPARTMENT_ID, SALARY) IN (SELECT DEPARTMENT_ID, MIN(SALARY)
                                  FROM EMPLOYEES
                                  WHERE DEPARTMENT_ID IS NOT NULL
                                  GROUP BY DEPARTMENT_ID);
 
/*
��ȣ���� ��������
    ������������ ���������� �÷��� �����ϸ� ��ȣ���� ���������� �ȴ�.
    ����
        SELECT OUTER.COLUMN, OUTER.COLUMN
        FROM TABLE OUTER
        WHERE OUTER.COLUMN ������ (SELECT INNER.COLUMN
                                  FROM TABLE INNER
                                  WHERE INNER.COLUMN = OUTER.COLUMN)
                                  * INNER�� ���� ��ȣ �ȿ����� ��밡���ϴ�. �������������� ����� �� ����.
    �Ϲ� ���������� ��ȣ���� ���������� �ٸ���
        ���������� ������������ ���� ����ȴ�.
        ���������� �� �ѹ� ����ȴ�.
        
        ��ȣ���� ���������� �������������� ó���Ǵ� �� �࿡ ���ؼ� �ѹ��� ����ȴ�. (������ ����ȴ�.)
        
*/

-- ������ �߿��� �ڽ��� �Ҽӵ� �μ��� ��ձ޿����� �޿��� ���� �޴� ����� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT X.EMPLOYEE_ID, X.FIRST_NAME, X.SALARY
FROM EMPLOYEES X
WHERE X.SALARY > (SELECT AVG(Y.SALARY)
                  FROM EMPLOYEES Y
                  WHERE Y.DEPARTMENT_ID = X.DEPARTMENT_ID);
--                * X�� �μ���ȣ�� �ش��ϴ� �μ��� ��ձ޿��� ���                  
--                * �� �ึ�� ���������� ����ǹǷ� 
--                  �� ���� ����ɶ����� ���������� X.DEPARTMENT_ID�� ��� ���Ѵ�.

-- �μ����̵�, �μ��̸�, �ش� �μ��� �Ҽӵ� �������� ��ȸ�ϱ�
SELECT X.DEPARTMENT_ID, X.DEPARTMENT_NAME,
       (SELECT COUNT(*)
        FROM EMPLOYEES Y
        WHERE Y.DEPARTMENT_ID = X.DEPARTMENT_ID) CNT
FROM DEPARTMENTS X;
-- COUNT(*)�� ����ϸ� GROUP BY�� ����ؾ��ϹǷ� SELECT���� ���������� ����Ͽ� �������� ��ȸ

-- �������̵�, �����̸�, ����� ���̵�, ����� �̸��� ��ȸ�ϱ�
SELECT X.EMPLOYEE_ID                        EMP_ID, 
       X.FIRST_NAME                         EMP_NAME,
       X.MANAGER_ID                         MGR_ID, 
       (SELECT Y.FIRST_NAME
        FROM EMPLOYEES Y
        WHERE Y.EMPLOYEE_ID = X.MANAGER_ID) MGR_NAME
FROM EMPLOYEES X;
-- ������ 107���̹Ƿ� ���������� 107�� ����Ǿ� ȿ�������� �ʴ�.
-- ��ȸ�� ���� ������ŭ ���������� ����ǹǷ� ������ ��������.


                
