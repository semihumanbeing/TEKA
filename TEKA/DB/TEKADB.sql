--/// 카드 (게시글)
create table card
(
	c_idx      int,               			 -- 카드번호
	c_title    varchar2(1000) not null, 	 -- 카드제목
	c_content  varchar2(1000) not null, 	 -- 카드소개글
	c_isPublic varchar2(30) default('공개'), -- 공개여부
	s_idx      int,                          -- 주제번호
	m_idx      int,                  	     -- 작성자인덱스
	c_regdate varchar2(100) not null 		 -- 카드등록일자
)

-- 시퀀스 
create sequence seq_c_idx

-- 카드번호 기본키
alter table card
	add constraint pk_c_idx_card primary key(c_idx);
	
-- 주제번호 외래키
alter table card
	add constraint fk_s_idx_card foreign key(s_idx)
	references subject(s_idx)
	
-- 작성자인덱스 외래키
alter table card
	add constraint fk_m_idx_card foreign key(m_idx)
	references tekamember(m_idx)
	
-- 삭제
drop table card
drop sequence seq_c_idx


--샘플데이터
insert into card values(seq_c_idx.nextVal, '자바인생', '자바자바', default, 5, 4, sysdate);
insert into card values(seq_c_idx.nextVal, '안녕안녕', '안뇽뇽뇽', default, 5, 4, sysdate);
insert into card values(seq_c_idx.nextVal, '홍길동동', '길동길동', default, 5, 4, sysdate);






--/////////////////////////////////////////////////////////////////////////////////

--/// 내 학습세트에 추가
create table mycardset
(
	mc_idx int, -- 내 카드번호
	s_idx  int, -- 주제번호
	m_idx  int, -- 학습자 멤버번호
	c_idx  int  -- 카드(게시글)번호
)
-- 내 카드번호 시퀀스 
create sequence seq_mc_idx

-- 내 카드번호 기본키
alter table mycardset
	add constraint mc_idx_pk_mycardset primary key(mc_idx)

-- 주제번호 외래키
alter table mycardset
	add constraint fk_s_idx_mycardset foreign key(s_idx)
	references subject(s_idx)
	
-- 학습자 멤버번호 외래키
alter table mycardset
	add constraint fk_m_idx_mycardset foreign key(m_idx)
	references tekamember(m_idx)
	
-- 카드(게시글)외래키
alter table mycardset
	add constraint fk_c_idx_mycardset foreign key(c_idx)
	references card(c_idx)

-- 삭제
drop table mycardset





--/////////////////////////////////////////////////////////////////////////////////

--질문&답변 테이블
create table qna
(
   q_idx        int,                        --질문번호
   c_idx        int,                        --카드번호
   q_question   varchar2(1000) not null,    --질문
   q_answer     varchar2(1000) not null     --답변
)

--시퀀스
create sequence seq_q_idx

--기본키 
alter table qna
add constraint pk_qna_q_idx primary key(q_idx)

--외래키 
alter table qna
add constraint fk_qna_card foreign key(c_idx) references card(c_idx)

--삭제
drop table qna
drop sequence seq_q_idx


--샘플데이터
insert into qna values(seq_q_idx.nextVal, 1, '자바란?', '자바칩프라푸치노');
insert into qna values(seq_q_idx.nextVal, 1, '객체지향', 'Object Oriented Programming');
insert into qna values(seq_q_idx.nextVal, 1, 'JVM', '자바가상머신');




--/////////////////////////////////////////////////////////////////////////////////

--오답 질문&답변 테이블
create table wrongqna
(
   w_idx       int,                        --틀린질문번호
   c_idx       int,                        --카드번호
   m_idx       int,                        --학습자 멤버번호
   w_question  varchar2(1000) not null,    --질문
   w_answer    varchar2(1000) not null     --답변
)

--시퀀스
create sequence seq_w_idx

--기본키 
alter table wrongqna
add constraint pk_wrong_w_idx primary key(w_idx)

--외래키 
alter table wrongqna
add constraint fk_wrong_card foreign key(c_idx) references card(c_idx)

alter table wrongqna
add constraint fk_wrong_member foreign key(m_idx) references tekamember(m_idx)

--삭제
drop table wrongqna
drop sequence seq_w_idx





--/////////////////////////////////////////////////////////////////////////////////

-- 멤버테이블
--시퀀스
create sequence seq_tekamember_m_idx

create table tekamember
(
   m_idx      int,                                   --멤버인덱스(PK)
   m_id       varchar2(30)  not null,                --멤버아이디(unique)
   m_pwd      varchar2(30)  not null,                --멤버비번
   m_nickname varchar2(30)  not null,                --멤버닉네임(unique)
   m_email    varchar2(100) not null,                --멤버이메일(unique)
   m_grade    varchar2(30)  default '일반' not null  --멤버등급
)

--기본키
alter table tekamember
   add constraint pk_tekamember_m_idx primary key(m_idx);

--유니크
alter table tekamember
add constraint unique_tekamember_m_nickname unique(m_nickname);
   
alter table tekamember
add constraint unique_tekamember_m_email unique(m_email);

--체크
alter table tekamember
   add constraint check_tekamember_m_grade check(m_grade in ('일반', '관리자'))


select * from tekamember

--샘플데이터
insert into tekamember values(seq_tekamember_m_idx.nextVal, 'one',  '1111', '일길동', 'one@naver.com', default);
insert into tekamember values(seq_tekamember_m_idx.nextVal, 'two',  '2222', '이길동', 'two@naver.com', default);
insert into tekamember values(seq_tekamember_m_idx.nextVal, 'hong', '3333', '홍길동', 'hong@naver.com', '관리자');





--/////////////////////////////////////////////////////////////////////////////////

--주제테이블
create table subject
(
   s_idx  int,                   --주제번호(PK)
   s_name varchar2(30) not null  --주제명
)

--기본키
alter table subject
   add constraint pk_subject_s_idx primary key(s_idx);

--데이터
insert into subject values(1, '운영체제');   
insert into subject values(2, '네트워크');   
insert into subject values(3, '알고리즘');   
insert into subject values(4, '자료구조');   
insert into subject values(5, '자바');   
insert into subject values(6, '스프링');   






--/////////////////////////////////////////////////////////////////////////////////

--좋아요
--시퀀스
create sequence seq_like_l_grade

create table likey
(
   l_grade int,           --추천번호(PK) 
   l_like  int default 0, --카드추천수
   c_idx   int,           --카드번호(FK)
   m_idx   int            --멤버번호(FK)
)

--외래키
alter table likey
   add constraint fk_likey_c_idx foreign key(c_idx) references card(c_idx)

alter table likey
   add constraint fk_likey_m_idx foreign key(m_idx) references tekamember(m_idx)

-- 테이블 생성 이후 default 표현식 추가 / 변경
alter table 테이블명
modify 컬럼명[자료형] default 기본값

-- 테이블 생성 이후 deault 표현식 제거(삭제)
alter table 테이블명
modify 컬럼명[자료형] default null


--샘플데이터
insert into likey values(seq_like_l_grade.nextVal, default, 1, 4);
   
   
-- 뷰   
--/////////////////////////////////////////////////////////////////////////////////

-- 카드테이블 + QnA테이블 + 좋아요테이블
create or replace view qnaCard
as
	select
	  --카드
		c_idx, c_title, c_content, c_idPublic, m_idx,
      --qna
      	q_idx, q_question, q_answer,
      --좋아요
        c_like
    from card c, qna q, likey l
--살려주세요   
		
		
		
		
