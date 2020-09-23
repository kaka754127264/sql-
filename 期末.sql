
/**
������User
  ��Ĺ��ܣ��û���Ϣ
  �����ߣ������� �������ڣ� 2018.1.4
  �޸��ߣ�	 	 �޸����ڣ�
**/

create table QM_User--�û�
(
	user_id Int primary key,-- �û����
	user_state Varchar(24),-- �û�״̬
	user_name Varchar(40) not null,-- �û���
	user_sex Varchar(2),--�û��Ա�
	user_l Int,-- �û��ȼ�
	user_tel Int,-- �û��绰
	user_time datetime unique,-- �û�ע��ʱ��
	user_post_num Varchar(40),-- �û���������
	user_return_num Varchar(40),-- �û���������
	user_remark Varchar(60)-- �û���ע
)

/**
������User_statet
  ��Ĺ��ܣ��û�״̬��Ϣ
  �����ߣ������� �������ڣ� 2018.1.4
  �޸��ߣ�	 	 �޸����ڣ�
**/


create table User_statet --�û�״̬
(
	state_id Int primary key,-- ״̬���
	state_type Varchar(10) not null -- ״̬����
)

/**
������post_return
  ��Ĺ��ܣ�����״̬��Ϣ
  �����ߣ������� �������ڣ� 2018.1.4
  �޸��ߣ�	 	 �޸����ڣ�
**/

create table post_return--����״̬
(
	return_id Int primary key,-- �������
	/*return_l Int not null,-- �����û�����*/
	user_l Int not null,-- �����û�����
	return_tel Int,-- �����û��绰
	return_remark Varchar(60)-- �����û���ע
)
/**
������post_send
  ��Ĺ��ܣ�����״̬��Ϣ
  �����ߣ������� �������ڣ� 2018.1.4
  �޸��ߣ�	 	 �޸����ڣ�
**/



create table post_send--����״̬
(
	send_id Int primary key,-- �������
	/*send_l Int not null,-- �����û�����*/
	user_l Int not null,-- �����û�����
	send_tel Int,-- �����û��绰
	send_remark Varchar(60) -- �����û���ע
)

/**
������Post
  ��Ĺ��ܣ�����
  �����ߣ������� �������ڣ� 2018.1.4
  �޸��ߣ�	 	 �޸����ڣ�
**/


create table QM_Post--����
(
	post_id Int primary key,-- ���ӱ��
	post_item Varchar(20),-- ��������
	post_date Datetime not null,-- ���Ӹ���ʱ��
	user_id Int references QM_User(user_id)-- �û���
)


--1��	���û������������ѧ��Ϊ���ĵ�ǰ����λͬѧ��Ϣ�����û�����ѧ�ţ����û��������û��Ա�Ϊ��ʵ���ݣ������Ա�

select * from QM_User
insert into QM_User
	values('713','����״̬','��ʯ��','��','13','12580',GETDATE(),'200','300','���ǵ�һλ')

insert into QM_User
	values('714','����״̬','������','��','14','12580',GETDATE(),'200','350','���ǵڶ�λ')

insert into QM_User
	values('715','����״̬','������','��','15','12580',GETDATE(),'250','300','���ǵ���λ')

insert into QM_User
	values('716','����״̬','����','��','16','12580',GETDATE(),'260','300','���ǵ���λ')

insert into QM_User
	values('717','����״̬','������','��','17','12580',GETDATE(),'200','360','���ǵ���λ')

--2��	��������Ϣ�������5����ͬ���������ݣ��ֱ�Ϊ�û�����5λͬѧ�������������˷ֱ��������λͬѧ�������Ա�
insert into User_statet
	values('001','����״̬')

insert into User_statet
	values('002','����״̬')

insert into QM_Post
	values('001','��Ϸ','2018-1-2','713')
insert into QM_Post
	values('002','��Ƶ','2018-1-2','714')
insert into QM_Post
	values('003','����','2018-1-2','715')
insert into QM_Post
	values('004','����','2018-1-2','716')
insert into QM_Post
	values('005','�鼮','2018-1-2','717')


/*
update QM_Post
	set user_id= 
*/

insert into post_send
	values('001','13','12580','123')

insert into post_send
	values('002','14','12580','1234')

insert into post_send
	values('003','15','12580','12345')

insert into post_send
	values('004','16','21580','123456')

insert into post_send
	values('005','17','12580','1234567')


drop table post_return
drop table post_send

select * from QM_User
select * from QM_Post
select * from post_return
select * from post_send
select * from User_statet

--3��	�ڻ�����Ϣ������Ӳ�����5���������ݣ������Ա�

insert into post_return
	values('001','13','12580','��')

insert into post_return
	values('002','14','12580','����')

insert into post_return
	values('003','15','12580','�¶���')

insert into post_return
	values('004','16','21580','�ٻ�֮��')

insert into post_return
	values('005','17','12580','�컯������')


/*
5��ʹ��select���������ݵĲ�ѯ���󣨼򵥲�ѯ��where������ѯ�������ѯ��������Ӳ�ѯ���Ӳ�ѯ�� (20��)
   1����ѯ���Լ��ķ�����Ϣ���������⡢����ʱ�䣬�����˱�ţ�����������)*/
   select * from 


/*
   2) ��ѯ���еĻ�����Ϣ��������ˮ�ţ������˱�ţ������������������Ķ�Ӧ�������⡢���ⷢ��ʱ�䣬����ʱ��*/
