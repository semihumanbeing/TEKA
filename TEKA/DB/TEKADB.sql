--/// 카드 (게시글)
create table card
(
	c_idx int, -- 카드번호
	c_title varchar2(1000) not null, -- 카드제목
	c_content varchar2(1000) not null, -- 카드소개글
	c_isPublic varchar2(30) default('공개'), -- 공개여부
	s_idx int, -- 주제번호
	m_idx int, -- 작성자인덱스
	c_regdate varchar2(100) not null -- 카드등록일자
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
	references member(m_idx)
	
-- 삭제
drop table card
drop sequence seq_c_idx

--/// 내 학습세트에 추가
create table mycardset
(
	mc_idx int, -- 내 카드번호
	s_idx int, -- 주제번호
	m_idx int, -- 학습자 멤버번호
	c_idx int -- 카드(게시글)번호
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
	references member(m_idx)
	
-- 카드(게시글)외래키
alter table mycardset
	add constraint fk_c_idx_mycardset foreign key(c_idx)
	references card

-- 삭제
drop table mycardset

--/////////////////////////////////////////////////////////////////////////////////

--질문&답변 테이블
create table qna
(
   q_idx      int,                        --질문번호
   c_idx      int,                        --카드번호
   q_question   varchar2(1000) not null,         --질문
   q_answer   varchar2(1000) not null            --답변
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



--오답 질문&답변 테이블
create table wrongqna
(
   w_idx      int,                        --틀린질문번호
   c_idx      int,                        --카드번호
   m_idx      int,                        --학습자 멤버번호
   w_question   varchar2(1000) not null,         --질문
   w_answer   varchar2(1000) not null            --답변
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
add constraint fk_wrong_member foreign key(m_idx) references card(m_idx)

--삭제
drop table wrongqna
drop sequence seq_w_idx

--/////////////////////////////////////////////////////////////////////////////////
-- 멤버테이블
--시퀀스
create sequence seq_member_m_idx

create table member
(
   m_idx      int,                                   --멤버인덱스(PK)
   m_id       varchar2(30)  not null,                --멤버아이디(unique)
   m_pwd      varchar2(30)  not null,                --멤버비번
   m_nickname varchar2(30)  not null,                --멤버닉네임(unique)
   m_email    varchar2(100) not null,                --멤버이메일(unique)
   m_grade    varchar2(30)  not null default '일반'  --멤버등급
)

--기본키
alter table member
   add constraint pk_member_m_idx primary key(m_idx);
   
--유니크
alter table member
   add constraint unique unique_member_m_nickname unique(m_nickname);
   
alter table member
add constraint unique unique_member_m_email unique(m_email);


--체크
alter table member
   add constraint check_member_m_grade check(m_grade in ('일반', '관리자'))


select * from member

--샘플데이터
insert into member values(seq_member_m_idx.nextVal, 'one',  '1111', '일길동', 'one@naver.com', default);
insert into member values(seq_member_m_idx.nextVal, 'two',  '2222', '이길동', 'two@naver.com', default);
insert into member values(seq_member_m_idx.nextVal, 'hong', '3333', '홍길동', 'hong@naver.com', '관리자');

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

create table like
(
   l_grade int,           --추천번호(PK) 
   l_like  int default 0, --카드추천수
   c_idx   int,           --카드번호(FK)
   m_idx   int            --멤버번호(FK)
)

--외래키
alter table like
   add constraint fk_like_c_idx foreign key(c_idx) references card(c_idx)

alter table like
   add constraint fk_lick_m_idx foreign key(m_idx) references member(m_idx)
   

   

