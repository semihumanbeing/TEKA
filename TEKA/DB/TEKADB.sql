--/// 1. 카드 (게시글)
create table card
(
	c_idx      int,               			 -- 카드번호
	c_title    varchar2(1000) not null, 	 -- 카드제목
	c_content  varchar2(1000) not null, 	 -- 카드소개글
	c_isPublic varchar2(30) default('공개'), -- 공개여부
	s_idx      int,                          -- 주제번호
	m_idx      int,                  	     -- 작성자인덱스
	c_regdate varchar2(100) not null 		 -- 카드등록일자
	c_qCnt	   int							 -- 카드에 포함된 질문 개수
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
	

--각 카드의 전체 질문 수 컬럼 추가 & 제한 조건 설정
alter table card add c_qCnt int				--추가
alter table card modify c_qCnt not null		--제한조건(null은 add가 아닌 modify로 추가한다.)
-- 삭제
drop table card
drop sequence seq_c_idx


--샘플데이터
insert into card values(seq_c_idx.nextVal, '자바인생', '자바자바', default, 5, 4, sysdate);
insert into card values(seq_c_idx.nextVal, '안녕안녕', '안뇽뇽뇽', default, 5, 4, sysdate);
insert into card values(seq_c_idx.nextVal, '홍길동동', '길동길동', default, 5, 4, sysdate);
insert into card values(seq_c_idx.nextVal, '네트워크', 'OSI-7Layer', default, 2, 1, sysdate);

select * from card


--on delete cascade


--/////////////////////////////////////////////////////////////////////////////////

--/// 2. 내 학습세트에 추가
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

select * from mycardset



--/////////////////////////////////////////////////////////////////////////////////

--3. 질문&답변 테이블
create table qna
(
   q_idx        int,                         --질문번호
   c_idx        int,                         --카드번호
   q_question   varchar2(1000) not null,     --질문
   q_answer     varchar2(1000) not null,     --답변
   q_correct	varchar2(20)   default 'false' --정답여부(false:정답. true:오답)
)

--시퀀스
create sequence seq_q_idx

--기본키 
alter table qna
add constraint pk_qna_q_idx primary key(q_idx)

--외래키 
alter table qna
add constraint fk_qna_card foreign key(c_idx) references card(c_idx)

--컬럼추가
alter table qna drop column q_correct
alter table qna add q_correct varchar2(20) default('false')
alter table qna
   add constraint check_qna_q_correct check(q_correct in ('false', 'true'))
--삭제
drop table qna
drop sequence seq_q_idx


--샘플데이터
insert into qna values(seq_q_idx.nextVal, 1, '자바란?', '자바칩프라푸치노', default);
insert into qna values(seq_q_idx.nextVal, 1, '객체지향', 'Object Oriented Programming', default);
insert into qna values(seq_q_idx.nextVal, 1, 'JVM', '자바가상머신', default);
insert into qna values(seq_q_idx.nextVal, 1, '인터페이스', '사용설명서', default);
insert into qna values(seq_q_idx.nextVal, 1, '추상화', '공통기능묶기', default);
insert into qna values(seq_q_idx.nextVal, 1, '캡슐화', '넌 쓰는법만 알면 돼!', default);
insert into qna values(seq_q_idx.nextVal, 1, '오토박싱', '제가 객체로 감싸드려요', default);

select * from qna


--/////////////////////////////////////////////////////////////////////////////////

--4. 멤버테이블
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


select * from tekamember






--/////////////////////////////////////////////////////////////////////////////////

--5. 주제테이블
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

select * from subject




--/////////////////////////////////////////////////////////////////////////////////

--6. 좋아요
--시퀀스
create sequence seq_like_l_grade

create table likey
(
   l_idx int,             --추천번호(PK) 
   l_like  int default 0, --카드추천수
   c_idx   int,           --카드번호(FK)
   m_idx   int            --멤버번호(FK)
)

--외래키
alter table likey
   add constraint fk_likey_c_idx foreign key(c_idx) references card(c_idx)

alter table likey
   add constraint fk_likey_m_idx foreign key(m_idx) references tekamember(m_idx)

alter table likey rename column l_grade to l_idx
-- 테이블 생성 이후 default 표현식 추가 / 변경
alter table 테이블명
modify 컬럼명[자료형] default 기본값

-- 테이블 생성 이후 deault 표현식 제거(삭제)
alter table 테이블명
modify 컬럼명[자료형] default null


--샘플데이터
insert into likey values(seq_like_l_grade.nextVal, default, 1, 4);
select * from likey 


-- 뷰   
--/////////////////////////////////////////////////////////////////////////////////

-- 1. 카드테이블 + 멤버테이블 + 좋아요테이블 + 주제테이블
create or replace view likedCard
as
	select
		c_idx, c_title, c_content, c_isPublic, c_regdate,	
      	m_nickname,											
        l_like, 											
        s_name	
    from card c join tekamember m using(m_idx)
    	join likey l using(c_idx)
    	join subject s using(s_idx)

select * from likedCard
    	
-- 2. 카드테이블 + 멤버테이블 + 주제테이블
create or replace view subjectCard
as
	select
		c_idx, c_title, c_content, c_isPublic, c_regdate,		
      	m_nickname,											
        s_name, s_idx	
    from card c join tekamember m using(m_idx)
    	join subject s using(s_idx)		

select * from subjectCard

--뷰에 s_idx추가!
drop view subjectCard

-- 3. 카드테이블 + 멤버테이블 + 주제테이블
create or replace view qnaCard
as
select q_idx, c_idx, q_question, q_answer, q_correct,
      c_title, c_content, c_isPublic,
      s_idx, m_idx, c_regdate
   from qna q join card c    using(c_idx)
              join subject s using(s_idx)

select * from qnaCard



--4. 내 학습세트 조회용 : 카드 테이블 + 주제 테이블 + 나의 카드셋 + 멤버
create or replace view studyCard
as
	select
		c_idx, c_title, c_regdate, c_content, c_qCnt,
		mc_idx,
		m_idx, m_nickname,
		s_idx, s_name
	from card c join tekamember m using(m_idx)
				join subject s using(s_idx)
				join mycardset mc using(c_idx)

select * from studyCard
	