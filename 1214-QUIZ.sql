-- ��� ������ ���̵�, �̸�, �μ���ȣ, �μ����� ��ȸ�ϱ�(�����)
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, 
       E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+);

-- Ŀ�̼��� �޴� ������ ���̵�, �̸�, �������̵�, �޿�, Ŀ�̼��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

-- Ŀ�̼��� �޴� ������ ���̵�, �̸�, �޿�, Ŀ�̼�, �޿������ ��ȸ�ϱ�(������)
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY, E.COMMISSION_PCT, G.GRADE
FROM EMPLOYEES E, SALARY_GRADES G
WHERE E.COMMISSION_PCT IS NOT NULL
AND E.SALARY >= G.MIN_SALARY AND E.SALARY <= MAX_SALARY;

-- 80�� �μ��� �Ҽӵ� �������� ��ձ޿�, �����޿�, �ְ��޿��� ��ȸ�ϱ�(�׷��Լ�)
SELECT TRUNC(AVG(SALARY)) AVG_SALARY, 
       MIN(SALARY) MIN_SALARY, 
       MAX(SALARY) MAX_SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;

-- 80�� �μ��� �Ҽӵ� �������� �������̵�, �̸�, ��������, �޿�, ������ �ְ��޿��� �޿����� ���̸� ��ȸ�ϱ�(�����)
SELECT E.EMPLOYEE_ID, 
       E.FIRST_NAME, 
       J.JOB_TITLE, 
       E.SALARY, 
       J.MAX_SALARY - E.SALARY SALARY_GAP
FROM EMPLOYEES E, JOBS J
WHERE E.DEPARTMENT_ID = 80
AND E.JOB_ID = J.JOB_ID;

-- �� �μ��� �ְ��޿�, �����޿�, �ְ��޿��� �����޿��� ���̸� ��ȸ�ϱ�(GROUP BY)
SELECT DEPARTMENT_ID, 
       MIN(SALARY) MIN_SALARY, 
       MAX(SALARY) MAX_SALARY, 
       MAX(SALARY)-MIN(SALARY) SALARY_GAP
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID;

SELECT DEPARTMENT_ID, MAX_SALARY, MIN_SALARY, MAX_SALARY - MIN_SALARY
FROM (SELECT DEPARTMENT_ID, MIN(SALARY) MIN_SALARY, MAX(SALARY) MAX_SALARY
      FROM EMPLOYEES
      WHERE DEPARTMENT_ID IS NOT NULL
      GROUP BY DEPARTMENT_ID);

-- 'Executive' �μ��� ��� �������̵�, �̸�, �������̵� ��ȸ�ϱ�(�������� Ȥ�� ����)
-- ��������
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'Executive');
-- ����                 
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE D.DEPARTMENT_NAME = 'Executive'
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- ��ü ������ ��ձ޿����� �޿��� ���� �޴� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�(��������)
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < (SELECT AVG(SALARY)
                FROM EMPLOYEES);

-- 'Ismael'�� ���� �ؿ� �Ի��߰�, ���� �μ��� �ٹ��ϰ� �ִ� ������ ���̵�, �̸�, �Ի����� ��ȸ�ϱ�(��������)
-- ���߿� ��������
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE (TO_CHAR(HIRE_DATE, 'YYYY'), DEPARTMENT_ID) IN (SELECT TO_CHAR(HIRE_DATE, 'YYYY'), DEPARTMENT_ID
                                                      FROM EMPLOYEES
                                                      WHERE FIRST_NAME = 'Ismael');
-- ������ ��������
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE (TO_CHAR(HIRE_DATE, 'YYYY')) IN (SELECT TO_CHAR(HIRE_DATE, 'YYYY')
                                       FROM EMPLOYEES
                                       WHERE FIRST_NAME = 'Ismael')
AND DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                     FROM EMPLOYEES
                     WHERE FIRST_NAME = 'Ismael');

-- �μ��� �ְ��޿��� ��ȸ���� �� �ְ��޿��� 15000�� �Ѵ� �μ��� ���̵�� �ְ��޿��� ��ȸ�ϱ�(GROUP BY, HAVING)
SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY) > 15000;

-- 'Neena'���� �޿��� ���� �޴� ������ ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�(��������)
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT SALARY
                FROM EMPLOYEES
                WHERE FIRST_NAME = 'Neena');

-- �޿���޺��� �������� ��ȸ�ϱ�(������, GROUP BY)
SELECT G.GRADE, COUNT(*)
FROM EMPLOYEES E, SALARY_GRADES G
WHERE E.SALARY >= G.MIN_SALARY AND E.SALARY <= G.MAX_SALARY
GROUP BY G.GRADE;

-- �μ��� ��ձ޿��� ������� �� �μ��� ��ձ޿����� �޿��� ���� �޴� ������ ���̵�, �̸�, �޿�, �μ����� ��ȸ�ϱ�(�ζ��κ�, ����)
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D,(SELECT DEPARTMENT_ID,
                                        AVG(SALARY) AVG_SALARY
                                 FROM EMPLOYEES
                                 WHERE DEPARTMENT_ID IS NOT NULL
                                 GROUP BY DEPARTMENT_ID) A
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND E.DEPARTMENT_ID = A.DEPARTMENT_ID
AND E.SALARY < A.AVG_SALARY;

-- 'Ismael' ������ �ٹ��ϴ� �μ��� ���̵�� �̸��� ��ȸ�ϱ�(��������)
-- ��������
-- ��ȸ����(�̸�)�� ������ ���� �ƴϱ⶧���� IN�� ����Ѵ�. (���������� ���� �� �ִ�.)
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM EMPLOYEES
                        WHERE FIRST_NAME = 'Ismael');

-- ����
SELECT E.FIRST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.FIRST_NAME = 'Ismael'
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 'Neena'���� �����ϴ� ������ ���̵�� �̸��� ��ȸ�ϱ�(��������)
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE MANAGER_ID = (SELECT EMPLOYEE_ID
                    FROM EMPLOYEES
                    WHERE FIRST_NAME = 'Neena');

-- �μ��� ��ձ޿��� ������� �� 'Ismael'�� �ٹ��ϴ� �μ��� ��ձ޿����� �޿��� ���� �޴� �μ��� 
-- �μ� ���̵�� ��ձ޿��� ��ȸ�ϱ�(GROUP BY, HAVING, ��������)
SELECT DEPARTMENT_ID, AVG(SALARY) AVG_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) > (SELECT AVG(SALARY)
                      FROM EMPLOYEES
                      WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                                             FROM EMPLOYEES
                                             WHERE FIRST_NAME = 'Ismael'));