
/**
表名：User
  表的功能：用户信息
  创建者：包浩霖 创建日期： 2018.1.4
  修改者：	 	 修改日期：
**/

create table QM_User--用户
(
	user_id Int primary key,-- 用户编号
	user_state Varchar(24),-- 用户状态
	user_name Varchar(40) not null,-- 用户名
	user_sex Varchar(2),--用户性别
	user_l Int,-- 用户等级
	user_tel Int,-- 用户电话
	user_time datetime unique,-- 用户注册时间
	user_post_num Varchar(40),-- 用户发帖总数
	user_return_num Varchar(40),-- 用户回帖总数
	user_remark Varchar(60)-- 用户备注
)

/**
表名：User_statet
  表的功能：用户状态信息
  创建者：包浩霖 创建日期： 2018.1.4
  修改者：	 	 修改日期：
**/


create table User_statet --用户状态
(
	state_id Int primary key,-- 状态编号
	state_type Varchar(10) not null -- 状态类型
)

/**
表名：post_return
  表的功能：回帖状态信息
  创建者：包浩霖 创建日期： 2018.1.4
  修改者：	 	 修改日期：
**/

create table post_return--回帖状态
(
	return_id Int primary key,-- 回帖编号
	/*return_l Int not null,-- 回帖用户级别*/
	user_l Int not null,-- 回帖用户级别
	return_tel Int,-- 回帖用户电话
	return_remark Varchar(60)-- 回帖用户备注
)
/**
表名：post_send
  表的功能：发帖状态信息
  创建者：包浩霖 创建日期： 2018.1.4
  修改者：	 	 修改日期：
**/



create table post_send--发帖状态
(
	send_id Int primary key,-- 发帖编号
	/*send_l Int not null,-- 发帖用户级别*/
	user_l Int not null,-- 发帖用户级别
	send_tel Int,-- 发帖用户电话
	send_remark Varchar(60) -- 发帖用户备注
)

/**
表名：Post
  表的功能：帖子
  创建者：包浩霖 创建日期： 2018.1.4
  修改者：	 	 修改日期：
**/


create table QM_Post--帖子
(
	post_id Int primary key,-- 帖子编号
	post_item Varchar(20),-- 帖子主题
	post_date Datetime not null,-- 帖子更新时间
	user_id Int references QM_User(user_id)-- 用户名
)


--1）	在用户表中添加以你学号为中心的前后五位同学信息，即用户名（学号），用户姓名，用户性别为真实数据，其他自备

select * from QM_User
insert into QM_User
	values('713','发帖状态','宋石明','男','13','12580',GETDATE(),'200','300','我是第一位')

insert into QM_User
	values('714','发帖状态','曾怀锦','男','14','12580',GETDATE(),'200','350','我是第二位')

insert into QM_User
	values('715','发帖状态','包浩霖','男','15','12580',GETDATE(),'250','300','我是第三位')

insert into QM_User
	values('716','发帖状态','汪峰','男','16','12580',GETDATE(),'260','300','我是第四位')

insert into QM_User
	values('717','发帖状态','何世文','男','17','12580',GETDATE(),'200','360','我是第五位')

--2）	在帖子信息表中添加5条不同的帖子数据，分别为用户表中5位同学所发，即发帖人分别上面的五位同学，其他自备
insert into User_statet
	values('001','发帖状态')

insert into User_statet
	values('002','回帖状态')

insert into QM_Post
	values('001','游戏','2018-1-2','713')
insert into QM_Post
	values('002','视频','2018-1-2','714')
insert into QM_Post
	values('003','音乐','2018-1-2','715')
insert into QM_Post
	values('004','体育','2018-1-2','716')
insert into QM_Post
	values('005','书籍','2018-1-2','717')


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

--3）	在回帖信息表中添加不少于5条回帖数据，数据自备

insert into post_return
	values('001','13','12580','秀')

insert into post_return
	values('002','14','12580','天秀')

insert into post_return
	values('003','15','12580','陈独秀')

insert into post_return
	values('004','16','21580','蒂花之秀')

insert into post_return
	values('005','17','12580','造化钟神秀')


/*
5、使用select语句完成数据的查询需求（简单查询、where条件查询、分组查询、多表连接查询，子查询） (20分)
   1）查询你自己的发帖信息（发帖主题、发帖时间，发帖人编号，发帖人姓名)*/
   select * from 


/*
   2) 查询所有的回帖信息（回帖流水号，回帖人编号，回帖人姓名，回帖的对应帖子主题、主题发布时间，回帖时间*/
