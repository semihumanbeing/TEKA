create table member3 
(
	m_idx		int,							--呉獄腰硲
	m_id		varchar2(30) not null,			--焼戚巨
	m_nickname	varchar2(30) not null,			--莞革績
	m_birthdate	date		 not null,			--持鰍杉析
	m_email		varchar2(30) not null,			--戚五析
	m_pwd		varchar2(30) not null			--搾腔腰硲
)

create sequence seq_m_idx

alter table member3
add constraint pk_member3 primary key(m_idx)

select * from member3
select * from member3 where m_id = 'yhn032'

insert into member3 values(seq_m_idx.nextVal, 'yhn032', '畠掩疑', '1999-04-10', 'yhn032@naver.com', 'yhn032');
insert into member3 values(seq_m_idx.nextVal, 'yhn033', '析掩疑', '1989-12-12', 'yhn033@daum.net', 'khn033');
insert into member3 values(seq_m_idx.nextVal, 'yhn034', '戚掩疑', '1979-03-15', 'yhn034@nate.com', 'two034');
insert into member3 values(seq_m_idx.nextVal, 'yhn035', '誌掩疑', '2012-08-20', 'yhn035@naver.com', 'thr035');
insert into member3 values(seq_m_idx.nextVal, 'admin', '淫軒切', to_date('2012-08-20','YYYY-MM-DD'), 'yhn035@naver.com', 'admin');

insert into member3 values
		(seq_m_idx.nextVal,	'けいし', 'けいしい', to_date('1996-03-12','YYYY-MM-DD'),'けいし@ばけ','asd');

delete from member3 where m_idx = 6
