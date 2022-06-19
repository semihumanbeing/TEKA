create table card
(
	c_idx		int,					--ī���ȣ
	c_prefer	int,					--ī����õ��
	c_name		varchar2(30),			--ī������
	s_idx		int,					--������ȣ
	m_idx		int						--�ۼ��ڸ����ȣ
)


create sequence seq_c_idx

--�⺻Ű
alter table card 
add constraint pk_c_idx primary key(c_idx)


--�ܷ�Ű
alter table card 
add constraint fk_c_s_idx foreign key(s_idx) references subject(s_idx)


alter table card 
add constraint fk_c_m_idx foreign key(m_idx) references member3(m_idx)



--�ܷ�Ű ������. ī�� ���̺��� �ʿ����.
alter table card 
add constraint fk_c_q_idx foreign key(q_idx) references qna(q_idx)

ALTER TABLE card DROP CONSTRAINT fk_c_q_idx;

--�÷��� ������ ���ʿ� �ʿ���� ��������
ALTER TABLE card DROP COLUMN q_idx;



select * from card

insert into card values(seq_c_idx.nextVal, 0, '�ڹٿ�������!', 30, 1);
insert into card values(seq_c_idx.nextVal, 0, '�ü�����ž���!', 20, 4);

-- qna(left) card(right) left outer join
create or replace view qnacard
as
select * from qna t1
left outer join card t2
using (c_idx)

select * from qnacard
