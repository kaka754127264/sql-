select * from t_goods

select * 
	from t_order
	order by uiid

--%任意字符
--

select * 
	from t_order
	where gid is null

select * from t_goods
	WHERE gprice not between 3 and 5

select gname '名字', gprice , gstocks,gdatetime
	from t_goods


--1）商品平均价格
select AVG(gprice) 平均价格 
	from t_goods

--2）库存最大的商品
select MAX(gstocks) 最大库存
	from t_goods

--3）计算所以商品的总金额
select SUM(gprice*gstocks) 所有商品总金额
	from t_goods

--4)每种类型商品平均价格
select gtid 组名,AVG(gprice) 平均价格 
	from t_goods
	group by gtid
	order by AVG(gprice) desc

--4)每种类型商品平均价格
select gtid 组名,AVG(gprice) 平均价格 
	from t_goods
	group by gtid
	order by 2 desc

--5)每种类型商品库存最大的商品
select gtid 组名,AVG(gprice) 平均价格 
	from t_goods
	group by gtid
	order by AVG(gprice) desc

--查询订单的总金额
select uiid 所有人,SUM(omoney) 订单总金额 
	from t_order
	group by uiid 
	

--6)根据自己的名字查询订单总金额
select t_order.uiid 所有人,SUM(omoney) 订单总金额 
	from t_order,t_user
	where t_user.uiid = t_order.uiid and t_user.uname = '包浩霖 '
	group by t_order.uiid
	
--数量在50件以上的每个商品销售总金额大于 80000
select gid 代号,sum (omoney)
	from t_order
	where onum>50  
	group by gid
		having sum (omoney)>80000