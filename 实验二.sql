select * from Student
select * from Score
select * from Cource


select Sno ѧ��,Sname ���� from Student
select Sno ѧ��,Sname ���� ,Sdept ����ϵ from Student
select Sname ���� ,birthday ������� from Student
select Sname ���� ,birthday ������� ,lower(Sdept) ����ϵ from Student

select distinct Sno from Score
select * from Student 
	where Sdept = '�������ѧ�뼼��'

select Sname ����, Age ���� from Student  
	where Age <= 20

select Sno from Score
	where Grade < 60

select Sname ���� ,Sdept ����ϵ,Age ���� from Student
	where Age between 20 and 23

select Sname ���� ,Sdept ����ϵ,Age ���� from Student
	where Age < 20 or Age > 23

select * from Student 
	where Sdept = '�������ѧ�뼼��'

select * from Student 
	where  not Sdept = '�������ѧ�뼼��'

select Sno ѧ��,Sname ���� from Student
	where sno = '1'

select Sno ѧ��,Sname ����,Sex �Ա� from Student
	where Sname like '��%'

select Sname ���� from Student
	where Sname like 'ŷ��_'

select Sname ���� from Student
	where Sname like '%��%'

select Sno ѧ��,Sname ����,Sex �Ա� from Student
	where not Sname like '��%'

select Cno �γ̺�,Credit ѧ�� from Cource

select * from Cource
	where lower(Cname) = '%i'

select * from Student
select * from Score
select * from Cource

select distinct Score.sno,cno from Student,Score
	where not Score.sno = Student.sno

select distinct Sno , Cno from Score

select Sname ���� from Student
	where age <= 20 and Sdept = '�������ѧ�뼼��'

select Sno ѧ��,Grade �ɼ�  from Score
	where Sno = '4' 
	order by Grade desc 

select * from Student
select * from Score
select * from Cource

select * from Student
	order by age desc

select count(Sno) ѧ�������� from Student
	
select Cno,count(Sno) ѧ������ from Score
	group by Cno


select AVG(Grade) ƽ���� from Score
	where Sno = '1'

select Max(Grade) ��߷� from Score
	where Sno = '1'

select Sum(Grade) �ܷ� from Score
	where Sno = '1'

select * from Student
select * from Score
select * from Cource

select Cno, count(Sno) ѡ������ from Score
	group by Cno

select Cno, count(Sno) ѡ������ from Score
	group by Cno
	HAVING count(Sno) >= 3

select Cno,Sname ѧ������ from Score , student
	group by Cno ,Sname
	
select Cno,Sname ѧ������
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno

select Cno,Sname ѧ������
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno
	   where Cno = 'Cs1002' and Grade >= 90

select Cno,Sname ѧ������
	   from Score t1 full outer join student t2
	    on t1 .Sno = t2.Sno

select Cno �γ̺�,Sname ѧ������ ,t1.Sno ѧ�� ,grade �ɼ�
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno
	   
select Cno �γ̺�,Sname ѧ������ ,t1.Sno ѧ�� ,grade �ɼ�
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno
	   where Sdept = '�������ѧ�뼼��'

select Sname ѧ������ ,t1.Sno ѧ�� ,Cno �γ̺�
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno
	   where Cno = 'Cs1002'

select Cno �γ̺�
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno
	   where grade > (select AVG(grade) ƽ���ɼ�  
							from Score t1 join student t2
							on t1 .Sno = t2.Sno 		)
	   group by Cno 

select distinct Sname ѧ������  ,age ����
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno
	   where age <= (select age ĳһѧ��  
							from  student  
							where age = '23'	)
							
select distinct Sname ѧ������  ,age ����
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno
	   where age < (select min(age) ��С����  
							from  student  
							where Sdept = '�������ѧ�뼼��'	)

select distinct Sname ѧ������ ,Cno
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno
	   where Cno = 'Cs1001'


select distinct Sname ѧ������ ,Cno
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno
	   where not  Cno = 'Cs1001'

select distinct Sname ѧ������ ,Cno
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno

select t2.Sno ѧ������
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno
	   where age=  (select age
					from Score t1 join student t2
					on t1 .Sno = t2.Sno
					where  age <= 19
					)




select distinct age
	from Score t1 join student t2
	on t1 .Sno = t2.Sno
	where not age <= 19 and  Sdept = '�������ѧ�뼼��'
	   intersect
	   select distinct age ����ѧ������
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno

select Cno �γ�һ  , SName
	from Score t1 join student t2
	on t1 .Sno = t2.Sno
	where Cno = 'Cs1001'
	   Union
	   select Cno �γ̶�  , SName
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno
	   where Cno = 'Cs1002'



		select age 
			from Score t1 join student t2
			on t1 .Sno = t2.Sno
			WHERE Sdept = '�������ѧ�뼼��'
		EXCEPT
			   select age
			from Score t1 join student t2
			on t1 .Sno = t2.Sno
			where  age <= 19 




			select distinct age
	from Score t1 join student t2
	on t1 .Sno = t2.Sno
	where  Sdept = '�������ѧ�뼼��'
	   Union
	   select distinct age ����ѧ������
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno
     where not age <= 19 

			

