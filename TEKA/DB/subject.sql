create table subject
(
	s_idx		int,				--������ȣ
	s_name		varchar2(20)		--������
)

create sequence seq_s_idx

alter table subject
add constraint pk_s_idx primary key(s_idx)


insert into subject values(10, '��Ʈ��ũ');
insert into subject values(20, '�ü��');
insert into subject values(30, 'Java');
insert into subject values(40, 'DB');

select * from subject

commit
