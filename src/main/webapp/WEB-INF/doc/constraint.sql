--costraint.sql
1) 테이블 생성
CREATE TABLE department(
  no    NUMBER(10)  NOT NULL,
  name VARCHAR(100)  NOT NULL,
  PRIMARY KEY(no)
);
2) 제약 조건 확인
SELECT constraint_name, constraint_type, search_condition
FROM ALL_CONSTRAINTS
WHERE TABLE_NAME='DEPARTMENT';

CONSTRAINT_NAME                C SEARCH_CONDITION                                                                
------------------------------ - --------------------------------------------------------------------------------
SYS_C007483                    C "NO" IS NOT NULL                                                                
SYS_C007484                    C "NAME" IS NOT NULL                     
SYS_C007485                    P

3) 제약 조건의 삭제
ALTER TABLE department DROP CONSTRAINT SYS_C007485;
CONSTRAINT_NAME                C SEARCH_CONDITION                                                                

SELECT constraint_name, constraint_type, search_condition
FROM ALL_CONSTRAINTS
WHERE TABLE_NAME='DEPARTMENT';

------------------------------ - --------------------------------------------------------------------------------
SYS_C007483                    C "NO" IS NOT NULL                                                                
SYS_C007484                    C "NAME" IS NOT NULL                     

4) 제약 조건의 추가
ALTER TABLE department ADD CONSTRAINT department_pk PRIMARY KEY (no);

5)FK 테이블 생성
DROP TABLE employee;
CREATE TABLE employee(
  empno    NUMBER(10)  NOT NULL,    -- PK
  no    NUMBER(10)  NOT NULL,    -- FK
  name VARCHAR(100)  NOT NULL,

  PRIMARY KEY(empno)
);

6) FK 추가
ALTER TABLE employee ADD CONSTRAINT employee_department_fk 
                                 FOREIGN KEY (no) REFERENCES department (no);
                                 
SELECT constraint_name, constraint_type, search_condition
FROM ALL_CONSTRAINTS
WHERE TABLE_NAME='EMPLOYEE';

CONSTRAINT_NAME                          C         SEARCH_CONDITION                                                                
------------------------------                   - --------------------------------------------------------------------------------
EMPLOYEE_DEPARTMENT_FK                R                                                                                 
SYS_C007490                                    C             "EMPNO" IS NOT NULL                                                             
SYS_C007491                                    C             "NO" IS NOT NULL                                                                
SYS_C007492                                    C             "NAME" IS NOT NULL                                                              
SYS_C007493                                    P                         




-- 참고: FK 선언 없이 테이블 생성후 하나의 마스터 레코드(최초 등록) 입력후
-- FK 제약 조건 추가             
-- 기본으로 만들어진 제약조건의 삭제
ALTER TABLE position DROP CONSTRAINT SYS_C007481;

ALTER TABLE position ADD CONSTRAINT position_pk PRIMARY KEY (positionno);

ALTER TABLE position ADD CONSTRAINT position_officer_fk 
                                 FOREIGN KEY (officer) REFERENCES position (positionno);