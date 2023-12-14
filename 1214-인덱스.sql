/*
인덱스(색인)
    데이터 검색 속도를 향상시키기 위해서 사용되는 데이터베이스 객체다.
    인덱스에는 컬럼의 값과 ROWID(데이터의 저장위치 정보)가 저장되어 있다.
    *ROWID는 데이터행이 저장된 파일번호/블록번호/슬롯번호를 포함하고 있다.
    인덱스는 테이블과 독립적으로 존재하고, 한번 생성된 인덱스는 자동으로 유지된다.
    
    인덱스 생성
        자동생성
            PRIMARY KEY, UNIQUE 제약조건이 적용된 컬럼은 자동으로 색인이 생성된다.        
        수동생성
            WHERE절에 조건식으로 자주 등장하는 컬럼은 조회 성능을 향상시키기 위해서 
            해당 컬럼에 대한 인덱스를 생성할 수 있다.
            
    인덱스 생성이 유리한 경우
        + WHERE절에 조건식으로 자주 등장하는 경우 인덱스로 생성하자.
        + 컬럼에 매우 다양한 값을 포함하고 있다면 인덱스를 생성하자.
        + 데이터가 매우 많은 테이블을 대상으로 데이터를 조회했을 때 조회작업을 할 때마다 
          전체 데이터의 2% 미만으로 데이터가 조회되는 경우 해당 컬럼을 인덱스로 생성하자.
*/

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 200;

SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME = 'Neena';

-- 인텍스 생성하기
CREATE INDEX EMP_FIRSTNAME_IDX
ON EMPLOYEES (FIRST_NAME);

