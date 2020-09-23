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
   --����ѧ�Ų�ѯ����Ӧ������
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
	where sid=@sid; --1�������α�
begin 
					--����ѧ�Ų�ѯ����Ӧ������
   select  @sname=sname from student where 
      sid=@sid;
   print '�װ���'+@sname+'ͬѧ:';
   open cur_cno ;--2�����α�
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
 l_id int identity(1,1) primary key,--��ˮ��
 l_user varchar(50) not null,--�����û�
 l_date datetime default getdate(),--����ʱ��
 l_sid char(12),
 l_cno char(6),
 l_before int,--����ǰ����
 l_after int,--���ĺ����
 l_remark varchar(50)
 ) 
 --������1
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

  --������2
  
  --alter
  create trigger tr_delsc
  on sc 
  Instead of delete
  as
  declare @i int;
  begin
	select @i= count(*)from deleted
	if(@i>=1)
	raiserror('���ݲ���ɾ��',16,1)
	insert into sc_log(l_user,l_remark)
		values(USER_NAME(),'��Ҫɾ������')
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

