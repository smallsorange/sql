select user_id,sum(floor(timestampdiff(minute,visit_time,leave_time)/10)) as point
from visit_tb 
group by user_id
order by point desc

-- learn
-- floor(timestampdiff(minute,visit_time,leave_time)/10)) 以分钟计算时间差距
-- ceiling向上取整 floor向下取整（非四舍五入） round（，0）会四舍五入 

-- dateadd(date interval 7 day)
-- date_sub(date,interval 7 day)
-- datediff('11-09','11-01') 返回两个日期之间的day差距
-- sql server写法DATEDIFF(DAY, '2025-11-01', '2025-11-09')
-- timestampdiff(minute,date1,date2) date2-date1

-- EXTRACT(YEAR FROM date)
-- DATE_FORMAT(date, '%Y-%m-%d')
