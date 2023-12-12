/*
내포된 SQL문의 구분
    서브쿼리 : WHERE절이나 HAVING절에서 조건식에 사용되는 값을 제공하는 SQL문
    인라인뷰 : FROM절에서 가상의 테이블(가상의 테이블을 보통 뷰라고 한다.)을 제공하는 SQL문 
    스칼라 서브쿼리 : SELECT절에서 사용되는 서브쿼리다. 보통 값은 하나만 반환한다.
    -------------------------------------------------------------------------> 내포된 SQL문이 메인쿼리와 관련이 없다. *별개)
    상호연관 서브쿼리 : 내포된 SQL문에서 메인쿼리의 컬럼을 참조하는 서브쿼리다.

서브쿼리(SUB QUERY)
    SELECT문 내부에 정의된 SELECT문을 서브쿼리라고 한다.
    서브쿼리는 WHERE절의 조건식에서 사용되는 값을 제공한다.
    * 이 경우에 조건식에서 사용되는 값이 SQL을 실행해야만 획득가능한 값인 경우가 많다.
    
    형식
        SELECT 컬럼, 컬럼
        FROM 테이블명
        WHERE 컬럼명 연산자 (SELECT 컬럼
                           FROM 테이블명
                           [WHERE 조건식])                   
    특징
        한번만 실행된다.
        메인 쿼리보다 먼저 실행된다.
        서브 쿼리와 실행결과가 메인 쿼리의 조건식에서 사용된다.
    주의사항
        서브쿼리는 반드시 괄호안에 작성한다.
        서브쿼리는 조건식의 오른쪽에 위치시켜서 가독성을 높인다.
        서브쿼리의 실행결과가 단일행인지 다중행인지 조사해서 적절한 연산자를 사용한다.
*/

-- 전체 직원의 평균급여보다 급여를 많이 받는 직원의 아이디, 이름, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > 평균급여;   -- 평균급여를 제공하는 서브쿼리가 필요한다.

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY)
                FROM EMPLOYEES);
                
-- B등급의 최고급여보다 급여를 적게받는 직원의 아이디, 이름, 급여를 조회하기   
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < B등급의 최고급여; 

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < (SELECT MAX_SALARY
                 FROM SALARY_GRADES
                 WHERE GRADE = 'B');
                
-- 60번부서의 직원과 같은 해에 입사한 직원들의 아이디, 이름, 입사일을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY')IN (SELECT DISTINCT TO_CHAR(HIRE_DATE, 'YYYY')
                                    FROM EMPLOYEES
                                    WHERE DEPARTMENT_ID = 60);
                
