/**********************************/
/* Table Name: ī�װ� �׷� */
/**********************************/
CREATE TABLE categrp(
		categrpno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(50)		 NOT NULL,
		seqno                         		NUMBER(7)	 DEFAULT 0 NOT NULL,
		visible                       		CHAR(1)	 DEFAULT 'Y' NOT NULL,
		rdate                         		DATE		 NULL 
);

DROP TABLE categrp;

COMMENT ON TABLE categrp is 'ī�װ� �׷�';
COMMENT ON COLUMN categrp.categrpno is 'ī�װ� �׷� ��ȣ';
COMMENT ON COLUMN categrp.name is '�̸�';
COMMENT ON COLUMN categrp.seqno is '��� ����';
COMMENT ON COLUMN categrp.visible is '��� ���';
COMMENT ON COLUMN categrp.rdate is 'ī�װ� �׷� ������';


CREATE SEQUENCE categrp_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE  9999999     -- �ִ밪: 9999999--> NUMBER(7) ����
  CACHE  2                     -- 2���� �޸𸮿����� ���
  NOCYCLE;                    -- �ٽ� 1���� �����Ǵ� ���� ����

DROP SEQUENCE categrp_seq;

-- insert
INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '��ȭ', 1, 'Y', sysdate);

INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '����', 2, 'Y', sysdate);

INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, 'ķ��', 3, 'Y', sysdate);

-- list
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
ORDER BY categrpno ASC;

 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 ���� ����                                                   1 Y 2020-04-17 04:49:02
         2 �ؿ� ����                                                   2 Y 2020-04-17 04:49:02
         3 ���� �ڷ�                                                   3 Y 2020-04-17 04:49:02
         
         
SELECT * from categrp
where categrpno = 5;


-- 1�� ���ڵ� name ����
UPDATE categrp
SET name ='��ȭ'
where categrpno = 1;

-- 1�� ���ڵ� seqno ����
UPDATE categrp
SET seqno= 4
where categrpno = 1;

-- 1�� ���ڵ� visible ����
UPDATE categrp
SET visible='N'
where categrpno = 1;

-- ����
UPDATE categrp
SET name='�Ĵ�', seqno= 10, visible='N'
where categrpno = 5;

commit;

-- 1�� ���ڵ� ����
DELETE FROM categrp 
WHERE categrpno = 1;

-- ���ڵ� ����
SELECT COUNT(*) as cnt
FROM categrp;


-- ��� ���������� ��ü ���
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
ORDER BY seqno ASC;
 
-- ��� ���� ����, 10 �� 1
UPDATE categrp
SET seqno = seqno - 1
WHERE categrpno=1;
 
-- ��¼��� ����, 1 �� 10
UPDATE categrp
SET seqno = seqno + 1
WHERE categrpno=1;