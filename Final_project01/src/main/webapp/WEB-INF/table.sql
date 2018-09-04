	--테이블 목록
	
--사용자 계정
CREATE TABLE users
(id VARCHAR2(100) PRIMARY KEY,
pwd VARCHAR2(100) NOT NULL,
email VARCHAR2(100),
regdate DATE);

--파일 업로드
CREATE TABLE board_file(
num NUMBER PRIMARY KEY, -- 파일번호
writer VARCHAR2(100), -- 작성자
title VARCHAR2(100), -- 제목
content VARCHAR2(1000),
orgFileName VARCHAR2(100), -- 원본파일명
saveFileName VARCHAR2(100), -- 파일 시스템에 저장된 파일명
fileSize NUMBER, -- 파일의 크기(byte)
downCount NUMBER DEFAULT 0, -- 다운로드 횟수
regdate DATE -- 등록일 
);

CREATE SEQUENCE board_file_seq;

drop SEQUENCE board_file_seq;
drop TABLE board_file;

--사진 업로드
CREATE TABLE board_gallery(
num NUMBER PRIMARY KEY,
writer VARCHAR2(100),
caption VARCHAR2(200),
imagePath VARCHAR2(100),
regdate DATE
);

CREATE SEQUENCE board_gallery_seq;

--게시글
CREATE TABLE board_cafe(
num NUMBER PRIMARY KEY,
writer VARCHAR2(100) NOT NULL,
title VARCHAR2(100) NOT NULL,
content CLOB,
viewCount NUMBER,
regdate DATE
);

CREATE SEQUENCE board_cafe_seq;


--댓글 정보를 저장할 테이블
CREATE TABLE board_cafe_comment(
	num NUMBER PRIMARY KEY,	--댓글의 글번호
	writer VARCHAR2(100),	--댓글 작성자
	content VARCHAR2(500),	--댓글 내용
	target_id VARCHAR2(100),--댓글의 대상이 되는 id(글작성자)
	ref_group NUMBER,		--댓글 그룹번호
	comment_group NUMBER,	--원글에 달린 댓글 내에서의 그룹번호
	regdate DATE			--댓글 등록일
);

-- 상품 테이블
CREATE TABLE shop(
	code NUMBER PRIMARY KEY, --상품번호
	writer VARCHAR2(100), -- 판매자
	name VARCHAR2(30), --상품이름
	price NUMBER, --상품가격
	grade NUMBER, --상품평점 (평점/인원수) if 인원수==0, 평점==0(또는 평점을 등록해주세요)	
	remainCount NUMBER CHECK(remainCount >= 0), --재고갯수
	orgFileName VARCHAR2(100), -- 원본파일명
	saveFileName VARCHAR2(100), -- 파일 시스템에 저장된 파일명
	fileSize NUMBER, -- 파일의 크기(byte)
	content VARCHAR2(1000),
	regdate DATE -- 상품등록일 
);

CREATE SEQUENCE shop_seq;

select * from shop;

drop table shop;

-- 고객 계좌 테이블
CREATE TABLE client_account(
	id VARCHAR2(30) PRIMARY KEY, -- 고객의 아이디
	money NUMBER CHECK(money >= 0), -- 고객의 잔고 
	point NUMBER
);

-- 주문 테이블
CREATE TABLE client_order(
	num NUMBER PRIMARY KEY, -- 주문번호
	id VARCHAR2(30), -- 주문 고객의 아이디
	code NUMBER, -- 주문한 상품의 번호 
	addr VARCHAR2(50) -- 배송 주소
);

--주문 테이블에 사용할 시퀀스
CREATE SEQUENCE client_order_seq;


--커뮤니티
CREATE TABLE community_status(
   id VARCHAR2(30) PRIMARY KEY, --아이디
   counselor NUMBER, --지정 상담사 확인 여부
   score NUMBER --내공
);


alter table board_file add(content VARCHAR2(1000));

--카테고리 분류
CREATE TABLE catalog(
	code NUMBER PRIMARY KEY, -- 상품의 번호
	mainCat VARCHAR2(100) NOT NULL,
	secCat VARCHAR2(100),
	thirdCat VARCHAR2(100)	 
);

select * from catalog;

--장바구니
CREATE TABLE basket(
	basket_id NUMBER PRIMARY KEY,	--장바구니 번호
	user_id VARCHAR2(100),	--고객 아이디
	product_id NUMBER,	--상품 코드
	num NUMBER,	--구입 개수(1개이상 구매해야한다)
	regdate DATE
);

CREATE SEQUENCE basket_seq;

--이틀뒤에 장바구니의 내용을 만료시키기 위한 구문
SELECT to_date((select to_char(sysdate,'YYMMDD') FROM DUAL) ,'YYMMDD')+2 validDate FROM dual

--게시글
CREATE TABLE board_customerservice(
num NUMBER PRIMARY KEY,
writer VARCHAR2(100) NOT NULL,
title VARCHAR2(100) NOT NULL,
content CLOB,
viewCount NUMBER,
regdate DATE
);

CREATE SEQUENCE board_customerservice_seq;

--댓글 정보를 저장할 테이블
CREATE TABLE board_customerservice_comment(
   num NUMBER PRIMARY KEY,   --댓글의 글번호
   writer VARCHAR2(100),   --댓글 작성자
   content VARCHAR2(500),   --댓글 내용
   target_id VARCHAR2(100),--댓글의 대상이 되는 id(글작성자)
   ref_group NUMBER,      --댓글 그룹번호
   comment_group NUMBER,   --원글에 달린 댓글 내에서의 그룹번호
   regdate DATE         --댓글 등록일
);

select * from BOARD_FILE where num=21;

--갤러리 업로드
CREATE TABLE gallery(
num NUMBER PRIMARY KEY, -- 파일번호
writer VARCHAR2(100), -- 작성자
title VARCHAR2(100), -- 제목
content VARCHAR2(1000),
orgFileName VARCHAR2(100), -- 원본파일명
saveFileName VARCHAR2(100), -- 파일 시스템에 저장된 파일명
fileSize NUMBER, -- 파일의 크기(byte)
downCount NUMBER DEFAULT 0, -- 다운로드 횟수
regdate DATE -- 등록일 
);

CREATE SEQUENCE gallery_seq;

drop table gallery;

select * from gallery;

drop table board_customerservice_comment;

--게시글
CREATE TABLE board_customerservice(
num NUMBER PRIMARY KEY,
writer VARCHAR2(100) NOT NULL,
title VARCHAR2(100) NOT NULL,
content CLOB,
viewCount NUMBER,
regdate DATE,
choose NUMBER,
secret NUMBER
);

CREATE SEQUENCE board_customerservice_seq;

--댓글 정보를 저장할 테이블
CREATE TABLE board_customerservice_comment(
   num NUMBER PRIMARY KEY,   --댓글의 글번호
   writer VARCHAR2(100),   --댓글 작성자
   content VARCHAR2(500),   --댓글 내용
   target_id VARCHAR2(100),--댓글의 대상이 되는 id(글작성자)
   ref_group NUMBER,      --댓글 그룹번호
   comment_group NUMBER,   --원글에 달린 댓글 내에서의 그룹번호
   regdate DATE         --댓글 등록일
);

--자유 게시판
CREATE TABLE board_free(
num NUMBER PRIMARY KEY,
writer VARCHAR2(100) NOT NULL,
title VARCHAR2(100) NOT NULL,	
content CLOB,
viewCount NUMBER,
grade NUMBER, -- 총점 확인
excellrent NUMBER, -- 평가 점수
good NUMBER, -- 평가 점수
bad NUMBER, -- 평가 점수
regdate DATE
);

CREATE SEQUENCE board_free_seq;