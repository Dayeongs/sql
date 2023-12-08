/*
���� �Լ�

lower(�÷� Ȥ�� ǥ����) : �ҹ��ڷ� ��ȯ�� ���ڸ� ��ȯ�Ѵ�.
upper(�÷� Ȥ�� ǥ����) : �빮�ڷ� ��ȯ�� ���ڸ� ��ȯ�Ѵ�.

concat(�÷� Ȥ�� ǥ����, �÷� Ȥ�� ǥ����), || : �� ���ڿ��� �����ؼ� ��ȯ�Ѵ�.

length(�÷� Ȥ�� ǥ����) : ���ڿ��� ���̸� ��ȯ�Ѵ�.

substr(�÷�?Ȥ��?ǥ����, ������ġ, ����) : ���ڿ��� ������ġ���� ���̸�ŭ �߶� ��ȯ�Ѵ�.
                                      ������ġ�� 1���� �����Ѵ�.
                                      
instr(�÷� Ȥ�� ǥ����, ���ڿ�) : ������ ���ڿ��� ������ġ�� ��ȯ�Ѵ�.

trim(�÷� Ȥ�� ǥ����) : ���ʿ��� �¿� ������ ���ŵ� ���ڿ��� ��ȯ�Ѵ�.

lpad(�÷� Ȥ�� ǥ����, ����, ����) : �÷� Ȥ�� ǥ������ ���̰� ������ ���̺��� ª���� 
                                 ������ ���̸�ŭ ���ʿ� ������ ���ڰ� ä���� ���ڿ��� ��ȯ�ȴ�. 
*/

-- lower, upper
-- 60�� �μ��� �Ҽӵ� �������� �̸��� �ҹ���, �빮�ڷ� ��ȸ�ϱ�
select first_name, lower(first_name), upper(first_name)
from employees
where department_id = 60;

-- concat
-- 60�� �μ��� �Ҽӵ� �������� first_name�� last_name�� �����ؼ� ��ȸ�ϱ�
select concat(first_name, last_name)
from employees
where department_id = 60;

-- ||
-- 60�� �μ��� �Ҽӵ� �������� first_name�� last_name�� �����ؼ� ��ȸ�ϱ�
select first_name || ' ' || last_name
from employees
where department_id = 60;

-- length
-- 60�� �μ��� �Ҽӵ� �����帣�� �̸��� �̸��� ���̸� ��ȸ�ϱ�
select first_name, length(first_name)
from employees
where department_id = 60;

-- �̸��� 6���� �̻��� ��� �������� �������̵�� �̸��� ��ȸ�ϱ�
select employee_id, first_name
from employees
where length(first_name) >= 6;

-- substr(�÷�?Ȥ��?ǥ����, ������ġ, ����)
-- smaple_book���� �����̸��� ��ȸ�ϰ� �̸��� ù��° ���ڵ� ��ȸ�ϱ�
select book_writer, substr(book_writer, 1, 1)
from sample_books;

-- instr(�÷� Ȥ�� ǥ����, ���ڿ�)
-- ��ȭ��ȣ���� ������ ��ȸ�ϱ�
select substr('031)1234-5678', 1, instr('031)1234-5678', ')') - 1)
from dual;

-- dual�� ����Ŭ���� �����ϴ� dummy ���̺��̴�. (����� ���̺�)
-- dual�� 1�� 1��¥�� ���̺��̴�.
-- ���� ���̺� ��ȸ���� ������ ������ ������ �� �̿��Ѵ�.
select *
from dual;

-- trim
-- ���ʿ��� �¿� ������ ���ŵ� ���ڿ��� ��ȸ�ϱ�
select trim('           hello word!           ')
from dual;

-- lpad(�÷� Ȥ�� ǥ����, ����, ����)
-- ������ ���̸�ŭ ���ڿ��� ���ʿ� '0'�� ä���� ��ȸ�ϱ�
select lpad('100', 10, '0')
from dual;

/*
�����Լ�

round(�÷� Ȥ�� ǥ����, �ڸ���) : ������ �ڸ������� �ݿø��Ѵ�.

trunc(�÷� Ȥ�� ǥ����, �ڸ���) : ������ �ڸ������� ����� ���� ������.

mod(����1, ����2) : ������ ���� ��ȯ�Ѵ�.

abs(�÷� Ȥ�� ǥ����) : ���밪�� ��ȯ�Ѵ�.

ceil(�÷� Ȥ�� ǥ����) : ������ ������ ũ�ų� ���� ���� �߿��� ���� ���� ������ ��ȯ�Ѵ�.
floor(�÷� Ȥ�� ǥ����) : ������ ������ �۰ų� ���� ���� �߿��� ���� ū ������ ��ȯ�Ѵ�.
*/

-- round(�÷� Ȥ�� ǥ����, �ڸ���)
select round(1234.5678),
       round(1234.5678, 3),
       round(1234.5678, 2),
       round(1234.5678, 1),
       round(1234.5678, 0),
       round(1234.5678, -1),
       round(1234.5678, -2),
       round(1234.5678, -3)
from dual;

-- trunc(�÷� Ȥ�� ǥ����, �ڸ���)
-- 80�� �μ��� �Ҽӵ� ������ ���̵�, �̸�, �޿�, �޿��� ���� #�� ����ϱ�
-- '#' �ϳ��� 1000�޷��� ��Ÿ����.
select employee_id, first_name, salary, lpad('#', trunc(salary/1000), '#')
from employees
where department_id = 80;

-- mod(����1, ����2), abs
select mod(10, 4), abs(-10)
from dual;

-- ceil
select ceil(1), ceil(1.1), ceil(1.5), ceil(1.9), ceil(2)
from dual;
-- floor
select floor(1), floor(1.1), floor(1.5), floor(1.9), floor(2)
from dual;

/*
��¥ �Լ�
sysdate : �ý����� ���� ���ڿ� �ð��� date Ÿ������ ��ȯ�Ѵ�.
        * �����Ͱ� �߰��� ��, �����Ͱ� ����� �� 
          �ý����� ���� ��¥�� �ð������� �����ϴ� �뵵�� Ȱ��ȴ�.
systimestamp : �ý����� ���� ���ڿ� �ð��� timestamp Ÿ������ ��ȯ�Ѵ�.

extract(���� from ��¥) : ��¥���� ���Ŀ� �ش��ϴ� ���� ��ȸ�Ѵ�.
                         ���� : year, month, day, hour, minute, second
                         
last_day(��¥) : ������ ��¥�� �������� �ش� ���� ������ ���ڸ� ��ȯ�Ѵ�.

next_day(��¥, ����) : ������ ��¥�� �������� ������ �ٰ��� ��¥�߿��� ������ ���Ͽ� �ش��ϴ� ��¥�� ��ȯ�Ѵ�. 

������ ���� �Լ�
add_months(��¥, ����) : ��¥�� ������ ���ڸ�ŭ�� ���� ���� ��¥�� ��ȯ�Ѵ�.
months_between(��¥, ��¥) : �� ��¥ ������ �������� ��ȯ�Ѵ�.

�ϼ� ���� ����
��¥ + ���� = ���ڸ�ŭ ���ڰ� ����� ��¥�� ��ȯ�Ѵ�.
��¥ - ���� = ���ڸ�ŭ ���� ��¥�� ��ȯ�Ѵ�.
��¥ - ��¥ = �� ��¥������ �ϼ��� ��ȯ�Ѵ�.
��¥ + 1/24 = 1�ð� ������ ��¥�� ��ȯ�Ѵ�.

trunc(��¥) : ������ ��¥�� ��� �ð� ������ 0��0��0�ʷ� �ٲ� ��¥�� ��ȯ�ȴ�.
round(��¥) : ������ ��¥�� �ð������� ������ ������ ���̸� �ش糯¥�� ��ȯ�ȴ�.
                                  ������ �������� �Ϸ� ������ ��¥�� ��ȯ�ȴ�.
                                  �ð������� 0�� 0�� 0�ʴ�.
*/

-- �ý����� ���� ���ڿ� �ð��� date, timestamp ������ ��ȸ�ϱ�
select sysdate, systimestamp from dual;

select sysdate,             -- ����
    add_months(sysdate, 1), -- 1����
    add_months(sysdate, 2), -- 2����
    add_months(sysdate, 3)  -- 3����
from dual;

--������ 12��31���̶�� �����ϰ�, 2�� ���� ��¥�� ��ȸ�ϸ� 2�� 28�� Ȥ�� 2�� 29���� ��ȯ�ȴ�.
select add_months('2023/12/31', 2) from dual;

-- extract(���� from ��¥)
-- �ý����� ���� ���ڿ� �ð� �������� ��, ��, ��, ��, ��, �� ��ȸ�ϱ�
select extract(year from sysdate),
    extract(month from sysdate),
    extract(day from sysdate),
    extract(hour from systimestamp),
    extract(minute from systimestamp),
    extract(second from systimestamp)
from dual;

-- last_day(��¥)
-- ���� ���ڰ� ���� ���� ������ ���� ��ȸ�ϱ�
select last_day(sysdate),
       last_day('2024/01/01'),
       last_day('2024/02/01')
from dual;

-- next_day(��¥, ����)
-- ���� ���ڸ� �������� ���� �������� ��ȸ�ϱ�
select next_day(sysdate, '������')
from dual;

-- months_between(��¥, ��¥)
-- ���� ���ڿ� ������ ��¥ ������ ���� ���� ��ȸ�ϱ�
select months_between(sysdate, '2023/06/01'),
       trunc (months_between(sysdate, '2023/06/01'))
from dual;

-- ���� ���ڸ� �������� 7�� ��, 3�� ��, 3�� ��, 7�� �� ��¥�� ��ȸ�ϱ�
select sysdate - 7, -- 7�� ��
       sysdate - 3, -- 3�� ��
       sysdate + 3, -- 3�� ��
       sysdate + 7  -- 7�� ��
from dual;

-- ������ ��¥�� �������� 7������ ��¥�� ��ȸ�ϱ�
SELECT to_date('2023/12/01'), TRUNC(to_date('2023/12/01')) - 7
FROM DUAL;

-- ������ ��¥�� �������� 1�� ��, 1�� ���� ��¥�� ��ȸ�ϱ�
SELECT ADD_MONTHS(to_date('2023/12/01'), -1),
       ADD_MONTHS(to_date('2023/12/01'), 1)
FROM DUAL;

-- ���� �������� 7������ ��¥�� ��ȸ�ϱ�
SELECT TRUNC(SYSDATE) - 7
FROM DUAL;

-- ���� �������� 1������ ��¥�� ��ȸ�ϱ�
SELECT ADD_MONTHS(TRUNC(SYSDATE), -1)
FROM DUAL;

-- ���� �������� 7�ϵ����� �ֹ������� ��ȸ�ϱ� (������ ���Ե��� ����)
-- ������ �����Ϸ��� ORDER_DATE < TRUNC(SYSDATE) + 1�� �Ѵ�.
SELECT *
FROM ORDERS
WHERE ORDER_DATE >= TRUNC(SYSDATE) - 7 AND ORDER_DATE < TRUNC(SYSDATE);

-- ���� �������� 1���������� �ֹ������� ��ȸ�ϱ� (������ ���Ե��� ����)
SELECT *
FROM ORDERS
WHERE ORDER_DATE >= ADD_MONTHS(TRUNC(SYSDATE), -1) AND ORDER_DATE < TRUNC(SYSDATE;

select sysdate,
       sysdate + 1/24, -- 1�ð� ��
       sysdate + 3/24, -- 3�ð� ��
       sysdate + 6/24 -- 6�ð� ��
from dual;

select round(sysdate)
from dual;

 /*
��ȯ�Լ�

������ ��ȯ
    ��ȯ�Լ��� ������� �ʾƵ� �������� Ÿ���� �ڵ����� ���ϴ� ���̴�.
    '����' -> ��¥ : '����'�� ��ȿ�� ��¥ ������ ������ ��� ��¥�� ����ȴ�.
    '����' -> ���� : '����'�� ���ڷθ� �����Ǿ� ������ ���ڷ� ����ȴ�.
    
    select *
    from employees
    where hire_date >= '2005/01/01' and hire_date < '2005/07/01';
    * ���� SQL���� hire_date�� dateŸ���� �÷��̱� ������ 
      '2005/01/01'���ڰ� dateŸ���� ������ �ڵ����� ��ȯ�ȴ�.
    * '2005/01/01'�̳� '2005-01-01'�� ������ ��� �ڵ����� ��ȯ�ȴ�.
    
    select *
    from employees
    where department_id = '10';
    * ���� SQL������ department_id�� numberŸ���� �÷��̱� ������ 
      '10'���ڰ� numberŸ���� ������ �ڵ����� ��ȯ�ȴ�.
    
����� ��ȯ 
    ��ȯ�Լ��� ����ؼ� '����' -> ��¥, '����' -> ���� ���� �����ͺ�ȯ�� �ϴ� ���̴�.
    
    to_date('��¥������ ���ڿ�', '����')
    ��) to_date('2023/01/01')
        * ���ڿ��� ��¥������ �ؽ�Ʈ�̱� ������ ������ �������� �ʾƵ� dateŸ������ ��ȯ�ȴ�.
        to_date('20230101', 'yyyymmdd')
        * ���ڿ��� �Ϲ����̳� ��¥ ������ �ƴ� ��쿡�� ������ �����ؾ� �Ѵ�.
    
    to_char(��¥, '����')
        ��¥�� ������ ���������� �ؽ�Ʈ�� ��ȯ�Ѵ�.
        ��¥ ��ȯ ����
            am          '����'
            pm          '����'
            yyyy, yy    '2022'
            mm          ��
            d           1~7 (1:�Ͽ���, 7:�����)
            day         ����
            dd          1~31
            hh          12�ð��� �ð�
            hh24        24�ð��� �ð�
            mi          ��
            ss          ��
        * ��¥ ��ȯ ������ ��ҹ��ڸ� �������� �ʴ´�.
 */
 
 -- ���ڸ� ��¥�� ��ȯ�ϱ�
 select to_date('2023/01/01'),
        to_date('20230101'),
        to_date('2023 01 01'),
        to_date('2023/01/01 22:41:10', 'yyyy/mm/dd hh24:mi:ss')
 from dual;
 
 -- ��¥�� ���ڷ� ��ȯ�ϱ�
 -- ���� ��������, ���� ������ ����
 select to_char(sysdate, 'yyyy'), 124 as numbertype,
        to_char(sysdate, 'mm'),
        to_char(sysdate, 'dd'),
        to_char(sysdate, 'day'),
        to_char(sysdate, 'am'),
        to_char(sysdate, 'hh'),
        to_char(sysdate, 'hh24'),
        to_char(sysdate, 'd')
 from dual;
 
 -- �������̺��� 2005�⵵�� �Ի��� ������ ���̵�, �̸�, �Ի����ڸ� ��ȸ�ϱ�
    -- �����ϸ� 2�� ����� ��õ!
    -- where�������� ���� ����ϴ� �÷����� �������� ����� ���´�.
    -- �º��� ���� �÷����� �����ϸ� ���� ��ȸ ������ ���� ��������.
 -- 1�� ���
 select employee_id, first_name, hire_date
 from employees
 where to_char(hire_date, 'yyyy') = '2005';
 
 -- 2�� ���
 select employee_id, first_name, hire_date
 from employees
 where hire_date >= '2005/01/01/' and hire_date < '2006/01/01';
 
 -- ���ڸ� ,�� ���Ե� '����'�� ��ȯ�Ѵ�.
 -- ���ڰ� ���� ���ı��̺��� �۾ƾ��Ѵ�.
 select to_char(100000000, '999,999,999')
 from dual;
 
 -- '����'�� ���ڷ� ��ȯ�Ѵ�.
 -- ���ڰ� 100,000�� ��� ���������� �Ȱ��� ������� �Ѵ�.
 select to_number('10000'), to_number('100,000', '999,999')
 from dual;
 