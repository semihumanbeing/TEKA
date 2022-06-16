create table subject
(
	s_idx		int,				--林力锅龋
	s_name		varchar2(20)		--林力疙
)

create sequence seq_s_idx

alter table subject
add constraint pk_s_idx primary key(s_idx)


insert into subject values(10, '匙飘况农');
insert into subject values(20, '款康眉力');
insert into subject values(30, 'Java');
insert into subject values(40, 'DB');

select * from subject

commit
