/**********************************/
/* Table Name: 컨텐츠 */
/**********************************/
DROP TABLE contents;
CREATE TABLE contents(
		contentsno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                          NUMBER(10)		 NULL ,
		cateno                    	      	NUMBER(10)		 NULL ,
		title                         		    VARCHAR2(300)   NOT NULL,
		content                       		CLOB		             NOT NULL,
		recom                         		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		cnt                           		   NUMBER(7)		 DEFAULT 0		 NOT NULL,
		replycnt                      		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		web                           		VARCHAR2(500)		 NULL ,
		map                           		VARCHAR2(1000)		 NULL ,
		youtube                       		VARCHAR2(1000)		 NULL ,
		mp3                           		VARCHAR2(1000)		 NULL ,
		mp4                           		VARCHAR2(1000)		 NULL ,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		ip                            		VARCHAR2(15)		 NULL ,
		passwd                        		VARCHAR2(15)		 NOT NULL,
		grpno                         		NUMBER(8)		 DEFAULT 0		 NOT NULL,
		indent                        	     	NUMBER(2)		 DEFAULT 0		 NOT NULL,
		ansnum                        		NUMBER(3)		 DEFAULT 0		 NOT NULL,
		word                          		VARCHAR2(300)		 NULL ,
        rdate                                  DATE              NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (cateno) REFERENCES cate (cateno)
);

COMMENT ON TABLE contents is '컨텐츠';
COMMENT ON COLUMN contents.contentsno is '컨텐츠 번호';
COMMENT ON COLUMN contents.cateno is '카테고리 번호';
COMMENT ON COLUMN contents.memberno is '회원 번호';
COMMENT ON COLUMN contents.title is '제목';
COMMENT ON COLUMN contents.content is '내용';
COMMENT ON COLUMN contents.recom is '추천수';
COMMENT ON COLUMN contents.cnt is '조회수';
COMMENT ON COLUMN contents.replycnt is '댓글수';
COMMENT ON COLUMN contents.web is '인터넷 주소';
COMMENT ON COLUMN contents.map is '지도';
COMMENT ON COLUMN contents.youtube is 'Youtube';
COMMENT ON COLUMN contents.mp3 is 'MP3';
COMMENT ON COLUMN contents.mp4 is 'MP4';
COMMENT ON COLUMN contents.visible is '출력 모드';
COMMENT ON COLUMN contents.ip is 'IP';
COMMENT ON COLUMN contents.passwd is '패스워드';
COMMENT ON COLUMN contents.grpno is '그룹번호';
COMMENT ON COLUMN contents.indent is '들여쓰기/답변차수';
COMMENT ON COLUMN contents.ansnum is '답변순서';
COMMENT ON COLUMN contents.word is '검색어';
COMMENT ON COLUMN contents.rdate is '등록일';

CREATE SEQUENCE contents_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE  9999999     -- 최대값: 9999999--> NUMBER(7) 대응
  CACHE  2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                    -- 다시 1부터 생성되는 것을 방지
  
DROP SEQUENCE contents_seq;

1) 글 등록
INSERT INTO contents(contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate)
VALUES(contents_seq.nextval, 1, 1, '신규확진 2명', '전원 입국검역서 확인', 'http://www.daum.net',
            '127.0.0.1', '123', '코로나', sysdate);

INSERT INTO contents(contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate)
VALUES(contents_seq.nextval, 1, 1, '신규확진 1명', '전원 입국검역서 확인', 'http://www.daum.net',
            '127.0.0.1', '123', '코로나', sysdate);
            
INSERT INTO contents(contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate)
VALUES(contents_seq.nextval, 1, 1, '신규확진 0명', '종식', 'http://www.daum.net',
            '127.0.0.1', '123', '코로나', sysdate);

-- 에러 memberno FK가 1밖에없어서 2가 안만들어짐            
INSERT INTO contents(contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate)
VALUES(contents_seq.nextval, 2, 1, '신규확진 0명', '종식', 'http://www.daum.net',
            '127.0.0.1', '123', '코로나', sysdate);
            
SELECT contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate
FROM contents 
ORDER BY contentsno ASC;    

COMMIT;

--2) 목록 (오름차순)
SELECT contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate 
FROM contents 
ORDER BY contentsno DESC;    

3) 조회
SELECT contentsno, memberno, cateno, title, content, recom, web, ip, passwd, word, rdate 
FROM contents 
WHERE contentsno = 1;

4) 수정
UPDATE contents
SET title='제목', content='내용', web='http//', word='검색어'
WHERE contentsno=1;

COMMIT;

5) 패스워드 검사
SELECT COUNT(*) as passwd_cnt
FROM contents
WHERE contentsno =1 AND passwd='1234';

6) 삭제
DELETE FROM contents
WHERE contentsno = 4;

commit;

7) 모든 레코드 갯수
SELECT COUNT(*) as cnt
FROM contents;
 