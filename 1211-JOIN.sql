/*
���̺� �����ϱ�

    select *
    from ���̺�1, ���̺�2;
    * ���̺��� ������ ���� ����̵Ǵ� ���̺��� �̸��� from���� �����ϱ⸸ �ϸ�ȴ�.
    * ������ ������ ������ ���̺�1�� ��� ��� ���̺�2�� ��� ���� ����� ������ ���̺��� �����ȴ�.
    * (���̺�1�� ���� ���� * ���̺�2�� ���� ����) ��ŭ�� ���� ��ȸ�ȴ�.

�������� �����ϱ�

    select *
    from ���̺�1, ���̺�2
    where ���̺�1.�÷��� = ���̺�2.�÷���;
    * ���ε� ���̺��� ��� �࿡�� ���������� �����ϴ� ���� �ǹ��ְ� ����� ���̴�.
    * ���������� �����ϸ� �ǹ��ְ� ����� �ุ ��ȸ�� �� �ִ�.
    * ���������� ���� = ���ε� ���̺��� ���� - 1
*/

-- regions ���̺�� countries ���̺� �����ϱ�
-- regions ���̺��� ��� ��� countries ���̺��� ��� ���� ���εȴ�.
-- ���: regions(4) * countries(25) -> 100���� ��
select *
from regions, countries;

-- regions ���̺�� countries ���̺� �����ϰ�, ���� �����ִ� �ุ ���͸��ϱ�
select countries.country_id,
       countries.country_name,
       regions.region_name
from regions, countries
where regions.region_id = countries.region_id;

-- �������̵�, �����̸�, �������̵�, ��������, �����ּұ޿�, �����ִ�޿�, �޿� ��ȸ�ϱ�
-- E         E        E                                         E  
--                    J         J        J          J    
select E.employee_id,
       E.first_name,
       E.job_id,
       J.job_title,
       J.min_salary,
       J.max_salary,
       E.salary
from employees E, jobs J
where E.job_id = J.job_id;
-- employees, jobs ���̺� ��� job_id��� �÷����� ������ �ֱ� ������ 
-- � ���̺��� �÷����� �����ϱ� ���ؼ� �÷��� �տ� ���̺���̳� ���̺��� ��Ī�� ���ؼ� ǥ���Ѵ�.

/*
�����
    �������ǿ��� Equal(=) �����ڸ� ����Ѵ�.
    ���ο� �����ϴ� ���̺��� ���� ���� ������ �ִ� �ೢ�� �����Ѵ�.
    
    ORACLE�� �����
        select A.�÷���, B.�÷���, B.�÷���, ...
        from ���̺� A, ���̺� B
        where A.�÷��� = B.�÷���;
        
    ANSI SQL�� �����
        select A.�÷���, B.�÷���, B.�÷���, ...
        from ���̺� A join ���̺� B
        on A.�÷��� = B.�÷���;       
*/

-- �������̵�, �����̸�, �ҼӺμ����̵�, �ҼӺμ����� ��ȸ�ϱ�
-- E         E        E   
--                    D            D

-- ORACLE�� �����
select A.employee_id, A.first_name, D.department_name
from employees A, departments D
where A.department_id = D.department_id;

-- ANSI SQL�� ����� (join ~ on)
select A.employee_id, A.first_name, D.department_name
from employees A join departments D
on A.department_id = D.department_id;

-- �μ������ڰ� ������ �μ��� �μ����̵�, �μ���, �μ������ڸ�(�����̸�)�� ��ȸ�ϱ�
--                        D         D      D
--                                         E

-- ORACLE
select D.department_id, 
       D.department_name, 
       E.first_name
from departments D, employees E
where D.manager_id is not null
and D.manager_id = E.employee_id;

-- ANSI SQL
select D.department_id, 
       D.department_name, 
       E.first_name
from departments D join employees E
on D.manager_id = E.employee_id
where D.manager_id is not null;

-- �������̵�, �̸�, �ҼӺμ����̵�, �ҼӺμ���, �������̵�, ��������, �޿��� ��ȸ�ϱ�
-- e         e     e                      e                  e
--                 d            d         
--                                        j         j

select e.employee_id, e.first_name, e.department_id, d.department_name,
       e.job_id, j.job_title, e.salary
from employees e, departments d, jobs j
where e.department_id = d.department_id
and e.job_id = j.job_id;

select e.employee_id, e.first_name, e.department_id, d.department_name,
       e.job_id, j.job_title, e.salary
from employees e
join departments d on e.department_id = d.department_id
join jobs j on e.job_id = j.job_id;

-- �������̵�, �����̸�, �ҼӺμ����̵�, �μ���, ���������̵�, �ٹ��������ø��� ��ȸ�ϱ�
-- E         E        E
--                    D            D      D   
--                                        L           L
select a.employee_id, 
       a.first_name, 
       b.department_id,
       b.department_name,
       c.location_id,
       c.city
from employees a, departments b, locations c
where a.department_id = b.department_id
and b.location_id = c.location_id;

/*
�����ο� ���� ������ �߰�
*/
create table salary_grades (
    grade char(1) primary key,
    min_salary number(8, 2),
    max_salary number(8, 2)
);

insert into salary_grades values('A', 0, 2499);
insert into salary_grades values('B', 2500, 4999);
insert into salary_grades values('C', 5000, 9999);
insert into salary_grades values('D', 10000, 19999);
insert into salary_grades values('E', 20000, 39999);

commit;

/*
������
    ���������� ������ �� ���� ������̺��� ���� ���� ���� �����͸� �������� ���, 
    ũ�ų� ���� ����� �������� �����͸� ��ȸ�ϴ� ���� ����� �� �����̴�.
*/

-- �������̵�, �����̸�, �޿�,             �޿������ ��ȸ�ϱ�
-- E         E        E    
--                    G(�ּ�/�ִ� �޿�)   G
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.SALARY, B.GRADE
FROM EMPLOYEES A, SALARY_GRADES B
WHERE A.SALARY >= B.MIN_SALARY AND A.SALARY <= B.MAX_SALARY
ORDER BY A.EMPLOYEE_ID ASC;

-- ANSI SQL
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.SALARY, B.GRADE
FROM EMPLOYEES A
JOIN SALARY_GRADES B
ON A.SALARY >= B.MIN_SALARY AND A.SALARY <= B.MAX_SALARY
ORDER BY A.EMPLOYEE_ID ASC;

/*
��������

���� ���̺��� �����Ͱ� �ְ�, �ٸ� �� ���̺� ���������� �����ϴ� �����Ͱ� ���� ���,
���ο� �������� ���ϱ� ������ �ش� ���� ��ȸ���� �ʴ´�.
�����Ͱ� ���� ��쿡�� �����Ͱ� �ִ� �� ���̺��� ��� ���� ��ȸ�ϴ� ���ι���̴�.
��� ���� ��ȸ�ϴ� ���̺��� �ݴ��� �������ǿ� �������� ��ȣ�� �߰��Ѵ�.
*/

-- �μ����̵�, �μ��̸�, �μ������ھ��̵�, �μ��������̸� ��ȸ�ϱ�
-- D         D        D(MANAGER_ID)             
--                    E(EMPLOYEE_ID) E(FIRST_NAME)
SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME, A.MANAGER_ID, B.FIRST_NAME
FROM DEPARTMENTS A, EMPLOYEES B
WHERE A.MANAGER_ID = B.EMPLOYEE_ID(+);

-- �������̵�, �����̸�, �ҼӺμ����̵�, �ҼӺμ��� ��ȸ�ϱ�
-- E         E        E
--                    D            D
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.DEPARTMENT_ID, B.DEPARTMENT_NAME
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID(+);

-- ANSI SQL
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.DEPARTMENT_ID, B.DEPARTMENT_NAME
FROM EMPLOYEES A 
LEFT OUTER JOIN DEPARTMENTS B   -- LEFT OUTER JOIN�� �������̺��� ��� ���� ��ȸ�Ѵ�.
ON A.DEPARTMENT_ID = B.DEPARTMENT_ID;

