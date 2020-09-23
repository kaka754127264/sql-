insert into t_type(GTID,GTNAME)
	values('A','食物')

insert into t_type
	values('B','生活用品')

insert into t_goods
	values('001','牛肉面','A','12.50','0.9','2017.10.19','100.0',null)

insert into t_goods
	values('002','鲜橙汁','A','12.50','0.9','2017.10.19','100.0',null)

insert into t_goods
	values('003','洗发水','B','26.00','0.9','2017.10.19','100.0',null)

insert into t_goods
	values('004','牙膏','B','11.80','0.9','2017.10.19','100.0',null)

select * from t_type
select * from t_goods

delete from t_type
delete from t_goods