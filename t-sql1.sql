use study
go
/*
select score 数据库分数 from sc 
	where sid = '16210120725'and cno = 'CS3019'
*/

declare @grade int
select @grade = score from sc 
	where sid = '16210120725'and cno = 'CS3019'
	--print '数据库成绩'+ convert(char,@grade)
if @grade < 60
	print ' 不合格 '--+ convert(char,@grade)
else
if(  @grade >80 )
		print ' 良好'--+ convert(char,@grade)
else 
if( @grade > 90 )
			print ' 优秀'--+ convert(char,@grade)

--编写函数，实现输出某同学的平均成绩
create function f_avg(@v_sid char(12))
returns numeric(6,2)
as
begin
declare
	@avgscore numeric(12,2)
	select @avgscore = AVG(score) from sc
	where sid = @v_sid
	return @avgscore
end


print dbo.f_avg('16210120715')

drop function f_avg
go 
create function f_avg(@v_sid char(12))
returns numeric(6,2)
as
begin
declare
	@avgscore numeric(12,2)
	select @avgscore = AVG(score) from sc
	where sid = @v_sid
	return @avgscore
end

declare 
@test numeric(6,2);
set @test = dbo.f_avg('16210120725')
print @test

drop function f_addGrade

create function f_addGrade(@v_score char(12))
returns numeric(6,2)
as
begin
declare
	@last numeric(12,2)
	select @last = dbo.f_avg('16210120725')+ dbo.f_avg('16210120725')*0.1
	print @last
	return @last
end

drop procedure pro_updatescore
create procedure pro_updatescore
as
begin
	update sc set score = score *1.1
		where score >= 75 and score < 90
	update sc set score = score *1.15
		where score >= 60 and score < 75
	update sc set score = score *1.2
		where score <60
end

exec pro_updatescore

---设计存储过程

create procedure pro_Grade(@p_sid char(12))
as
begin
	declare @sname varchar(50),@maxCno int,@maxGrade numeric(12,2),@maxGrade numeric(12,2)
	  select @sname = sname from student 
		where sid = @p_sid
	  select @maxCno = count(cno) from course
	  select @maxGrade = sum(score) from sc
		where sid = @p_sid
	  select @maxGrade = avg(score) from sc
		where sid = @p_sid
end

exec pro_Grade'16210120715'
print @maxCno + @maxGrade +@maxGrade
drop   procedure pro_Grade; 

create procedure pro_printinfo(@sid char(12))
 as
 declare
  @sname varchar(50);
  @cname varchar(50);
  @score numeric(6,2);
  declare  cur_cno cursor for select cname,score from sc 
      inner join course
    on sc.cno=course.cno        
	where sno=@sid; 
begin  --根据学号查询到对应的姓名
   select  @sname=sname from student where 
      sid=@sid;
   select @cname=cname,@score=score from sc 
      inner join course
    on sc.cno=course.cno;
     where sno=@sid;   
 end;
drop   procedure pro_printinfo;   
 create procedure pro_printinfo(@sid char(12))
 as
 declare
  @sname varchar(50),
  @cname varchar(50),
  @score numeric(6,2);
  declare  cur_cno cursor for 
  select cname,score from sc 
    join course
    on sc.cno=course.cno    
	where sid=@sid; --1、定义游标
begin 				--根据学号查询到对应的姓名
   select  @sname=sname from student where 
      sid=@sid;
   print '亲爱的'+@sname+'同学:';
   print'你在本学期考试中成绩如下：'
   open cur_cno ;--2、打开游标
   fetch next from cur_cno into @cname,@score;
   while (@@Fetch_Status = 0)
    begin 
       print @cname +convert(char,@score);
       fetch next from cur_cno into @cname,@score;
   end   
   close cur_cno;
   Deallocate cur_cno;
end;   
exec pro_printinfo '16210120715'