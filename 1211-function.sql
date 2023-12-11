/*
단일행 함수 - 기타 함수

NVL(컬럼, 대체값)
    NVL함수는 null값을 다른 값으로 변환한다.
    지정된 컬럼의 값이 null이 아닌 경우에는 해당 컬럼의 값을 반환한다.
    해당 컬럼과 대체값은 데이터 타입이 동일한 타입이어야 한다.
    
NVL2(컬럼, 대체값1, 대체값2)
    지정된 컬럼의 값이 null이 아니면 대체값1이 반환되고, null이면 대체값2가 반환된다.
    대체값1과 대체값2는 데이터 타입이 동일한 타입이어야 한다.
*/

-- 모든 직원의 아이디, 이름, 급여, 커미션을 조회한다.
-- 커미션이 null이면 0을 반환한다.
select employee_id, first_name, salary, nvl(commission_pct, 0)
from employees;

-- 모든 직원의 아이디, 이름, 급여, 커미션, 커미션이 포함된 급여를 조회하기
-- 커미션이 포함된 급여 = 급여 + (급여*커미션)
select employee_id, first_name, salary, commission_pct, 
       salary + (salary*nvl(commission_pct, 0)) as comm_salary
from employees;

-- 모든 부서의 부서아이디, 이름, 관리자아이디를 조회하기
-- 단, 관리자가 지정되지 않은 부서는 '관리자없음'으로 조회하기
-- manager_id : 숫자, '관리자없음' :  문자 -> 동일한 데이터 타입으로 바꿔야 함.
select department_id, department_name, nvl(to_char(manager_id), '관리자없음')
from departments;

/*
단일행 함수 - 기타 함수
decode 함수
    decode(컬럼, 비교값1, 값1,
                비교값2, 값2,
                비교값3, 값3,
                [기본값])
    * 지정된 컬럼의 값이 비교값1과 같은면 값1이 반환된다.
                      비교값2와 같으면 값2가 반환된다.
                      비교값3과 같은면 값3이 반환된다.
                      일치하는 값이 없으면 기본값이 반환된다.
                      기본값은 생략 가능하다.
    * decode함수는 컬럼의 값과 비교값간의 equals 비교만 가능하다.

case ~ when 표현식
    case
        when 조건식1 then 값1
        when 조건식2 then 값2
        when 조건식3 then 값3
        else 값4
    end
    * 조건식이 true로 판정되면 then의 값이 최종값이 된다.
    * 모든 조건식이 false로 판정되면 else의 값4가 최종값이 된다.
    * 조건식에서는 =, >, >=, <, <=, != 등의 다양한 연산자를 사용해서 조건식을 작성할 수 있다.
    * decode함수에 비교했을 때 더 다양한 조건을 적용할 수 있다.
    
    case 컬럼
        when 비교값1 then 값1
        when 비교값2 then 값2
        when 비교값3 then 값3
        else 값4
    end
    * 지정된 컬럼의 값이 비교값들 중 하나와 일치하면 해당 then의 값이 최종값이 된다.
    * 모든 비교값과 일치하지 않으면 else의 값4가 최종값이 된다.
    * decode 함수와 기능면에서 동일하다.
*/

-- 모든 직원테이블에서 급여가 5000이하면 보너스를 1000지급하고, 
--                  급여가 10000이하면 보너스를 2000지급하고, 
--                  그 외는 3000을 지급한다.
-- 모든 직원에 대해서 직원아이디, 이름, 급여, 보너스를 조회하기
select employee_id, first_name, salary, 
    case
        when salary <= 5000 then 1000
        when salary <= 10000 then 2000
        else 3000
    end bonus
from employees;

-- 모든 직원에 대해서 부서아이디를 기준으로 팀을 지정하기, 
-- 10, 20, 30번 부서는 A팀, 40, 50, 60번 부서는 B팀, 그 외는 C팀
-- 직원아이디, 이름, 부서아이디, 팀명을 조회하기
select employee_id, first_name, department_id,
    case
        when department_id in (10, 20, 30) then 'A'
        when department_id in (40, 50, 60) then 'B'
        else 'C'
    end as team
from employees;

-- 지역테이블에서 지역아이디별로 지역명을 조회하기
-- 1은 유럽, 2는 아메리카, 3은 아시아, 4는 아프리카 및 중동
select region_id,
    case
        when region_id = 1 then '유럽'
        when region_id = 2 then '아메리카'
        when region_id = 3 then '아시아'
        when region_id = 4 then '아프리카 및 중동'
    end region_name
from regions;

select region_id,
    case region_id
        when 1 then '유럽'
        when 2 then '아메리카'
        when 3 then '아시아'
        when 4 then '아프리카 및 중동'
    end region_name
from regions;

-- decode를 이용해서
-- 지역테이블에서 지역아이디별로 지역명을 조회하기
-- 1은 유럽, 2는 아메리카, 3은 아시아, 4는 아프리카 및 중동
select region_id,
    decode(region_id, 1, '유럽',
                      2, '아메리카',
                      3, '아시아',
                      4, '아프리카 및 중동') as region_name
from regions;

-- 부서테이블에서 부서아이디, 부서명, 관리자이름을 조회하기
-- 관리자가 지정되어 있지 않으면 없음으로 조회된다.
-- then에 select 구문을 적을 수 있다.
-- 값 부분에 select 구문을 사용하여 값을 조회하는 경우, 값이 하나만 반환되어야 한다.
-- 값의 타입은 모두 동일해야 한다.
select B.department_id, B.department_name, 
    case
        when B.manager_id is not null then (select A.first_name 
                                            from employees A 
                                            where A.employee_id = B.manager_id)
        else '없음'
    end manager_name
from departments B;

