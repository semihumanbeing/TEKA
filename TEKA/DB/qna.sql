create table qna
(
	q_idx		int,					--������ȣ
	c_idx		int,					--ī���ȣ
	q_question	varchar2(200),			--����
	q_answer	varchar2(50)			--�亯
)

create sequence seq_q_idx

alter table qna
add constraint pk_q_idx primary key(q_idx);

select * from qna

select * from qna where c_idx=3

insert into qna values(seq_q_idx.nextVal, 1, '�߻�ȭ�� �����ƴ�?', '�߻�ȭ��!');
insert into qna values(seq_q_idx.nextVal, 1, 'ĸ��ȭ�� �����ƴ�?', 'ĸ��ȭ��!');
insert into qna values(seq_q_idx.nextVal, 1, '���ȭ�� �����ƴ�?', '���ȭ��!');
insert into qna values(seq_q_idx.nextVal, 1, 'Ŭ������ �����ƴ�?', 'Ŭ������!');
insert into qna values(seq_q_idx.nextVal, 1, '��ü�� �����ƴ�?', '��ü��!');
insert into qna values(seq_q_idx.nextVal, 1, '����ڽ��� �����ƴ�?', '����ڽ��̴�!');
insert into qna values(seq_q_idx.nextVal, 1, '���ٰ� �����ƴ�?', '���ٴ�!');
insert into qna values(seq_q_idx.nextVal, 1, '������ �����ƴ�?', '������!');
insert into qna values(seq_q_idx.nextVal, 1, '��ü������ �����ƴ�?', '��ü�����̴�!');
insert into qna values(seq_q_idx.nextVal, 1, '������Ʈ�� �����ƴ�?', '������Ʈ��!');


insert into qna values(seq_q_idx.nextVal, 2, '�����ٷ��� ���� �ƴ�?', '�����˰ڳ�!');
insert into qna values(seq_q_idx.nextVal, 2, '�ü���� ���� �ƴ�?', '�ʴ¾Ƴ�?!');
insert into qna values(seq_q_idx.nextVal, 2, 'RAID0�� ���� �ƴ�?', '�� �𸥴�!');
insert into qna values(seq_q_idx.nextVal, 2, '�������°� ���� �ƴ�?', '����!!');
insert into qna values(seq_q_idx.nextVal, 2, '��ȣ������ ���� �ƴ�?', '����!!');

update qna set c_idx = 2 where c_idx = 3 