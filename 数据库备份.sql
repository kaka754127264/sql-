
--1����ѯ�ж������û���Ϣ

select * from t_user --Ƕ���Ӳ�ѯ
	where uiid in (select distinct uiid from t_order)

select distinct t1.uiid , uname ,usex,ubirthday,uaddress from t_order as t1 inner join t_user as t2 --������Ӳ�ѯ
	on t1.uiid=t2.uiid

select distinct t1.uiid , uname ,usex,ubirthday,uaddress from t_order as t1 , t_user as t2 --������Ӳ�ѯ
	where t1.uiid=t2.uiid

--2����ѯ�ж������û���Ϣ����ʾ���û��������ͼ���

select  uiid , uname ���� ,usex,ubirthday ����,substring(uaddress,1,CHARINDEX('��',uaddress)) ���� from t_user  

--3����ѯ2017���ж������û���Ϣ����ʾ���û��������ͼ���
create view V_2017
as
select  a.uiid , uname ���� ,usex,ubirthday ����,substring(uaddress,1,CHARINDEX('��',uaddress)) ����,odatetime from t_user a join t_order b
on a.uiid = b.uiid where year(b.odatetime) = 2017

select * from V_2017

--4����ѯ2017��ÿ���û��Ķ����ܽ���ʾ���û���ţ��û������������ܽ��


select t_order.uiid , sum(omoney), uname from t_order  ,t_user 
	where t_order.uiid = t_user.uiid and year(odatetime) = 2017
	 group by t_order.uiid, t_user.uname

--5����ѯ���������ڵĶ�����Ϣ����ʾ������ţ��û����+����,��Ʒ��ţ���д������Ʒ���ƣ���������ʾ���ҷ��ţ�
select omid, uiid,odatetime,upper(gid),'$'+convert(char,omoney) from t_order 
	where datediff(month,odatetime,GETDATE())<=6


--
create view V_publicinf
AS
SELECT uiid ,uname ,usex ,ubirthday
from t_user

--�б������й���
drop view V_publicinf
create view V_07
AS
select * from
V_publicinf
where uiid like '1207%'
with check option


drop view V_publicinf
create view V_08
AS
select * from
V_publicinf
where uiid like '1208%'

select * from V_2017
select * from V_07
select * from v_publicinf
drop view V_07
drop view V_08

--����ͼ���ɾ������������--��ҵ����Щ�������
insert into V_2017 

--�ڵ�ǰ���ݿⴴ����ͼ������ͬ��
create view V_publicinf  --(�˻�,����)
AS
SELECT uiid ,uname,usex 
from t_user

insert into V_publicinf
values('120799','F')

insert into V_07
values('120766','��˼��','F',null)

--����������С���û���Ϣ
select * from t_user
	where ubirthday =(
	select max(ubirthday) from t_user
		)
--��ѯ��ʾ�ڵ����ж������û���Ϣ
--���Ӳ�ѯ�Ͷ�����Ӳ�ѯ��
create view v_month
as
select * from t_user
	where uiid in ( select uiid from t_order 
					where datediff(month,odatetime,GETDATE())<=1)

select * from v_month
--��ѯ��ʾ�ڵ����ж�������100����Ʒ��Ϣ
--���Ӳ�ѯ�Ͷ�����Ӳ�ѯ��
create view v_100
as
select * from t_user
	where uiid in ( select uiid from t_order 
					where omoney>100 and datediff(month,odatetime,GETDATE())<=12)

drop view v_100
select * from v_100
--��ѯ��ʾ�û���Ϣ��������ÿ���û��Ķ����ܽ��
create view v_sum
as
select omid  ,t_user.uiid ,t_user.uname �û�����,t_goods.gid ,onum  ,
	   gname ,gprice , onum*gprice �ܽ��
	   from t_order 
		join t_user 
		on t_order .uiid = t_user.uiid
		left outer join t_goods
		on t_order.gid = t_goods.gid 	
select * from t_order
select * from t_user 
select * from v_sum