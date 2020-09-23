--嵌套查询

	select * from t_goods
		where gprice > (
						select avg(gprice) 平均价
							from  t_goods
						)

--查询同月生日的同学
	select * from t_user
		where month(ubirthday) =(select month(ubirthday) from t_user
		where uiid = '120715')

	select month(ubirthday) from t_user
		where uiid = '120715'

--分组
--查找有订单的用户信息

select * from t_user

where uiid not in(
	select distinct uiid from t_order)

--子查询结果 (单个值 = )


----------------
--查找年龄最大的用户信息
select * from t_user
	where year(ubirthday) =(
	select MAX(year(ubirthday)) from t_user
		)
--正确答案
select * from t_user
	where ubirthday =(
	select min(ubirthday) from t_user
		)
--查询单笔订单金额在500以上的用户的信息
select * from t_user
	where uiid in ( select uiid from t_order 
					where omoney>500)

select * 
	   from t_user , t_order 
		 where t_user .uiid = t_order.uiid
		  and omoney>500

select * from t_order
except	--补集		-- union all 、intersect交集
select * from t_order
	

--查询有订单的用户信息
select * from t_user
	where exists(
		select distinct uiid from t_order
		where uiid = t_user.uiid
	)



select * from t_user
select * from t_goods
select * from t_order

--连接查询
--1、查询订单信息
select omid 订单编号 ,uiid 用户ID,'用户名称',gid 商品编号,onum 数量 from t_order





--查询订单信息，并显示用户的名称
select omid 订单编号 ,t_order .uiid 用户ID,
	   uname 用户名称,gid 商品编号,onum 数量 
	   from t_order 
			join t_user on t_order .uiid = t_user.uiid
-------------------------------------------------------------------
select omid 订单编号 ,t1.uiid 用户ID,
	   uname 用户名称,gid 商品编号,onum 数量 
	   from t_order as t1
			join t_user t2 on t1 .uiid = t2.uiid

--查询订单信息，并显示商品的名称，单价

select t1.omid 订单编号 ,t1.uiid 用户ID,t1.gid 商品编号,t1.onum 数量 ,
	   gname 商品名称,gprice 商品单价
	   from t_order as t1
		join t_goods t2 on t1 .gid = t2.gid
--内连接
select t1.omid 订单编号 ,t1.uiid 用户ID,t1.gid 商品编号,t1.onum 数量 ,
	   gname 商品名称,gprice 商品单价
	   from t_order as t1
		inner join t_goods t2 on t1 .gid = t2.gid
------------等值连接-----------------------------------------------------

--左外连接
select t1.omid 订单编号 ,t1.uiid 用户ID,t1.gid 商品编号,t1.onum 数量 ,
	   t2.gname 商品名称,t2.gprice 商品单价
	   from t_order as t1
		left outer join t_goods t2 on t1 .gid = t2.gid

--右外连接
select t1.omid 订单编号 ,t1.uiid 用户ID,t1.gid 商品编号,t1.onum 数量 ,
	   t2.gname 商品名称,t2.gprice 商品单价
	   from t_order as t1
		right outer join t_goods t2 on t1 .gid = t2.gid
--------------------------------------------------------------------------
select * from t_goods
select * from t_order

--全外连接
select t1.omid 订单编号 ,t1.uiid 用户ID,t1.gid 商品编号,t1.onum 数量 ,
	   t2.gname 商品名称,t2.gprice 商品单价
	   from t_order as t1
		full outer join t_goods t2 on t1 .gid = t2.gid


--笛卡尔积
select t1.omid 订单编号 ,t1.uiid 用户ID,t1.gid 商品编号,t1.onum 数量 ,
	   t2.gname 商品名称,t2.gprice 商品单价
	   from t_order as t1,t_goods t2 
	   -- on t1 .gid = t2.gid
	   where t1 .gid = t2.gid

---------------------------------------------------------------------------
--查询订单信息，同时显示相对应的用户名称t_user和商品名称t_goods
--多表查询
select omid 订单编号 ,t_user.uiid 用户ID,t_goods.gid 商品编号,onum 数量 ,
	   gname 商品名称,gprice 商品单价
	   from t_order 
		join t_user 
		on t_order .uiid = t_user.uiid
		left outer join t_goods
		on t_order.gid = t_goods.gid  

select * from t_goods
select * from t_user
--

--


	