/*
사용자와 권한 관리

권한
    특정 SQL문을 실행할 수 있는 권리
    
권한의 종류
    시스템권한
        데이터베이스를 엑세스 할 수 있는 권한
        데이터베이스 관리자만 시스템권한을 부여/회수할 수 있다.
        
    객체권한
        데이터베이스 객체의 내용을 조회/조작할 수 있는 권한
        데이터베이스 객체를 소유하고 있는 사용자가 다른 사용자에게 객체권한을 부여/회수할 수 있다.
        
롤(ROLE)
    사용자에게 부여할 수 있는 권한을 하나로 묶어서 그룹화하고 이름을 부여한 것이다.
    롤을 사용하면 권한의 부여, 회수, 유지관리가 쉬워진다.
    
    대표적인 롤
        CONNECT 롤
            오라클 데이터베이스에 접속할 수 있는 권한(CREATE SESSION 시스템권한)을 포함하고 있는 롤이다.
        RESOURCE 롤
            데이터베이스 객체를 생성/수정/삭제할 수 있는 권한을 포함하고 있는 롤이다.
            일반적으로 가장 많이 사용되는 시스템권한을 포함하고 있는 롤이다.
            * 일반사용자는 CONNECT롤, RESOURCE롤을 포함한다.
        DAB 롤
            데이터베이스를 관리하는 시스템 권한을 대부분 포함하고 있는 롤이다.
            
 권한의 부여와 회수
    시스템 권한의 부여
        GRANT 시스템권한, 시스템권한, ...
        TO 사용자명;
        
        GRANT 롤, 롤, ...
        TO 사용자명;
 
    시스템 권한의 회수
        REVOKE 시스템권한, 롤, ...
        FROM 사용자명;
        
    객체 권한의 부여
        GRANT 객체권한(컬럼명, 컬럼명, ...)
        ON 객체명
        TO 사용자명;
        
    객체 권한의 회수
        REVOKE 객체권한, 객체권한, ...
        ON 객체명
        FROM 사용자명;

사용자 관리
    - 사용자 생성
        CREATE USER 사용자명 IDENTIFIED BY 비밀번호;
        * 사용자명은 대소문자를 구분하지 않는다.
        * 비밀번호는 대소문자를 구분한다.
        
    - 사용자 삭제
        DROP USER 사용자명;
        
    - 사용자 비밀번호 변경
        ALTER USER 사용자명 IDENTIFIED BY 새비밀번호;
        
    - 권한부여
    
    - 권한회수
    
*/

-- 사용자 생성하기
/*
    ORACLE 12C버전부터 사용자명에 C##을 붙이지 않으면 오류가 발생할 수 있다.
    _ORACLE_SCRIPT를 TRUE로 설정하면 C##을 붙이지 않고 사용자를 생성할 수 있다.
*/
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER HTA IDENTIFIED BY ZXCV1234;

-- 사용자에게 시스템 권한 부여하기
-- 시스템권한을 직접 사용자에게 부여하기
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE SEQUENCE
TO HTA;

-- 사용자에게 롤에 호함하고 있는 모든 시스템권한을 부여한다.
GRANT CONNECT, RESOURCE 
TO HTA;

-- HTA 사용자에게 시노님 관련 생성, 삭제 시스템권한을 부여한다.
GRANT CREATE SYNONYM, DROP ANY SYNONYM
TO HTA;

-- CREATE TABLE        자신 소유의 테이블을 생성하는 시스템 권한
-- CREATE ANY TABLE    임의의 소유 테이블을 생성하는 시스템 권한
