select * from t_goods

select * 
	from t_order
	order by uiid

--%�����ַ�
--

select * 
	from t_order
	where gid is null

select * from t_goods
	WHERE gprice not between 3 and 5

select gname '����', gprice , gstocks,gdatetime
	from t_goods


--1����Ʒƽ���۸�
select AVG(gprice) ƽ���۸� 
	from t_goods

--2�����������Ʒ
select MAX(gstocks) �����
	from t_goods

--3������������Ʒ���ܽ��
select SUM(gprice*gstocks) ������Ʒ�ܽ��
	from t_goods

--4)ÿ��������Ʒƽ���۸�
select gtid ����,AVG(gprice) ƽ���۸� 
	from t_goods
	group by gtid
	order by AVG(gprice) desc

--4)ÿ��������Ʒƽ���۸�
select gtid ����,AVG(gprice) ƽ���۸� 
	from t_goods
	group by gtid
	order by 2 desc

--5)ÿ��������Ʒ���������Ʒ
select gtid ����,AVG(gprice) ƽ���۸� 
	from t_goods
	group by gtid
	order by AVG(gprice) desc

--��ѯ�������ܽ��
select uiid ������,SUM(omoney) �����ܽ�� 
	from t_order
	group by uiid 
	

--6)�����Լ������ֲ�ѯ�����ܽ��
select t_order.uiid ������,SUM(omoney) �����ܽ�� 
	from t_order,t_user
	where t_user.uiid = t_order.uiid and t_user.uname = '������ '
	group by t_order.uiid
	
--������50�����ϵ�ÿ����Ʒ�����ܽ����� 80000
select gid ����,sum (omoney)
	from t_order
	where onum>50  
	group by gid
		having sum (omoney)>80000