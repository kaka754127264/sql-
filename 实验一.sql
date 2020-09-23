use XSGL

/*
  表名：Student
  表的功能：学生信息
  创建者：包浩霖 创建日期： 10.26
  修改者：	 修改日期：	
*/
drop table Student
go
create table Student 
(
	Sno int primary key Identity(1,1),--学生学号
	Sname Nchar(8) not null,--学生姓名
	Sex  Char(2) check(Sex='男' or Sex='女'),--性别
	Birthday Datetime not null,--出生日期
	Age as Datediff(year,Birthday,getdate()),--年龄
	Sdept Char(20)--系部
)


/*
  表名：Cource
  表的功能：课程信息
  创建者：包浩霖 创建日期： 10.26
  修改者：	 修改日期：	
*/
create table Cource
(
	Cno char(10) primary key,--课程代码
	Cname Varchar(40) unique,--课程名
	Credit smallint check(Credit>0 and Credit<=10),--学分
	Cteacher Char(10)--教师
)

/*
  表名：Score
  表的功能：学生成绩
  创建者：包浩霖 创建日期： 10.26
  修改者：	 修改日期：	
*/
create table Score
(
	Sno Int references Student(Sno),--学号
	Cno Char(10) references Cource(Cno),--课程号
	primary key(Sno,Cno),--主键
	Grade Smallint --成绩
)

alter table Student
	add memo varchar(200)--给Student表中增加一个memo字段，类型为varchar（200）

alter table Student
	alter  column memo nvarchar(250)--将memo字段的类型改为nvarchar(250)


alter table Student
	drop memo --删除memo字段

EXEC sp_rename 'Cource', 'CourceInfo'--修改表Cource的名称为CourceInfo

/*
	向表中添加数据、更新数据、
	删除数据，并验证约束

*/

/*
	第一个表
	*/
insert into Student (Sname,Sex,Birthday,Sdept)
	values('张是贵','男','1995','计算机科学与技术')
insert into Student (Sname,Sex,Birthday,Sdept)
	values('刘光明','男','1996','数字艺术系')
insert into Student (Sname,Sex,Birthday,Sdept)
	values('罗雅丽','女','1996','计算机科学与技术')
insert into Student (Sname,Sex,Birthday,Sdept)
	values('谢成功','男','1994','计算机科学与技术')
insert into Student (Sname,Sex,Birthday,Sdept)
	values('李晓明','男','1997','数字艺术系')
insert into Student (Sname,Sex,Birthday,Sdept)
	values('陈建设','男','1995','计算机科学与技术')
insert into Student (Sname,Sex,Birthday,Sdept)
	values('蔡丹丹','女','1997','数字艺术系')
insert into Student (Sname,Sex,Birthday,Sdept)
	values('张敏','女','1995','计算机科学与技术')
insert into Student (Sname,Sex,Birthday,Sdept)
	values('刘光明','男','1996','计算机科学与技术')
insert into Student (Sname,Sex,Birthday,Sdept)
	values('吴病','男','1993','计算机科学与技术')
go

/*
	第二个表
	*/
	insert into Cource
		values('Cs1001','计算机应用基础','4','刘志军')
	insert into Cource
		values('Cs1002','计算机数学基础','4','陈海洋')
	insert into Cource
		values('Cs1003','网页设计与制作','2','谢文静')
	insert into Cource
		values('Cs1004','操作系统','4','曹  柯')
	insert into Cource
		values('Cs1005','数据库应用技术','4','孔宇清')
	insert into Cource
		values('Cs1006','计算机网络','4','张向天')
	insert into Cource
		values('Cs1007','软件测试','2','李来欣')

/*
	第三个表
	*/
	insert into Score(Sno,Cno,Grade)values(001,'Cs1001',95)
	insert into Score(Sno,Cno,Grade)values(001,'Cs1002',87)
	insert into Score(Sno,Cno,Grade)values(001,'Cs1005',90)
	insert into Score(Sno,Cno,Grade)values(001,'Cs1006',89)
	insert into Score(Sno,Cno,Grade)values(002,'Cs1001',75)
	insert into Score(Sno,Cno,Grade)values(006,'Cs1001',84)
	insert into Score(Sno,Cno,Grade)values(006,'Cs1003',86)
	insert into Score(Sno,Cno,Grade)values(008,'Cs1001',91)
	insert into Score(Sno,Cno,Grade)values(008,'Cs1003',73)
	insert into Score(Sno,Cno,Grade)values(008,'Cs1004',65)
	insert into Score(Sno,Cno,Grade)values(009,'Cs1001',54)
	insert into Score(Sno,Cno,Grade)values(009,'Cs1003',70)
	insert into Score(Sno,Cno,Grade)values(010,'Cs1001',75)
	insert into Score(Sno,Cno,Grade)values(010,'Cs1002',87)
	insert into Score(Sno,Cno,Grade)values(010,'Cs1005',76)
	insert into Score(Sno,Cno,Grade)values(007,'Cs1001',87)
	insert into Score(Sno,Cno,Grade)values(007,'Cs1003',86)
	insert into Score(Sno,Cno,Grade)values(004,'Cs1001',85)
	insert into Score(Sno,Cno,Grade)values(004,'Cs1005',90)
	
/*
	other
*/
	update Student
	set Sex= '女'

	delete from Cource where Cno = 'Cs1007'

/*
	验证
*/
select * from Student
select * from Cource
select * from Score
delete from Student
delete from Cource
delete from Score
drop table Student
drop table CourceInfo
drop table Score
alter table CourceInfo drop constraint UQ__Cource__9F5E0299F87A910A
alter table Score drop constraint FK__Score__Sno__173876EA
