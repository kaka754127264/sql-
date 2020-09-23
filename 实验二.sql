select * from Student
select * from Score
select * from Cource


select Sno 学号,Sname 姓名 from Student
select Sno 学号,Sname 姓名 ,Sdept 所在系 from Student
select Sname 姓名 ,birthday 出生年份 from Student
select Sname 姓名 ,birthday 出生年份 ,lower(Sdept) 所在系 from Student

select distinct Sno from Score
select * from Student 
	where Sdept = '计算机科学与技术'

select Sname 姓名, Age 年龄 from Student  
	where Age <= 20

select Sno from Score
	where Grade < 60

select Sname 姓名 ,Sdept 所在系,Age 年龄 from Student
	where Age between 20 and 23

select Sname 姓名 ,Sdept 所在系,Age 年龄 from Student
	where Age < 20 or Age > 23

select * from Student 
	where Sdept = '计算机科学与技术'

select * from Student 
	where  not Sdept = '计算机科学与技术'

select Sno 学号,Sname 姓名 from Student
	where sno = '1'

select Sno 学号,Sname 姓名,Sex 性别 from Student
	where Sname like '刘%'

select Sname 姓名 from Student
	where Sname like '欧阳_'

select Sname 姓名 from Student
	where Sname like '%阳%'

select Sno 学号,Sname 姓名,Sex 性别 from Student
	where not Sname like '刘%'

select Cno 课程号,Credit 学分 from Cource

select * from Cource
	where lower(Cname) = '%i'

select * from Student
select * from Score
select * from Cource

select distinct Score.sno,cno from Student,Score
	where not Score.sno = Student.sno

select distinct Sno , Cno from Score

select Sname 姓名 from Student
	where age <= 20 and Sdept = '计算机科学与技术'

select Sno 学号,Grade 成绩  from Score
	where Sno = '4' 
	order by Grade desc 

select * from Student
select * from Score
select * from Cource

select * from Student
	order by age desc

select count(Sno) 学生总人数 from Student
	
select Cno,count(Sno) 学生人数 from Score
	group by Cno


select AVG(Grade) 平均分 from Score
	where Sno = '1'

select Max(Grade) 最高分 from Score
	where Sno = '1'

select Sum(Grade) 总分 from Score
	where Sno = '1'

select * from Student
select * from Score
select * from Cource

select Cno, count(Sno) 选课人数 from Score
	group by Cno

select Cno, count(Sno) 选课人数 from Score
	group by Cno
	HAVING count(Sno) >= 3

select Cno,Sname 学生姓名 from Score , student
	group by Cno ,Sname
	
select Cno,Sname 学生姓名
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno

select Cno,Sname 学生姓名
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno
	   where Cno = 'Cs1002' and Grade >= 90

select Cno,Sname 学生姓名
	   from Score t1 full outer join student t2
	    on t1 .Sno = t2.Sno

select Cno 课程号,Sname 学生姓名 ,t1.Sno 学号 ,grade 成绩
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno
	   
select Cno 课程号,Sname 学生姓名 ,t1.Sno 学号 ,grade 成绩
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno
	   where Sdept = '计算机科学与技术'

select Sname 学生姓名 ,t1.Sno 学号 ,Cno 课程号
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno
	   where Cno = 'Cs1002'

select Cno 课程号
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno
	   where grade > (select AVG(grade) 平均成绩  
							from Score t1 join student t2
							on t1 .Sno = t2.Sno 		)
	   group by Cno 

select distinct Sname 学生姓名  ,age 年龄
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno
	   where age <= (select age 某一学生  
							from  student  
							where age = '23'	)
							
select distinct Sname 学生姓名  ,age 年龄
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno
	   where age < (select min(age) 最小年龄  
							from  student  
							where Sdept = '计算机科学与技术'	)

select distinct Sname 学生姓名 ,Cno
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno
	   where Cno = 'Cs1001'


select distinct Sname 学生姓名 ,Cno
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno
	   where not  Cno = 'Cs1001'

select distinct Sname 学生姓名 ,Cno
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno

select t2.Sno 学生号码
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
	where not age <= 19 and  Sdept = '计算机科学与技术'
	   intersect
	   select distinct age 所有学生年龄
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno

select Cno 课程一  , SName
	from Score t1 join student t2
	on t1 .Sno = t2.Sno
	where Cno = 'Cs1001'
	   Union
	   select Cno 课程二  , SName
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno
	   where Cno = 'Cs1002'



		select age 
			from Score t1 join student t2
			on t1 .Sno = t2.Sno
			WHERE Sdept = '计算机科学与技术'
		EXCEPT
			   select age
			from Score t1 join student t2
			on t1 .Sno = t2.Sno
			where  age <= 19 




			select distinct age
	from Score t1 join student t2
	on t1 .Sno = t2.Sno
	where  Sdept = '计算机科学与技术'
	   Union
	   select distinct age 所有学生年龄
	   from Score t1 join student t2
	   on t1 .Sno = t2.Sno
     where not age <= 19 

			

