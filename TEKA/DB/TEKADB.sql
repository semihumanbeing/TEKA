--/// 1. ī�� (�Խñ�)
create table card
(
	c_idx      int,               			 -- ī���ȣ
	c_title    varchar2(1000) not null, 	 -- ī������
	c_content  varchar2(1000) not null, 	 -- ī��Ұ���
	c_isPublic varchar2(30) default('����'), -- ��������
	s_idx      int,                          -- ������ȣ
	m_idx      int,                  	     -- �ۼ����ε���
	c_regdate varchar2(100) not null 		 -- ī��������
)

-- ������ 
create sequence seq_c_idx

-- ī���ȣ �⺻Ű
alter table card
	add constraint pk_c_idx_card primary key(c_idx);
	
-- ������ȣ �ܷ�Ű
alter table card
	add constraint fk_s_idx_card foreign key(s_idx)
	references subject(s_idx)
	
-- �ۼ����ε��� �ܷ�Ű
alter table card
	add constraint fk_m_idx_card foreign key(m_idx)
	references tekamember(m_idx)
	
-- ����
drop table card
drop sequence seq_c_idx


--���õ�����
insert into card values(seq_c_idx.nextVal, '�ڹ��λ�', '�ڹ��ڹ�', default, 5, 4, sysdate);
insert into card values(seq_c_idx.nextVal, '�ȳ�ȳ�', '�ȴ�����', default, 5, 4, sysdate);
insert into card values(seq_c_idx.nextVal, 'ȫ�浿��', '�浿�浿', default, 5, 4, sysdate);
insert into card values(seq_c_idx.nextVal, '��Ʈ��ũ', 'OSI-7Layer', default, 2, 1, sysdate);

select * from card




--/////////////////////////////////////////////////////////////////////////////////

--/// 2. �� �н���Ʈ�� �߰�
create table mycardset
(
	mc_idx int, -- �� ī���ȣ
	s_idx  int, -- ������ȣ
	m_idx  int, -- �н��� �����ȣ
	c_idx  int  -- ī��(�Խñ�)��ȣ
)
-- �� ī���ȣ ������ 
create sequence seq_mc_idx

-- �� ī���ȣ �⺻Ű
alter table mycardset
	add constraint mc_idx_pk_mycardset primary key(mc_idx)

-- ������ȣ �ܷ�Ű
alter table mycardset
	add constraint fk_s_idx_mycardset foreign key(s_idx)
	references subject(s_idx)
	
-- �н��� �����ȣ �ܷ�Ű
alter table mycardset
	add constraint fk_m_idx_mycardset foreign key(m_idx)
	references tekamember(m_idx)
	
-- ī��(�Խñ�)�ܷ�Ű
alter table mycardset
	add constraint fk_c_idx_mycardset foreign key(c_idx)
	references card(c_idx)

-- ����
drop table mycardset




--/////////////////////////////////////////////////////////////////////////////////

--3. ����&�亯 ���̺�
create table qna
(
   q_idx        int,                         --������ȣ
   c_idx        int,                         --ī���ȣ
   q_question   varchar2(1000) not null,     --����
   q_answer     varchar2(1000) not null,     --�亯
   q_correct	varchar2(20)   default 'false' --���俩��(false:����. true:����)
)

--������
create sequence seq_q_idx

--�⺻Ű 
alter table qna
add constraint pk_qna_q_idx primary key(q_idx)

--�ܷ�Ű 
alter table qna
add constraint fk_qna_card foreign key(c_idx) references card(c_idx)

--�÷��߰�
alter table qna drop column q_correct
alter table qna add q_correct varchar2(20) default('false')
alter table qna
   add constraint check_qna_q_correct check(q_correct in ('false', 'true'))
--����
drop table qna
drop sequence seq_q_idx


--���õ�����
insert into qna values(seq_q_idx.nextVal, 1, '�ڹٶ�?', '�ڹ�Ĩ����Ǫġ��', default);
insert into qna values(seq_q_idx.nextVal, 1, '��ü����', 'Object Oriented Programming', default);
insert into qna values(seq_q_idx.nextVal, 1, 'JVM', '�ڹٰ���ӽ�', default);
insert into qna values(seq_q_idx.nextVal, 1, '�������̽�', '��뼳��', default);
insert into qna values(seq_q_idx.nextVal, 1, '�߻�ȭ', '�����ɹ���', default);
insert into qna values(seq_q_idx.nextVal, 1, 'ĸ��ȭ', '�� ���¹��� �˸� ��!', default);
insert into qna values(seq_q_idx.nextVal, 1, '����ڽ�', '���� ��ü�� ���ε����', default);





--/////////////////////////////////////////////////////////////////////////////////

--4. ������̺�
--������
create sequence seq_tekamember_m_idx

create table tekamember
(
   m_idx      int,                                   --����ε���(PK)
   m_id       varchar2(30)  not null,                --������̵�(unique)
   m_pwd      varchar2(30)  not null,                --������
   m_nickname varchar2(30)  not null,                --����г���(unique)
   m_email    varchar2(100) not null,                --����̸���(unique)
   m_grade    varchar2(30)  default '�Ϲ�' not null  --������
)

--�⺻Ű
alter table tekamember
   add constraint pk_tekamember_m_idx primary key(m_idx);

--����ũ
alter table tekamember
add constraint unique_tekamember_m_nickname unique(m_nickname);
   
alter table tekamember
add constraint unique_tekamember_m_email unique(m_email);

--üũ
alter table tekamember
   add constraint check_tekamember_m_grade check(m_grade in ('�Ϲ�', '������'))


select * from tekamember

--���õ�����
insert into tekamember values(seq_tekamember_m_idx.nextVal, 'one',  '1111', '�ϱ浿', 'one@naver.com', default);
insert into tekamember values(seq_tekamember_m_idx.nextVal, 'two',  '2222', '�̱浿', 'two@naver.com', default);
insert into tekamember values(seq_tekamember_m_idx.nextVal, 'hong', '3333', 'ȫ�浿', 'hong@naver.com', '������');





--/////////////////////////////////////////////////////////////////////////////////

--5. �������̺�
create table subject
(
   s_idx  int,                   --������ȣ(PK)
   s_name varchar2(30) not null  --������
)

--�⺻Ű
alter table subject
   add constraint pk_subject_s_idx primary key(s_idx);

--������
insert into subject values(1, '�ü��');   
insert into subject values(2, '��Ʈ��ũ');   
insert into subject values(3, '�˰���');   
insert into subject values(4, '�ڷᱸ��');   
insert into subject values(5, '�ڹ�');   
insert into subject values(6, '������');   

select * from subject




--/////////////////////////////////////////////////////////////////////////////////

--6. ���ƿ�
--������
create sequence seq_like_l_grade

create table likey
(
   l_idx int,             --��õ��ȣ(PK) 
   l_like  int default 0, --ī����õ��
   c_idx   int,           --ī���ȣ(FK)
   m_idx   int            --�����ȣ(FK)
)

--�ܷ�Ű
alter table likey
   add constraint fk_likey_c_idx foreign key(c_idx) references card(c_idx)

alter table likey
   add constraint fk_likey_m_idx foreign key(m_idx) references tekamember(m_idx)

alter table likey rename column l_grade to l_idx
-- ���̺� ���� ���� default ǥ���� �߰� / ����
alter table ���̺��
modify �÷���[�ڷ���] default �⺻��

-- ���̺� ���� ���� deault ǥ���� ����(����)
alter table ���̺��
modify �÷���[�ڷ���] default null


--���õ�����
insert into likey values(seq_like_l_grade.nextVal, default, 1, 4);
select * from likey 
  


-- ��   
--/////////////////////////////////////////////////////////////////////////////////

-- 1. ī�����̺� + ������̺� + ���ƿ����̺� + �������̺�
create or replace view likedCard
as
	select
		c_idx, c_title, c_content, c_isPublic, c_regdate,	
      	m_nickname,											
        l_like, 											
        s_name	
    from card c join tekamember m using(m_idx)
    	join likey l using(c_idx)
    	join subject s using(s_idx)

select * from likedCard
    	
-- 2. ī�����̺� + ������̺� + �������̺�
create or replace view subjectCard
as
	select
		c_idx, c_title, c_content, c_isPublic, c_regdate,		
      	m_nickname,											
        s_name	
    from card c join tekamember m using(m_idx)
    	join subject s using(s_idx)		

select * from subjectCard


-- 3. ī�����̺� + ������̺� + �������̺�
create or replace view qnaCard
as
select q_idx, c_idx, q_question, q_answer, q_correct,
      c_title, c_content, c_isPublic,
      s_idx, m_idx, c_regdate
   from qna q join card c    using(c_idx)
              join subject s using(s_idx)

select * from qnaCard    

-- 4. ī�常���� : ī�����̺� + �������̺�
create or replace view insertCard
as
	select 
		c_idx, m_idx, s_idx, c_title, c_content, c_isPublic, 
		c_regdate
	from card c join subject s using(s_idx)