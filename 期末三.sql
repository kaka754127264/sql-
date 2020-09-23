
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


select * from QM_Post
select * from QM_User
select * from post_return
select * from post_send
select * from QM_User
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
   --�򵥲�ѯ
   select * from post_send full join QM_User on post_send.user_l = QM_User.user_l
		where QM_User.user_id= '715'

   --where ������ѯ
   select * from post_send full join QM_User on post_send.user_l = QM_User.user_l
		where post_send.user_l = '15' and QM_User.user_id= '715'

	--�����ѯ
	select post_send.user_l ,count(send_id) as ���� ,send_id,send_tel,send_remark,QM_User.user_name from post_send
	full join QM_User on post_send.user_l = QM_User.user_l
	where QM_User.user_id= '715'
    group by post_send.user_l,send_id,send_tel,send_remark,QM_User.user_name,QM_User.user_time,QM_User.user_id
	having post_send.user_l = '15'

	--������Ӳ�ѯ
	select * from post_send full join QM_User on post_send.user_l = QM_User.user_l
		where QM_User.user_id= '715'

	--�Ӳ�ѯ/Ƕ�ײ�ѯ����ѯ���Լ��������˵ȼ�����14����С��16����
		select * from post_send
		where user_l >(select user_l from post_return
		where return_remark = '����')
		INTERSECT
		select * from post_send
		where user_l <(select user_l from post_return
		where return_remark = '�ٻ�֮��')


/*
   2) ��ѯ���еĻ�����Ϣ��������ˮ�ţ������˱�ţ������������������Ķ�Ӧ�������⡢���ⷢ��ʱ�䣬����ʱ��*/

      --�򵥲�ѯ
   select * from post_return full join QM_User on post_return.user_l = QM_User.user_l
		where QM_User.user_id= '715'

   --where ������ѯ
   select * from post_return full join QM_User on post_return.user_l = QM_User.user_l
		where post_return.user_l = '15' and QM_User.user_id= '715'

	--�����ѯ
	select post_return.user_l ,count(return_id) as ���� ,return_id,return_tel,return_remark,QM_User.user_name from post_return
	full join QM_User on post_return.user_l = QM_User.user_l
	where QM_User.user_id= '715'
    group by post_return.user_l,return_id,return_tel,return_remark,QM_User.user_name,QM_User.user_time,QM_User.user_id
	having post_return.user_l = '15'

	--������Ӳ�ѯ
	select * from post_return full join QM_User on post_return.user_l = QM_User.user_l
		where QM_User.user_id= '715'

	--�Ӳ�ѯ/Ƕ�ײ�ѯ����ѯ���Լ��������˵ȼ�����14����С��16����
		select * from post_send
		where user_l >(select user_l from post_return
		where return_remark = '����')
		INTERSECT
		select * from post_send
		where user_l <(select user_l from post_return
		where return_remark = '�ٻ�֮��')

/*
6����ͼ() (10�֣�
   ���һ������Ϊϵͳ��Ҫ�Ĳ�ѯ������SQL����ѯ������ͼ�ķ�ʽʵ��
   **/
	drop view V_cha_xu_wo_de_fa_tie

    create view V_cha_xu_wo_de_fa_tie
	AS
	select post_return.user_l ,count(return_id) as ���� ,return_id,return_tel,return_remark,QM_User.user_name from post_return
	full join QM_User on post_return.user_l = QM_User.user_l
    group by post_return.user_l,return_id,return_tel,return_remark,QM_User.user_name,QM_User.user_time,QM_User.user_id


	select * from
	V_cha_xu_wo_de_fa_tie
	where user_name like '��%'




/***
7��ʹ��T-SQLʵ�ּ򵥵�ҵ�����̣���̣� (10��)
   �������һ��ҵ������򣬹��̡��������ߴ�������ʵ��,��ѡһ��ʵ�ּ���,
/*����˵��:�ó���ʵ��XXXXXX����*/
�������:
*/
drop procedure pro_wo_de

create procedure pro_wo_de(@f_id char(20),@f_l char(20))
as
begin
	select post_return.user_l ,count(return_id) as ���� ,return_id,return_tel,return_remark,QM_User.user_name from 
post_return
	full join QM_User on post_return.user_l = QM_User.user_l
	where QM_User.user_id= @f_id
    group by post_return.user_l,return_id,return_tel,return_remark,QM_User.user_name,QM_User.user_time,QM_User.user_id
	having post_return.user_l = @f_l

end

exec pro_wo_de'715','15'
/*
���Խ��: 
*/