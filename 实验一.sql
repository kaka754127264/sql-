use XSGL

/*
  ������Student
  ��Ĺ��ܣ�ѧ����Ϣ
  �����ߣ������� �������ڣ� 10.26
  �޸��ߣ�	 �޸����ڣ�	
*/
drop table Student
go
create table Student 
(
	Sno int primary key Identity(1,1),--ѧ��ѧ��
	Sname Nchar(8) not null,--ѧ������
	Sex  Char(2) check(Sex='��' or Sex='Ů'),--�Ա�
	Birthday Datetime not null,--��������
	Age as Datediff(year,Birthday,getdate()),--����
	Sdept Char(20)--ϵ��
)


/*
  ������Cource
  ��Ĺ��ܣ��γ���Ϣ
  �����ߣ������� �������ڣ� 10.26
  �޸��ߣ�	 �޸����ڣ�	
*/
create table Cource
(
	Cno char(10) primary key,--�γ̴���
	Cname Varchar(40) unique,--�γ���
	Credit smallint check(Credit>0 and Credit<=10),--ѧ��
	Cteacher Char(10)--��ʦ
)

/*
  ������Score
  ��Ĺ��ܣ�ѧ���ɼ�
  �����ߣ������� �������ڣ� 10.26
  �޸��ߣ�	 �޸����ڣ�	
*/
create table Score
(
	Sno Int references Student(Sno),--ѧ��
	Cno Char(10) references Cource(Cno),--�γ̺�
	primary key(Sno,Cno),--����
	Grade Smallint --�ɼ�
)

alter table Student
	add memo varchar(200)--��Student��������һ��memo�ֶΣ�����Ϊvarchar��200��

alter table Student
	alter  column memo nvarchar(250)--��memo�ֶε����͸�Ϊnvarchar(250)


alter table Student
	drop memo --ɾ��memo�ֶ�

EXEC sp_rename 'Cource', 'CourceInfo'--�޸ı�Cource������ΪCourceInfo

/*
	�����������ݡ��������ݡ�
	ɾ�����ݣ�����֤Լ��

*/

/*
	��һ����
	*/
insert into Student (Sname,Sex,Birthday,Sdept)
	values('���ǹ�','��','1995','�������ѧ�뼼��')
insert into Student (Sname,Sex,Birthday,Sdept)
	values('������','��','1996','��������ϵ')
insert into Student (Sname,Sex,Birthday,Sdept)
	values('������','Ů','1996','�������ѧ�뼼��')
insert into Student (Sname,Sex,Birthday,Sdept)
	values('л�ɹ�','��','1994','�������ѧ�뼼��')
insert into Student (Sname,Sex,Birthday,Sdept)
	values('������','��','1997','��������ϵ')
insert into Student (Sname,Sex,Birthday,Sdept)
	values('�½���','��','1995','�������ѧ�뼼��')
insert into Student (Sname,Sex,Birthday,Sdept)
	values('�̵���','Ů','1997','��������ϵ')
insert into Student (Sname,Sex,Birthday,Sdept)
	values('����','Ů','1995','�������ѧ�뼼��')
insert into Student (Sname,Sex,Birthday,Sdept)
	values('������','��','1996','�������ѧ�뼼��')
insert into Student (Sname,Sex,Birthday,Sdept)
	values('�ⲡ','��','1993','�������ѧ�뼼��')
go

/*
	�ڶ�����
	*/
	insert into Cource
		values('Cs1001','�����Ӧ�û���','4','��־��')
	insert into Cource
		values('Cs1002','�������ѧ����','4','�º���')
	insert into Cource
		values('Cs1003','��ҳ���������','2','л�ľ�')
	insert into Cource
		values('Cs1004','����ϵͳ','4','��  ��')
	insert into Cource
		values('Cs1005','���ݿ�Ӧ�ü���','4','������')
	insert into Cource
		values('Cs1006','���������','4','������')
	insert into Cource
		values('Cs1007','�������','2','������')

/*
	��������
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
	set Sex= 'Ů'

	delete from Cource where Cno = 'Cs1007'

/*
	��֤
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
