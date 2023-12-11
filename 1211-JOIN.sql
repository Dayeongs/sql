/*
테이블 조인하기

    select *
    from 테이블1, 테이블2;
    * 테이블의 조인은 조인 대상이되는 테이블의 이름을 from절에 나열하기만 하면된다.
    * 별도의 조건이 없으면 테이블1의 모든 행과 테이블2의 모든 행이 연결된 가상의 테이블이 생성된다.
    * (테이블1의 행의 갯수 * 테이블2의 행의 갯수) 만큼의 행이 조회된다.

조인조건 지정하기

    select *
    from 테이블1, 테이블2
    where 테이블1.컬럼명 = 테이블2.컬럼명;
    * 조인된 테이블의 모든 행에서 조인조건을 만족하는 행이 의미있게 연결된 행이다.
    * 조인조건을 지정하면 의미있게 연결된 행만 조회할 수 있다.
    * 조인조건의 갯수 = 조인된 테이블의 갯수 - 1
*/

-- regions 테이블과 countries 테이블 조인하기
-- regions 테이블의 모든 행과 countries 테이블의 모든 행이 조인된다.
-- 결과: regions(4) * countries(25) -> 100개의 행
select *
from regions, countries;

-- regions 테이블과 countries 테이블 조인하고, 서로 연관있는 행만 필터링하기
select countries.country_id,
       countries.country_name,
       regions.region_name
from regions, countries
where regions.region_id = countries.region_id;

-- 직원아이디, 직원이름, 직종아이디, 직종제목, 직종최소급여, 직종최대급여, 급여 조회하기
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
-- employees, jobs 테이블 모두 job_id라는 컬럼명을 가지고 있기 때문에 
-- 어떤 테이블의 컬럼인지 구분하기 위해서 컬럼명 앞에 테이블명이나 테이블의 별칭을 정해서 표기한다.

/*
등가조인
    조인조건에서 Equal(=) 연산자를 사용한다.
    조인에 참여하는 테이블에서 같은 값을 가지고 있는 행끼리 조인한다.
    
    ORACLE의 등가조인
        select A.컬럼명, B.컬럼명, B.컬럼명, ...
        from 테이블 A, 테이블 B
        where A.컬럼명 = B.컬럼명;
        
    ANSI SQL의 등가조인
        select A.컬럼명, B.컬럼명, B.컬럼명, ...
        from 테이블 A join 테이블 B
        on A.컬럼명 = B.컬럼명;       
*/

-- 직원아이디, 직원이름, 소속부서아이디, 소속부서명을 조회하기
-- E         E        E   
--                    D            D

-- ORACLE의 등가조인
select A.employee_id, A.first_name, D.department_name
from employees A, departments D
where A.department_id = D.department_id;

-- ANSI SQL의 등가조인 (join ~ on)
select A.employee_id, A.first_name, D.department_name
from employees A join departments D
on A.department_id = D.department_id;

-- 부서관리자가 지정된 부서의 부서아이디, 부서명, 부서관리자명(직원이름)을 조회하기
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

-- 직원아이디, 이름, 소속부서아이디, 소속부서명, 직종아이디, 직종제목, 급여를 조회하기
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

-- 직원아이디, 직원이름, 소속부서아이디, 부서명, 소재지아이디, 근무지역도시명을 조회하기
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
비등가조인용 샘플 데이터 추가
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
비등가조인
    조인조건을 지정할 때 조인 대상테이블에서 같은 값을 가진 데이터를 가져오는 대신, 
    크거나 작은 경우의 조건으로 데이터를 조회하는 조인 방식이 비등가 조인이다.
*/

-- 직원아이디, 직원이름, 급여,             급여등급을 조회하기
-- E         E        E    
--                    G(최소/최대 급여)   G
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
포괄조인

한쪽 테이블에만 데이터가 있고, 다른 쪽 테이블에 조인조건을 만족하는 데이터가 없는 경우,
조인에 참여하지 못하기 때문에 해당 행은 조회되지 않는다.
데이터가 없는 경우에도 데이터가 있는 쪽 테이블의 모든 행을 조회하는 조인방법이다.
모든 행을 조회하는 테이블의 반대쪽 조인조건에 포괄조인 기호를 추가한다.
*/

-- 부서아이디, 부서이름, 부서관리자아이디, 부서관리자이름 조회하기
-- D         D        D(MANAGER_ID)             
--                    E(EMPLOYEE_ID) E(FIRST_NAME)
SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME, A.MANAGER_ID, B.FIRST_NAME
FROM DEPARTMENTS A, EMPLOYEES B
WHERE A.MANAGER_ID = B.EMPLOYEE_ID(+);

-- 직원아이디, 직원이름, 소속부서아이디, 소속부서명 조회하기
-- E         E        E
--                    D            D
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.DEPARTMENT_ID, B.DEPARTMENT_NAME
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID(+);

-- ANSI SQL
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.DEPARTMENT_ID, B.DEPARTMENT_NAME
FROM EMPLOYEES A 
LEFT OUTER JOIN DEPARTMENTS B   -- LEFT OUTER JOIN은 선행테이블의 모든 행을 조회한다.
ON A.DEPARTMENT_ID = B.DEPARTMENT_ID;

