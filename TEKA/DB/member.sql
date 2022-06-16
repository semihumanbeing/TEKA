create table member3 
(
	m_idx		int,							--�����ȣ
	m_id		varchar2(30) not null,			--���̵�
	m_nickname	varchar2(30) not null,			--�г���
	m_birthdate	date		 not null,			--�������
	m_email		varchar2(30) not null,			--�̸���
	m_pwd		varchar2(30) not null			--��й�ȣ
)

create sequence seq_m_idx

alter table member3
add constraint pk_member3 primary key(m_idx)

select * from member3

insert into member3 values(seq_m_idx.nextVal, 'yhn032', 'ȫ�浿', '1999-04-10', 'yhn032@naver.com', 'yhn032');
insert into member3 values(seq_m_idx.nextVal, 'yhn033', '�ϱ浿', '1989-12-12', 'yhn033@daum.net', 'khn033');
insert into member3 values(seq_m_idx.nextVal, 'yhn034', '�̱浿', '1979-03-15', 'yhn034@nate.com', 'two034');
insert into member3 values(seq_m_idx.nextVal, 'yhn035', '��浿', '2012-08-20', 'yhn035@naver.com', 'thr035');
