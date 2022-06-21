--/// ī�� (�Խñ�)
create table card
(
	c_idx int, -- ī���ȣ
	c_title varchar2(1000) not null, -- ī������
	c_content varchar2(1000) not null, -- ī��Ұ���
	c_isPublic varchar2(30) default('����'), -- ��������
	s_idx int, -- ������ȣ
	m_idx int, -- �ۼ����ε���
	c_regdate varchar2(100) not null -- ī��������
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

--/// �� �н���Ʈ�� �߰�
create table mycardset
(
	mc_idx int, -- �� ī���ȣ
	s_idx int, -- ������ȣ
	m_idx int, -- �н��� �����ȣ
	c_idx int -- ī��(�Խñ�)��ȣ
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

--����&�亯 ���̺�
create table qna
(
   q_idx      int,                        --������ȣ
   c_idx      int,                        --ī���ȣ
   q_question   varchar2(1000) not null,         --����
   q_answer   varchar2(1000) not null            --�亯
)

--������
create sequence seq_q_idx

--�⺻Ű 
alter table qna
add constraint pk_qna_q_idx primary key(q_idx)

--�ܷ�Ű 
alter table qna
add constraint fk_qna_card foreign key(c_idx) references card(c_idx)

--����
drop table qna
drop sequence seq_q_idx



--���� ����&�亯 ���̺�
create table wrongqna
(
   w_idx      int,                        --Ʋ��������ȣ
   c_idx      int,                        --ī���ȣ
   m_idx      int,                        --�н��� �����ȣ
   w_question   varchar2(1000) not null,         --����
   w_answer   varchar2(1000) not null            --�亯
)

--������
create sequence seq_w_idx

--�⺻Ű 
alter table wrongqna
add constraint pk_wrong_w_idx primary key(w_idx)

--�ܷ�Ű 
alter table wrongqna
add constraint fk_wrong_card foreign key(c_idx) references card(c_idx)

alter table wrongqna
add constraint fk_wrong_member foreign key(m_idx) references tekamember(m_idx)

--����
drop table wrongqna
drop sequence seq_w_idx

--/////////////////////////////////////////////////////////////////////////////////
-- ������̺�
--������
create sequence seq_tekamember_m_idx

create table tekamember
(
   m_idx      int,                                   --����ε���(PK)
   m_id       varchar2(30)  not null,                --������̵�(unique)
   m_pwd      varchar2(30)  not null,                --������
   m_nickname varchar2(30)  not null,                --����г���(unique)
   m_email    varchar2(100) not null,                --����̸���(unique)
   m_grade    varchar2(30)  default '�Ϲ�' not null   --������
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

--�������̺�
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

--/////////////////////////////////////////////////////////////////////////////////

--���ƿ�
--������
create sequence seq_like_l_grade

create table likey
(
   l_grade int,           --��õ��ȣ(PK) 
   l_like  int default 0, --ī����õ��
   c_idx   int,           --ī���ȣ(FK)
   m_idx   int            --�����ȣ(FK)
)

--�ܷ�Ű
alter table likey
   add constraint fk_likey_c_idx foreign key(c_idx) references card(c_idx)

alter table likey
   add constraint fk_likey_m_idx foreign key(m_idx) references tekamember(m_idx)
   

   

