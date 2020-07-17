--costraint.sql
1) ���̺� ����
CREATE TABLE department(
  no    NUMBER(10)  NOT NULL,
  name VARCHAR(100)  NOT NULL,
  PRIMARY KEY(no)
);
2) ���� ���� Ȯ��
SELECT constraint_name, constraint_type, search_condition
FROM ALL_CONSTRAINTS
WHERE TABLE_NAME='DEPARTMENT';

CONSTRAINT_NAME                C SEARCH_CONDITION                                                                
------------------------------ - --------------------------------------------------------------------------------
SYS_C007483                    C "NO" IS NOT NULL                                                                
SYS_C007484                    C "NAME" IS NOT NULL                     
SYS_C007485                    P

3) ���� ������ ����
ALTER TABLE department DROP CONSTRAINT SYS_C007485;
CONSTRAINT_NAME                C SEARCH_CONDITION                                                                

SELECT constraint_name, constraint_type, search_condition
FROM ALL_CONSTRAINTS
WHERE TABLE_NAME='DEPARTMENT';

------------------------------ - --------------------------------------------------------------------------------
SYS_C007483                    C "NO" IS NOT NULL                                                                
SYS_C007484                    C "NAME" IS NOT NULL                     

4) ���� ������ �߰�
ALTER TABLE department ADD CONSTRAINT department_pk PRIMARY KEY (no);

5)FK ���̺� ����
DROP TABLE employee;
CREATE TABLE employee(
  empno    NUMBER(10)  NOT NULL,    -- PK
  no    NUMBER(10)  NOT NULL,    -- FK
  name VARCHAR(100)  NOT NULL,

  PRIMARY KEY(empno)
);

6) FK �߰�
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




-- ����: FK ���� ���� ���̺� ������ �ϳ��� ������ ���ڵ�(���� ���) �Է���
-- FK ���� ���� �߰�             
-- �⺻���� ������� ���������� ����
ALTER TABLE position DROP CONSTRAINT SYS_C007481;

ALTER TABLE position ADD CONSTRAINT position_pk PRIMARY KEY (positionno);

ALTER TABLE position ADD CONSTRAINT position_officer_fk 
                                 FOREIGN KEY (officer) REFERENCES position (positionno);