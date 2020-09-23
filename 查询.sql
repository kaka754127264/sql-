select * from t_user
	where usex= 'M'and uiid like '1207%'

select uiid,uname ,usex
	from t_user
	where usex= 'M'and uiid like '1207%'
	order by uiid desc          --asc/desc


select gid,gname,gprice
	from t_goods where gprice>5

SELECT * FROM t_user 
	where uname like 'Àî%'

select * from t_user
	where uname like 'Àî_'

select uname,ubirthday,usex
	from t_user
	where uname like '%·å%'

select gname,gprice from t_goods
	where gprice>3 and gprice<7
	order by gprice desc 
	 
select odatetime,omid,uiid,onum
	 from t_order