create procedure pro_printinfo(@sid char(12))
 as
 declare
  @sname varchar(50);
  @cname varchar(50);
  @score numeric(6,2);
  declare  cur_cno cursor for select cname,score from sc 
      inner join course
    on sc.cno=course.cno        where sno=@sid; 
begin 
   --根据学号查询到对应的姓名
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
  declare  cur_cno cursor for select cname,score from sc 
      inner join course
    on sc.cno=course.cno    
	where sid=@sid; --1、定义游标
begin 
					--根据学号查询到对应的姓名
   select  @sname=sname from student where 
      sid=@sid;
   print '亲爱的'+@sname+'同学:';
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
   
exec pro_printinfo '16210120715';   



drop table sc_log
create table sc_log(
 l_id int identity(1,1) primary key,--流水号
 l_user varchar(50) not null,--操作用户
 l_date datetime default getdate(),--操作时间
 l_sid char(12),
 l_cno char(6),
 l_before int,--更改前分数
 l_after int,--更改后分数
 l_remark varchar(50)
 ) 
 --触发器1
 create trigger tr_update_log
 on sc after update
 as 
 declare @v_before int ,@v_after int;
 begin
 select @v_before = score from inserted;
 select @v_after = score from deleted;
	insert into sc_log(l_user,l_before,l_after)
		values(USER_NAME(),@v_before,@v_after);
 end;

 update sc
  set score = '91'
  where sid = '16210120715'

  --触发器2
  
  --alter
  create trigger tr_delsc
  on sc 
  Instead of delete
  as
  declare @i int;
  begin
	select @i= count(*)from deleted
	if(@i>=1)
	raiserror('数据不许删除',16,1)
	insert into sc_log(l_user,l_remark)
		values(USER_NAME(),'想要删除数据')
  end

  DELETE  FROM SC 
	WHERE CNO = '16210120714'


CREATE trigger tr_update_log_new
on sc after update
as
declare @v_before int,@v_after int;
declare c_cur cursor for
select sid, cno,score from inserted
declare @sid char(12),@cno char(6);
begin
open c_cur
fetch next from c_cur into @sid,@cno,@v_after
while @@FETCH_STATUS=0
begin
	select @v_before=score  from deleted where sid = @sid and cno = @cno;
	insert into sc_log (l_user,l_sid,l_cno,l_before,l_after)
		values(USER_NAME(),@sid,@cno,@v_before,@v_after)
	fetch next from c_cur into @sid,@cno,@v_after
end
close c_cur;
Deallocate c_cur
end

