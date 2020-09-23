create database shop
go
use shop
if exists (select 1
            from  sysobjects
           where  id = object_id('t_order')
            and   type = 'U')
   drop table t_order
go
if exists (select 1
            from  sysobjects
           where  id = object_id('t_goods')
            and   type = 'U')
   drop table t_goods
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_type')
            and   type = 'U')
   drop table t_type
go
if exists (select 1
            from  sysobjects
           where  id = object_id('t_user')
            and   type = 'U')
   drop table t_user
go

create table t_user
(
  uiid char(6) primary key,
  uname varchar(20) not null,
  ubirthday datetime,
  usex char(1) check(usex='F' or usex='M'),
  uaddress varchar(50),
  utelephone varchar(20),
)


create table t_type
(
  gtid char(6) primary key,
  gtname varchar(20) not null,
)

create table t_goods
(
  gid char(6) primary key,
  gname varchar(20) unique,
  gtid char(6) references t_type(gtid),
  gprice int check(gprice>0),
  gdiscount int,
  gstocks int,
  gdatetime datetime,
  gminstocks int check(gminstocks>0),
  gmemo varchar(50),
)

create table t_order
(
  omid int identity(1000,1) primary key,
  uiid char(6) not null references t_user(uiid),
  odatetime datetime,
  gid char(6) references t_goods(gid),
  oprice numeric(5,2) check(oprice>0),
  onum int check(onum>0),
  omoney numeric(10,2)
)