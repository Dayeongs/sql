/*
������ ����
    ���̺� ������ �����Ͱ� �����ϴ� ��� �� �����͸� ��ȸ�ϱ� ���ؼ� ����ϴ� ������.
    * ������ �����Ͷ� ������ ���̺� ���������� ������ ���� ������ ���Ե� �����ʹ�.
    * ����) �������̺� ����� ������
           ���������̺��� ���������� ��������
           �޴����̺��� �����޴� �����޴�
           ī�װ����̺��� ����ī�װ��� ����ī�װ�
           
    ����
        SELECT �÷���, �÷���, ...
        FROM ���̺��
        [WHERE ���ǽ�]
        START WITH ���ǽ�
        CONNECT BY PRIOR ���ǽ�;
        
        * START WITH : ���� �˻��� ���������� �����Ѵ�.
        * CONNECT BY : �θ���� �ڽ��� ���� ���谡 �ִ� �÷��� �����Ѵ�.
            CONNECT BY PRIOR �θ�Ű(�⺻Ű) = �ڽ�Ű(�ܷ�Ű)
                ������������ �θ� -> �ڽ� �������� �������� ������ �˻�
            CONNECT BY PRIOR �ڽ�Ű(�ܷ�Ű) = �θ�Ű(�⺻Ű)
                ������������ �ڽ� -> �θ� �������� �������� ������ �˻� 
*/

-- ������ �˻�
-- 101�� ������ ���� ������ �˻��ϱ�
SELECT LEVEL, 
       LPAD(' ', 4*(LEVEL-1), ' ') || EMPLOYEE_ID, 
       FIRST_NAME, MANAGER_ID
FROM EMPLOYEES
START WITH EMPLOYEE_ID = 101    -- 101�� ������ ���������̴�.
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID;

-- ������ �˻�
-- 206�� ������ �������� ��ȸ�ϱ�
SELECT LEVEL, 
       EMPLOYEE_ID, 
       FIRST_NAME, 
       MANAGER_ID
FROM EMPLOYEES
START WITH EMPLOYEE_ID = 206    -- 206�� ������ ���������̴�.
CONNECT BY PRIOR MANAGER_ID = EMPLOYEE_ID;

-- ���ӵ� ���ڸ� �����
select level
from dual
connect by level <= 10;

-- 01�� ~ 12������ ���ӵ� ���� �����
select lpad(level, 2, '0') month
from dual
connect by level <= 12;

-- Ư�� �Ⱓ ������ ��¥ �����ϱ�
select to_date('2023-12-01') + level - 1
from dual
connect by level <= to_date('2023-12-31') - to_date('2023-12-01') + 2;

-- 2003�⿡ �Ի��� �������� ���� �Ի��� ���ڸ� ��ȸ�ϱ�
SELECT TO_CHAR(HIRE_DATE, 'MM'), COUNT(*)
FROM EMPLOYEES
WHERE HIRE_DATE >= '2003/01/01' AND HIRE_DATE < '2004/01/01'
-- WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2003'
GROUP BY TO_CHAR(HIRE_DATE, 'MM');

SELECT A.MONTH, NVL(B.CNT, 0) CNT
FROM (SELECT LPAD(LEVEL, 2, '0') MONTH
      FROM DUAL
      CONNECT BY LEVEL <= 12) A, 
     (SELECT TO_CHAR(HIRE_DATE, 'MM') MONTH, COUNT(*) CNT
      FROM EMPLOYEES
      WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2003'
      GROUP BY TO_CHAR(HIRE_DATE, 'MM')) B
WHERE A.MONTH = B.MONTH(+)
ORDER BY A.MONTH ASC;




