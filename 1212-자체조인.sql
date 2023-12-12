/*
��ü ����
 
���δ���� �Ǵ� ���̺��� ���� ���̺��϶� �߻��ϴ� �����̴�.
���� ���̺��� �����ϱ� ������ ���� ���� ����� ��Ī�� ���ϰ�, �� ���ҿ� �°� ���������� �����ؾ� �Ѵ�.
���� ���̺��� �����ϱ� ������ ��ȸ�ϴ� �÷����� ������ ��쿡 ������ ��Ī�� ���̴� ���� ����.
*/
 
-- �������̺��� �������̵�, �����̸�, �ش� ������ �����̵�, ����̸��� ��ȸ�ϱ�
--              E(����)    E(����)  E(����)-MANAGER_ID
--                                 E(���)-EMPLOYEE_ID  E(���)
SELECT EMP.EMPLOYEE_ID  AS EMP_ID,
       EMP.FIRST_NAME   AS EMP_NAME,
       MGR.EMPLOYEE_ID  AS MGR_ID,
       MGR.FIRST_NAME   AS MGR_NAME
FROM EMPLOYEES EMP, EMPLOYEES MGR
WHERE EMP.MANAGER_ID = MGR.EMPLOYEE_ID;

-- �������̵�, �����̸�, ������ �ҼӺμ���, ����� ���̵�, ����� �̸�, ����� �ҼӺμ���
-- E         E                        E
--                    ED    
--                                    M            M          M
--                                                            MD
SELECT E.EMPLOYEE_ID      AS EMP_ID,
       E.FIRST_NAME       AS EMP_NAME,
       ED.DEPARTMENT_NAME AS EMP_DEPT_NAME,
       M.EMPLOYEE_ID      AS MGR_ID,
       M.FIRST_NAME       AS MGR_NAME,
       MD.DEPARTMENT_NAME AS MGR_DEPT_NAME
FROM EMPLOYEES E,       -- ����
     EMPLOYEES M,       -- ������
     DEPARTMENTS ED,    -- ���� �ҼӺμ�
     DEPARTMENTS MD     -- ������ �ҼӺμ�
WHERE E.DEPARTMENT_ID = ED.DEPARTMENT_ID(+) -- ������ ������ �ҼӺμ� ����
AND E.MANAGER_ID = M.EMPLOYEE_ID(+)         -- ������ �Ŵ��� ����
AND M.DEPARTMENT_ID = MD.DEPARTMENT_ID(+)   -- �Ŵ����� �Ŵ����� �ҼӺμ� ����
-- ������ �Ŵ���, �ҼӺμ��� ���� ���(NULL) ��ȸ�� ����!



