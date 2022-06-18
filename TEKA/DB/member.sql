create table member3 
(
	m_idx		int,							--멤버번호
	m_id		varchar2(30) not null,			--아이디
	m_nickname	varchar2(30) not null,			--닉네임
	m_birthdate	date		 not null,			--생년월일
	m_email		varchar2(30) not null,			--이메일
	m_pwd		varchar2(30) not null			--비밀번호
)

create sequence seq_m_idx

alter table member3
add constraint pk_member3 primary key(m_idx)

select * from member3
select * from member3 where m_id = 'yhn032'

insert into member3 values(seq_m_idx.nextVal, 'yhn032', '홍길동', '1999-04-10', 'yhn032@naver.com', 'yhn032');
insert into member3 values(seq_m_idx.nextVal, 'yhn033', '일길동', '1989-12-12', 'yhn033@daum.net', 'khn033');
insert into member3 values(seq_m_idx.nextVal, 'yhn034', '이길동', '1979-03-15', 'yhn034@nate.com', 'two034');
insert into member3 values(seq_m_idx.nextVal, 'yhn035', '삼길동', '2012-08-20', 'yhn035@naver.com', 'thr035');
insert into member3 values(seq_m_idx.nextVal, 'admin', '관리자', to_date('2012-08-20','YYYY-MM-DD'), 'yhn035@naver.com', 'admin');

insert into member3 values
		(seq_m_idx.nextVal,	'ㅁㄴㅇ', 'ㅁㄴㅇㄴ', to_date('1996-03-12','YYYY-MM-DD'),'ㅁㄴㅇ@ㅠㅁ','asd');

delete from member3 where m_idx = 6
