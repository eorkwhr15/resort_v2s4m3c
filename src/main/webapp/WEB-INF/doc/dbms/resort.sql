/**********************************/
/* Table Name: 카테고리 그룹 */
/**********************************/
CREATE TABLE categrp(
		categrpno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(50)		 NOT NULL,
		seqno                         		NUMBER(7)	 DEFAULT 0 NOT NULL,
		visible                       		CHAR(1)	 DEFAULT 'Y' NOT NULL,
		rdate                         		DATE		 NULL 
);

DROP TABLE categrp;

COMMENT ON TABLE categrp is '카테고리 그룹';
COMMENT ON COLUMN categrp.categrpno is '카테고리 그룹 번호';
COMMENT ON COLUMN categrp.name is '이름';
COMMENT ON COLUMN categrp.seqno is '출력 순서';
COMMENT ON COLUMN categrp.visible is '출력 모드';
COMMENT ON COLUMN categrp.rdate is '카테고리 그룹 생성일';


CREATE SEQUENCE categrp_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE  9999999     -- 최대값: 9999999--> NUMBER(7) 대응
  CACHE  2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                    -- 다시 1부터 생성되는 것을 방지

DROP SEQUENCE categrp_seq;

-- insert
INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '영화', 1, 'Y', sysdate);

INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '여행', 2, 'Y', sysdate);

INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '캠핑', 3, 'Y', sysdate);

-- list
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
ORDER BY categrpno ASC;

 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 국내 여행                                                   1 Y 2020-04-17 04:49:02
         2 해외 여행                                                   2 Y 2020-04-17 04:49:02
         3 개발 자료                                                   3 Y 2020-04-17 04:49:02
         
         
SELECT * from categrp
where categrpno = 5;


-- 1번 레코드 name 수정
UPDATE categrp
SET name ='영화'
where categrpno = 1;

-- 1번 레코드 seqno 수정
UPDATE categrp
SET seqno= 4
where categrpno = 1;

-- 1번 레코드 visible 수정
UPDATE categrp
SET visible='N'
where categrpno = 1;

-- 수정
UPDATE categrp
SET name='식당', seqno= 10, visible='N'
where categrpno = 5;

commit;

-- 1번 레코드 삭제
DELETE FROM categrp 
WHERE categrpno = 1;

-- 레코드 갯수
SELECT COUNT(*) as cnt
FROM categrp;


-- 출력 순서에따른 전체 목록
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
ORDER BY seqno ASC;
 
-- 출력 순서 상향, 10 ▷ 1
UPDATE categrp
SET seqno = seqno - 1
WHERE categrpno=1;
 
-- 출력순서 하향, 1 ▷ 10
UPDATE categrp
SET seqno = seqno + 1
WHERE categrpno=1;