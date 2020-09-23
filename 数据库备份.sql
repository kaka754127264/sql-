
--1、查询有订单的用户信息

select * from t_user --嵌套子查询
	where uiid in (select distinct uiid from t_order)

select distinct t1.uiid , uname ,usex,ubirthday,uaddress from t_order as t1 inner join t_user as t2 --多表连接查询
	on t1.uiid=t2.uiid

select distinct t1.uiid , uname ,usex,ubirthday,uaddress from t_order as t1 , t_user as t2 --多表连接查询
	where t1.uiid=t2.uiid

--2、查询有订单的用户信息，显示其用户的姓名和籍贯

select  uiid , uname 姓名 ,usex,ubirthday 生日,substring(uaddress,1,CHARINDEX('市',uaddress)) 籍贯 from t_user  

--3、查询2017年有订单的用户信息，显示其用户的姓名和籍贯
create view V_2017
as
select  a.uiid , uname 姓名 ,usex,ubirthday 生日,substring(uaddress,1,CHARINDEX('市',uaddress)) 籍贯,odatetime from t_user a join t_order b
on a.uiid = b.uiid where year(b.odatetime) = 2017

select * from V_2017

--4、查询2017年每个用户的订单总金额，显示其用户编号，用户姓名，订单总金额


select t_order.uiid , sum(omoney), uname from t_order  ,t_user 
	where t_order.uiid = t_user.uiid and year(odatetime) = 2017
	 group by t_order.uiid, t_user.uname

--5、查询近半年以内的订单信息，显示订单编号，用户编号+姓名,商品编号（大写），商品名称，订单金额（显示货币符号）
select omid, uiid,odatetime,upper(gid),'$'+convert(char,omoney) from t_order 
	where datediff(month,odatetime,GETDATE())<=6


--
create view V_publicinf
AS
SELECT uiid ,uname ,usex ,ubirthday
from t_user

--列保护，行过滤
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

--简单视图添加删除、增加数据--作业：那些不能添加
insert into V_2017 

--在当前数据库创建视图，不能同名
create view V_publicinf  --(账户,姓名)
AS
SELECT uiid ,uname,usex 
from t_user

insert into V_publicinf
values('120799','F')

insert into V_07
values('120766','王思聪','F',null)

--查找年龄最小的用户信息
select * from t_user
	where ubirthday =(
	select max(ubirthday) from t_user
		)
--查询显示在当月有订单的用户信息
--（子查询和多表连接查询）
create view v_month
as
select * from t_user
	where uiid in ( select uiid from t_order 
					where datediff(month,odatetime,GETDATE())<=1)

select * from v_month
--查询显示在当年有订单金额超过100的商品信息
--（子查询和多表连接查询）
create view v_100
as
select * from t_user
	where uiid in ( select uiid from t_order 
					where omoney>100 and datediff(month,odatetime,GETDATE())<=12)

drop view v_100
select * from v_100
--查询显示用户信息，附加上每个用户的订单总金额
create view v_sum
as
select omid  ,t_user.uiid ,t_user.uname 用户名字,t_goods.gid ,onum  ,
	   gname ,gprice , onum*gprice 总金额
	   from t_order 
		join t_user 
		on t_order .uiid = t_user.uiid
		left outer join t_goods
		on t_order.gid = t_goods.gid 	
select * from t_order
select * from t_user 
select * from v_sum