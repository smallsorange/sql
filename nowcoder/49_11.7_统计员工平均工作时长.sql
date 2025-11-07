select post,round(avg(timestampdiff(minute,first_clockin,last_clockin)/60),3) as work_hours
from staff_tb as s left join attendent_tb as a on s.staff_id=a.staff_id
group by post
order by 
-- 1.连接表从表中获取数据
-- 2.按照post进行分组
-- 3.select round(avg(timestampdiff(minute,first_clockin,last_clockin)/60),3) as work_hours
--   timestampdiff(minute,A,B)
--   avg取得平均,round
