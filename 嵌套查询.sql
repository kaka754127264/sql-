--Ƕ�ײ�ѯ

	select * from t_goods
		where gprice > (
						select avg(gprice) ƽ����
							from  t_goods
						)

--��ѯͬ�����յ�ͬѧ
	select * from t_user
		where month(ubirthday) =(select month(ubirthday) from t_user
		where uiid = '120715')

	select month(ubirthday) from t_user
		where uiid = '120715'

--����
--�����ж������û���Ϣ

select * from t_user

where uiid not in(
	select distinct uiid from t_order)

--�Ӳ�ѯ��� (����ֵ = )


----------------
--�������������û���Ϣ
select * from t_user
	where year(ubirthday) =(
	select MAX(year(ubirthday)) from t_user
		)
--��ȷ��
select * from t_user
	where ubirthday =(
	select min(ubirthday) from t_user
		)
--��ѯ���ʶ��������500���ϵ��û�����Ϣ
select * from t_user
	where uiid in ( select uiid from t_order 
					where omoney>500)

select * 
	   from t_user , t_order 
		 where t_user .uiid = t_order.uiid
		  and omoney>500

select * from t_order
except	--����		-- union all ��intersect����
select * from t_order
	

--��ѯ�ж������û���Ϣ
select * from t_user
	where exists(
		select distinct uiid from t_order
		where uiid = t_user.uiid
	)



select * from t_user
select * from t_goods
select * from t_order

--���Ӳ�ѯ
--1����ѯ������Ϣ
select omid ������� ,uiid �û�ID,'�û�����',gid ��Ʒ���,onum ���� from t_order





--��ѯ������Ϣ������ʾ�û�������
select omid ������� ,t_order .uiid �û�ID,
	   uname �û�����,gid ��Ʒ���,onum ���� 
	   from t_order 
			join t_user on t_order .uiid = t_user.uiid
-------------------------------------------------------------------
select omid ������� ,t1.uiid �û�ID,
	   uname �û�����,gid ��Ʒ���,onum ���� 
	   from t_order as t1
			join t_user t2 on t1 .uiid = t2.uiid

--��ѯ������Ϣ������ʾ��Ʒ�����ƣ�����

select t1.omid ������� ,t1.uiid �û�ID,t1.gid ��Ʒ���,t1.onum ���� ,
	   gname ��Ʒ����,gprice ��Ʒ����
	   from t_order as t1
		join t_goods t2 on t1 .gid = t2.gid
--������
select t1.omid ������� ,t1.uiid �û�ID,t1.gid ��Ʒ���,t1.onum ���� ,
	   gname ��Ʒ����,gprice ��Ʒ����
	   from t_order as t1
		inner join t_goods t2 on t1 .gid = t2.gid
------------��ֵ����-----------------------------------------------------

--��������
select t1.omid ������� ,t1.uiid �û�ID,t1.gid ��Ʒ���,t1.onum ���� ,
	   t2.gname ��Ʒ����,t2.gprice ��Ʒ����
	   from t_order as t1
		left outer join t_goods t2 on t1 .gid = t2.gid

--��������
select t1.omid ������� ,t1.uiid �û�ID,t1.gid ��Ʒ���,t1.onum ���� ,
	   t2.gname ��Ʒ����,t2.gprice ��Ʒ����
	   from t_order as t1
		right outer join t_goods t2 on t1 .gid = t2.gid
--------------------------------------------------------------------------
select * from t_goods
select * from t_order

--ȫ������
select t1.omid ������� ,t1.uiid �û�ID,t1.gid ��Ʒ���,t1.onum ���� ,
	   t2.gname ��Ʒ����,t2.gprice ��Ʒ����
	   from t_order as t1
		full outer join t_goods t2 on t1 .gid = t2.gid


--�ѿ�����
select t1.omid ������� ,t1.uiid �û�ID,t1.gid ��Ʒ���,t1.onum ���� ,
	   t2.gname ��Ʒ����,t2.gprice ��Ʒ����
	   from t_order as t1,t_goods t2 
	   -- on t1 .gid = t2.gid
	   where t1 .gid = t2.gid

---------------------------------------------------------------------------
--��ѯ������Ϣ��ͬʱ��ʾ���Ӧ���û�����t_user����Ʒ����t_goods
--����ѯ
select omid ������� ,t_user.uiid �û�ID,t_goods.gid ��Ʒ���,onum ���� ,
	   gname ��Ʒ����,gprice ��Ʒ����
	   from t_order 
		join t_user 
		on t_order .uiid = t_user.uiid
		left outer join t_goods
		on t_order.gid = t_goods.gid  

select * from t_goods
select * from t_user
--

--


	