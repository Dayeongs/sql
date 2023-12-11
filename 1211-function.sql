/*
������ �Լ� - ��Ÿ �Լ�

NVL(�÷�, ��ü��)
    NVL�Լ��� null���� �ٸ� ������ ��ȯ�Ѵ�.
    ������ �÷��� ���� null�� �ƴ� ��쿡�� �ش� �÷��� ���� ��ȯ�Ѵ�.
    �ش� �÷��� ��ü���� ������ Ÿ���� ������ Ÿ���̾�� �Ѵ�.
    
NVL2(�÷�, ��ü��1, ��ü��2)
    ������ �÷��� ���� null�� �ƴϸ� ��ü��1�� ��ȯ�ǰ�, null�̸� ��ü��2�� ��ȯ�ȴ�.
    ��ü��1�� ��ü��2�� ������ Ÿ���� ������ Ÿ���̾�� �Ѵ�.
*/

-- ��� ������ ���̵�, �̸�, �޿�, Ŀ�̼��� ��ȸ�Ѵ�.
-- Ŀ�̼��� null�̸� 0�� ��ȯ�Ѵ�.
select employee_id, first_name, salary, nvl(commission_pct, 0)
from employees;

-- ��� ������ ���̵�, �̸�, �޿�, Ŀ�̼�, Ŀ�̼��� ���Ե� �޿��� ��ȸ�ϱ�
-- Ŀ�̼��� ���Ե� �޿� = �޿� + (�޿�*Ŀ�̼�)
select employee_id, first_name, salary, commission_pct, 
       salary + (salary*nvl(commission_pct, 0)) as comm_salary
from employees;

-- ��� �μ��� �μ����̵�, �̸�, �����ھ��̵� ��ȸ�ϱ�
-- ��, �����ڰ� �������� ���� �μ��� '�����ھ���'���� ��ȸ�ϱ�
-- manager_id : ����, '�����ھ���' :  ���� -> ������ ������ Ÿ������ �ٲ�� ��.
select department_id, department_name, nvl(to_char(manager_id), '�����ھ���')
from departments;

/*
������ �Լ� - ��Ÿ �Լ�
decode �Լ�
    decode(�÷�, �񱳰�1, ��1,
                �񱳰�2, ��2,
                �񱳰�3, ��3,
                [�⺻��])
    * ������ �÷��� ���� �񱳰�1�� ������ ��1�� ��ȯ�ȴ�.
                      �񱳰�2�� ������ ��2�� ��ȯ�ȴ�.
                      �񱳰�3�� ������ ��3�� ��ȯ�ȴ�.
                      ��ġ�ϴ� ���� ������ �⺻���� ��ȯ�ȴ�.
                      �⺻���� ���� �����ϴ�.
    * decode�Լ��� �÷��� ���� �񱳰����� equals �񱳸� �����ϴ�.

case ~ when ǥ����
    case
        when ���ǽ�1 then ��1
        when ���ǽ�2 then ��2
        when ���ǽ�3 then ��3
        else ��4
    end
    * ���ǽ��� true�� �����Ǹ� then�� ���� �������� �ȴ�.
    * ��� ���ǽ��� false�� �����Ǹ� else�� ��4�� �������� �ȴ�.
    * ���ǽĿ����� =, >, >=, <, <=, != ���� �پ��� �����ڸ� ����ؼ� ���ǽ��� �ۼ��� �� �ִ�.
    * decode�Լ��� ������ �� �� �پ��� ������ ������ �� �ִ�.
    
    case �÷�
        when �񱳰�1 then ��1
        when �񱳰�2 then ��2
        when �񱳰�3 then ��3
        else ��4
    end
    * ������ �÷��� ���� �񱳰��� �� �ϳ��� ��ġ�ϸ� �ش� then�� ���� �������� �ȴ�.
    * ��� �񱳰��� ��ġ���� ������ else�� ��4�� �������� �ȴ�.
    * decode �Լ��� ��ɸ鿡�� �����ϴ�.
*/

-- ��� �������̺��� �޿��� 5000���ϸ� ���ʽ��� 1000�����ϰ�, 
--                  �޿��� 10000���ϸ� ���ʽ��� 2000�����ϰ�, 
--                  �� �ܴ� 3000�� �����Ѵ�.
-- ��� ������ ���ؼ� �������̵�, �̸�, �޿�, ���ʽ��� ��ȸ�ϱ�
select employee_id, first_name, salary, 
    case
        when salary <= 5000 then 1000
        when salary <= 10000 then 2000
        else 3000
    end bonus
from employees;

-- ��� ������ ���ؼ� �μ����̵� �������� ���� �����ϱ�, 
-- 10, 20, 30�� �μ��� A��, 40, 50, 60�� �μ��� B��, �� �ܴ� C��
-- �������̵�, �̸�, �μ����̵�, ������ ��ȸ�ϱ�
select employee_id, first_name, department_id,
    case
        when department_id in (10, 20, 30) then 'A'
        when department_id in (40, 50, 60) then 'B'
        else 'C'
    end as team
from employees;

-- �������̺��� �������̵𺰷� �������� ��ȸ�ϱ�
-- 1�� ����, 2�� �Ƹ޸�ī, 3�� �ƽþ�, 4�� ������ī �� �ߵ�
select region_id,
    case
        when region_id = 1 then '����'
        when region_id = 2 then '�Ƹ޸�ī'
        when region_id = 3 then '�ƽþ�'
        when region_id = 4 then '������ī �� �ߵ�'
    end region_name
from regions;

select region_id,
    case region_id
        when 1 then '����'
        when 2 then '�Ƹ޸�ī'
        when 3 then '�ƽþ�'
        when 4 then '������ī �� �ߵ�'
    end region_name
from regions;

-- decode�� �̿��ؼ�
-- �������̺��� �������̵𺰷� �������� ��ȸ�ϱ�
-- 1�� ����, 2�� �Ƹ޸�ī, 3�� �ƽþ�, 4�� ������ī �� �ߵ�
select region_id,
    decode(region_id, 1, '����',
                      2, '�Ƹ޸�ī',
                      3, '�ƽþ�',
                      4, '������ī �� �ߵ�') as region_name
from regions;

-- �μ����̺��� �μ����̵�, �μ���, �������̸��� ��ȸ�ϱ�
-- �����ڰ� �����Ǿ� ���� ������ �������� ��ȸ�ȴ�.
-- then�� select ������ ���� �� �ִ�.
-- �� �κп� select ������ ����Ͽ� ���� ��ȸ�ϴ� ���, ���� �ϳ��� ��ȯ�Ǿ�� �Ѵ�.
-- ���� Ÿ���� ��� �����ؾ� �Ѵ�.
select B.department_id, B.department_name, 
    case
        when B.manager_id is not null then (select A.first_name 
                                            from employees A 
                                            where A.employee_id = B.manager_id)
        else '����'
    end manager_name
from departments B;

