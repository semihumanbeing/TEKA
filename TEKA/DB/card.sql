create table card
(
	c_idx		int,					--카드번호
	c_prefer	int,					--카드추천수
	c_name		varchar2(30),			--카드제목
	s_idx		int,					--주제번호
	m_idx		int						--작성자멤버번호
)


create sequence seq_c_idx

--기본키
alter table card 
add constraint pk_c_idx primary key(c_idx)


--외래키
alter table card 
add constraint fk_c_s_idx foreign key(s_idx) references subject(s_idx)


alter table card 
add constraint fk_c_m_idx foreign key(m_idx) references member3(m_idx)



--외래키 삭제함. 카드 테이블에는 필요없음.
alter table card 
add constraint fk_c_q_idx foreign key(q_idx) references qna(q_idx)

ALTER TABLE card DROP CONSTRAINT fk_c_q_idx;

--컬럼도 삭제함 애초에 필요없는 데이터임
ALTER TABLE card DROP COLUMN q_idx;



select * from card

insert into card values(seq_c_idx.nextVal, 0, '자바완전정복!', 30, 1);
insert into card values(seq_c_idx.nextVal, 0, '운영체제별거없지!', 20, 4);

-- qna(left) card(right) left outer join
create or replace view qnacard
as
select * from qna t1
left outer join card t2
using (c_idx)

select * from qnacard
