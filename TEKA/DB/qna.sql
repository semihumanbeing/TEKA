create table qna
(
	q_idx		int,					--질문번호
	c_idx		int,					--카드번호
	q_question	varchar2(200),			--질문
	q_answer	varchar2(50)			--답변
)

create sequence seq_q_idx

alter table qna
add constraint pk_q_idx primary key(q_idx);

select * from qna

select * from qna where c_idx=3

insert into qna values(seq_q_idx.nextVal, 1, '추상화가 뭔지아니?', '추상화다!');
insert into qna values(seq_q_idx.nextVal, 1, '캡슐화가 뭔지아니?', '캡슐화다!');
insert into qna values(seq_q_idx.nextVal, 1, '모듈화가 뭔지아니?', '모듈화다!');
insert into qna values(seq_q_idx.nextVal, 1, '클래스가 뭔지아니?', '클래스다!');
insert into qna values(seq_q_idx.nextVal, 1, '객체가 뭔지아니?', '객체다!');
insert into qna values(seq_q_idx.nextVal, 1, '오토박싱이 뭔지아니?', '오토박싱이다!');
insert into qna values(seq_q_idx.nextVal, 1, '람다가 뭔지아니?', '람다다!');
insert into qna values(seq_q_idx.nextVal, 1, '변수가 뭔지아니?', '변수다!');
insert into qna values(seq_q_idx.nextVal, 1, '객체지향이 뭔지아니?', '객체지향이다!');
insert into qna values(seq_q_idx.nextVal, 1, '컴포넌트가 뭔지아니?', '컴포넌트다!');


insert into qna values(seq_q_idx.nextVal, 2, '스케줄러가 뭔지 아니?', '내가알겠냐!');
insert into qna values(seq_q_idx.nextVal, 2, '운영체제가 뭔지 아니?', '너는아냐?!');
insert into qna values(seq_q_idx.nextVal, 2, 'RAID0가 뭔지 아니?', '잘 모른다!');
insert into qna values(seq_q_idx.nextVal, 2, '교착상태가 뭔지 아니?', '교착!!');
insert into qna values(seq_q_idx.nextVal, 2, '상호배제가 뭔지 아니?', '배제!!');

update qna set c_idx = 2 where c_idx = 3 