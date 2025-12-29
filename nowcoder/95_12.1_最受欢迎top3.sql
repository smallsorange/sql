select cid,pv,time_len
from (
select c.cid,count(uid) as pv,avg(score) as average_score,sum(timestampdiff(minute,start_time,end_time)) time_len
from play_record_tb p join course_info_tb c on p.cid=c.cid
where datediff(date(start_time),release_date)<=7
group by cid
) t
where average_score >=3
order by pv desc
limit 3
-- # 1.from p join c 
-- # 2.where datediff(date(start_time),release_date)<=7. date_sub()
-- # 3.group by cid
-- # 4.count,avg,sum(timestampdiff)
-- # 5.from 子查询
-- # 6.where 
1.连接表 join 
2.where筛选条件 release_date<=7
3.
